# install.packages("dplyr")
# install.packages("dbplyr")

library(DBI)
library(dplyr)
library(dbplot)
library(ggplot2)
library('ggthemr')
ggthemr('grass')

# 歷年申請進入山地管制區統計 美化版
con <- dbConnect(RSQLite::SQLite(), "201808/data.db")

tbl(con, "applications") %>% 
  ggplot() +
  geom_bar(aes(x = factor(year)), stat = "count") + 
  labs(title = "歷年申請進入山地管制區統計", caption ="資料來源內政部警政署 20180901") +
  xlab("年份") +
  ylab("申請數") +
  coord_cartesian(ylim=c(0,150000)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +
  geom_text(stat='count',aes(label=..count.., x=factor(year)), vjust=2)
ggsave("201808/chart/歷年申請進入山地管制區統計.png", plot = last_plot(), device = "png", dpi = 600)


dbGetQuery(con, '
SELECT * FROM applications WHERE year != "2018" 
           AND plan != "慕谷慕魚(花蓮縣秀林鄉)" 
           AND plan != "清水溪上游(花蓮縣秀林鄉)"
           AND plan != "砂婆澢溪(花蓮縣秀林鄉)"
') %>% 
  ggplot() +
  geom_bar(aes(x = factor(year)), stat = "count") + 
  labs(title = "歷年申請進入山地管制區統計", caption ="扣去慕谷慕魚,清水溪上游,砂婆澢溪。資料來源內政部警政署 20180901") +
  xlab("年份") +
  ylab("申請件數") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(stat='count',aes(label=..count.., x=factor(year)), vjust=2)
ggsave("201808/chart/歷年申請進入山地管制區統計-扣去慕谷慕魚,清水溪上游,砂婆澢溪.png", plot = last_plot(), device = "png", dpi = 600)

  