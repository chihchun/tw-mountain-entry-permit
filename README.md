
# 分析內政部警政署歷年申請進入山地管制區統計資料

小程式將內政部警政署歷年申請進入山地管制區統計資料之 CSV 檔案轉成 SQLite 資料庫，供後續分析與視覺化。

This script parse the csv of Mountain Entry Permit applications into SQLite database, the policy permit regulated by National Security Law is needed for trekking in Taiwan.

## 使用方法
```bash
$ python3 ./parse.py data/*csv
```

## 資料來源

* 申請進入山地管制區統計資料 - https://data.gov.tw/dataset/41416
* 歷年申請進入山地管制區統計資料 - https://data.gov.tw/dataset/57021

原始資料來源授權為政府資料開放授權條款－第1版。
The dataset is licensed under Open Government Data License, version 1.0.
