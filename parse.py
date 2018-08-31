#!/usr/bin/python3

import csv
import sys
import sqlite3
import re
import os

def parse(filename, c):
    csvreader = csv.reader(open(filename, 'r', encoding='UTF-8', newline=''), delimiter=',')
    for row in csvreader:
        # ignore headers
        try:
            if not int(row[0]): 
                continue
        except ValueError:
            continue

        # convert Minguo calendar to Gregorian Calendar
        match = re.search(r'(\d+)\w(\d+)\w(\d+)\w', row[1])
        year = "%d" % (1911+int(match.group(1)))
        date = "%s-%s-%s" % (year, match.group(2), match.group(3))
        applicationid = "%s-%s" % (year, row[0])
        people = row[3]
        c.execute("INSERT INTO applications VALUES ('%s','%s', '%s', %s, %s, '%s')" % (applicationid, date, year, row[2], people, row[4]))
        # break down locations as row in location table.
        for area in row[4].split("/"):
            match = re.search(r'(^[\w、()]+)\((\w{3})(\w+)\)$', area)
            if(match == None):
                # Yes, there is application going nowhere.
                continue
            # make you easy to read
            mountain = match[1]
            city = match[2]
            district = match[3]
            # mountain = area.split('(')[0]
            c.execute("INSERT INTO location VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (applicationid, date, year, people, row[4], city, district, mountain))

if __name__ == "__main__":
    # always recreate the db
    if os.path.exists("data.db"): 
        os.remove("data.db")

    conn = sqlite3.connect('data.db')
    c = conn.cursor()
    # Create table
    c.execute('''CREATE TABLE applications (id int, date text, year int, days int, people int, plan text)''')
    c.execute('''CREATE TABLE location (id int, date text, year int, people int, area text, city text, district text, mountain text)''')

    # parse every csv file passed in.
    for filename in sys.argv[1:]:
        parse(filename, c)

    # save the dataabse
    conn.commit()
    conn.close()
