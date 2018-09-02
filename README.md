
# 分析內政部警政署歷年申請進入山地管制區統計資料

小程式將內政部警政署歷年申請進入山地管制區統計資料之 CSV 檔案轉成 SQLite 資料庫，供後續分析與視覺化。

This script parse the csv of Mountain Entry Permit applications into SQLite database, the policy permit regulated by National Security Law is needed for trekking in Taiwan.

## 使用方法
```bash
$ python3 ./parse.py data/*csv
```

### 使用 RStudio 分析資料
可以透過 docker 運行 rstudio 環境，預設沒有安裝中文字形與開發工具，請手動為 docker instance 安裝相關軟體，才能正常安裝相關 R package.
```bash
docker run --rm -n rstudio -v `pwd`:/home/rstudio/201808 -e PASSWORD=rstudio -p 8787:8787 rocker/rstudio
docker exec -t -i rstudio apt update
docker exec -t -i rstudio apt install -y zlib1g-dev fonts-noto-cjk
```

R Script 工作目錄位於 R

## 資料來源

* 申請進入山地管制區統計資料 - https://data.gov.tw/dataset/41416
* 歷年申請進入山地管制區統計資料 - https://data.gov.tw/dataset/57021

原始資料來源授權為政府資料開放授權條款－第1版。
The dataset is licensed under Open Government Data License, version 1.0.
