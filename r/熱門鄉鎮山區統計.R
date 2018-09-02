library(DBI)
library(dplyr)
library(dbplot)
library(ggplot2)

# Theme 
library('ggthemr')
ggthemr('grass')

con <- dbConnect(RSQLite::SQLite(), "201808/data.db")

# 各鄉鎮山地管制區申請統計
dbGetQuery(con, '
SELECT id, district FROM location WHERE id not in 
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")
') %>%
  group_by(district) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = district, y=n), show.legend = TRUE) +
  labs(title = "各鄉鎮山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31 (不包含慕谷慕魚、清水溪上游、砂婆澢溪) 資料來源內政部警政署 20180901") +
  xlab("區域") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=district, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/各鄉鎮山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 大同鄉
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "大同鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "大同鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/大同鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 復興鄉
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "復興鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "復興鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/復興鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 春日鄉
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "春日鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "春日鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/春日鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 泰安鄉
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "泰安鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "泰安鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/泰安鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 桃源區
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "桃源區" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "桃源區山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/桃源區山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 尖石鄉
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "尖石鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "尖石鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/尖石鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)


# 和平區
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "和平區" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "和平區山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/和平區山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 烏來區
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "烏來區" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "烏來區山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/烏來區山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 阿里山鄉
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "阿里山鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "阿里山鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/阿里山鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

# 秀林鄉
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "秀林鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "秀林鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31  資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/秀林鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)


dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "秀林鄉" AND id NOT IN
(SELECT id FROM applications WHERE plan == "慕谷慕魚(花蓮縣秀林鄉)" OR plan == "清水溪上游(花蓮縣秀林鄉)" OR plan == "砂婆澢溪(花蓮縣秀林鄉)")
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "秀林鄉山地管制區申請統計", caption ="時間範圍 2012-01-01~2018-08-31 (不包含慕谷慕魚、清水溪上游、砂婆澢溪) 資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/秀林鄉山地管制區申請統計-不包含慕谷慕魚、清水溪上游、砂婆澢溪.png", plot = last_plot(), device = "png", dpi = 600)


# 各鄉鎮山地管制區申請統計
dbGetQuery(con, '
SELECT id, mountain FROM location WHERE district = "仁愛鄉" 
') %>%
  group_by(mountain) %>%
  summarise(n = n()) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "仁愛鄉山地管制區申請統計", caption ="資料來源內政部警政署 20180901") +
  xlab("都市") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("201808/chart/仁愛鄉山地管制區申請統計.png", plot = last_plot(), device = "png", dpi = 600)

