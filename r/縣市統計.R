# install.packages("dplyr")
# install.packages("dbplyr")
# install.packages("git2r")
# install.packages("devtools")
# library(devtools)
# devtools::install_github('cttobin/ggthemr')

library(DBI)
library(dplyr)
library(dbplot)
library(ggplot2)

con <- dbConnect(RSQLite::SQLite(), "201808/data.db")
location_db <- tbl(con, "location")

# Theme 
library('ggthemr')
ggthemr('grass')




# 各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year != 2018 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2012-2017 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2012-2017 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 2018 年各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year == 2018 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2018 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2018 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 2017 年各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year == 2017 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2017 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2017 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 2016 年各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year == 2016 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2016 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2016 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 2015 年各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year == 2015 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2015 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2015 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)


# 2014 年各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year == 2014 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2014 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2014 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 2013 年各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year == 2013 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2014 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2013 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 2012 年各縣市山地管制區申請統計
dbGetQuery(con, '
SELECT DISTINCT id, city FROM location WHERE year == 2013 AND id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")'
) %>%
  group_by(city) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = city, y=n), show.legend = TRUE) +
  labs(title = "2012 年各縣市山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=city, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2012 年各縣市山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

