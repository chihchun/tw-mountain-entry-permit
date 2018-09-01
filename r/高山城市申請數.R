# install.packages("dplyr")
# install.packages("dbplyr")

library(DBI)
library(dplyr)
library(dbplot)
library(ggplot2)

con <- dbConnect(RSQLite::SQLite(), "201808/data.db")
location_db <- tbl(con, "location")

# 臺中市歷年申請進入山地管制區統計
location_db %>% 
  filter(city == '臺中市') %>%
  filter(year != '2018') %>%
  group_by(year) %>%
  tally() %>%
  collect() %>%
  ggplot() + 
  geom_col(aes(x=factor(year), y=n)) +
  labs(title = "臺中市歷年申請進入山地管制區統計", caption ="資料來源內政部警政署 20180901") +
  xlab("年份") +
  ylab("申請數") +
  coord_cartesian(ylim=c(0, 34000)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +
  geom_text(aes(label=n, x=factor(year), y=n), vjust = 2) 
ggsave("201808/chart/臺中市歷年申請進入山地管制區統計.png", plot = last_plot(), device = "png", dpi = 600)


# 花蓮縣歷年申請進入山地管制區統計
location_db %>% 
  filter(city == '花蓮縣') %>%
  filter(year != '2018') %>%
  group_by(year) %>%
  tally() %>%
  collect() %>%
  ggplot() + 
  geom_col(aes(x=factor(year), y=n)) +
  labs(title = "花蓮縣歷年申請進入山地管制區統計", caption ="資料來源內政部警政署 20180901") +
  xlab("年份") +
  ylab("申請數") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +
  geom_text(aes(label=n, x=factor(year), y=n), vjust = 2) 
ggsave("201808/chart/花蓮縣歷年申請進入山地管制區統計.png", plot = last_plot(), device = "png", dpi = 600)


# 花蓮縣歷年申請進入山地管制區統計
location_db %>% 
  filter(city == '花蓮縣') %>%
  filter(year != '2018') %>%
  filter(mountain != '慕谷慕魚') %>%
  filter(mountain != '清水溪上游') %>%
  group_by(year) %>%
  tally() %>%
  collect() %>%
  ggplot() + 
  geom_col(aes(x=factor(year), y=n)) +
  labs(title = "花蓮縣歷年申請進入山地管制區統計 (扣去慕谷慕魚,清水溪上游)", caption ="資料來源內政部警政署 20180901") +
  xlab("年份") +
  ylab("申請數") +
  coord_cartesian(ylim=c(0, 34000)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +
  geom_text(aes(label=n, x=factor(year), y=n), vjust = 2) 
ggsave("201808/chart/花蓮縣歷年申請進入山地管制區統計-扣去慕谷慕魚,清水溪上游.png", plot = last_plot(), device = "png", dpi = 600)


# 南投縣歷年申請進入山地管制區統計
location_db %>% 
  filter(city == '南投縣') %>%
  filter(year != '2018') %>%
  group_by(year) %>%
  tally() %>%
  collect() %>%
  ggplot() + 
  geom_col(aes(x=factor(year), y=n)) +
  labs(title = "南投縣歷年申請進入山地管制區統計", caption ="資料來源內政部警政署 20180901") +
  xlab("年份") +
  ylab("申請數") +
  coord_cartesian(ylim=c(0, 34000)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +
  geom_text(aes(label=n, x=factor(year), y=n), vjust = 2) 
ggsave("201808/chart/南投縣歷年申請進入山地管制區統計.png", plot = last_plot(), device = "png", dpi = 600)
