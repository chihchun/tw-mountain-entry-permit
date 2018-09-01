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
