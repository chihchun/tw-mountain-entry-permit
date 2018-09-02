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

# 熱門地點
location_db  %>%
  filter(year == 2018) %>% 
  group_by(mountain) %>%
  summarise(n = n()) %>%
  arrange(mountain, .by_group = TRUE) %>%
  filter(n > 1500) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "2018 年 8 月以前山地管制區超過三千次申請之熱門山區", caption ="資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2018 年山地管制區超過三千次申請之熱門山區.png", plot = last_plot(), device = "png", dpi = 600)

location_db  %>%
  filter(year == 2017) %>% 
  group_by(mountain) %>%
  summarise(n = n()) %>%
  arrange(mountain, .by_group = TRUE) %>%
  filter(n > 3000) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "2017 年山地管制區超過三千次申請之熱門山區", caption ="資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2017 年山地管制區超過三千次申請之熱門山區.png", plot = last_plot(), device = "png", dpi = 600)

# 2016
location_db  %>%
  filter(year == 2016) %>% 
  group_by(mountain) %>%
  summarise(n = n()) %>%
  arrange(mountain, .by_group = TRUE) %>%
  filter(n > 3000) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "2016 年山地管制區超過三千次申請之熱門山區", caption ="資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2016 年山地管制區超過三千次申請之熱門山區.png", plot = last_plot(), device = "png", dpi = 600)

# 2015
location_db  %>%
  filter(year == 2015) %>% 
  group_by(mountain) %>%
  summarise(n = n()) %>%
  arrange(mountain, .by_group = TRUE) %>%
  filter(n > 3000) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "2015 年山地管制區超過三千次申請之熱門山區", caption ="資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2015 年山地管制區超過三千次申請之熱門山區.png", plot = last_plot(), device = "png", dpi = 600)

# 2014
location_db  %>%
  filter(year == 2014) %>% 
  group_by(mountain) %>%
  summarise(n = n()) %>%
  arrange(mountain, .by_group = TRUE) %>%
  filter(n > 3000) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "2014 年山地管制區超過三千次申請之熱門山區", caption ="資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2014 年山地管制區超過三千次申請之熱門山區.png", plot = last_plot(), device = "png", dpi = 600)

# 2013
location_db  %>%
  filter(year == 2013) %>% 
  group_by(mountain) %>%
  summarise(n = n()) %>%
  arrange(mountain, .by_group = TRUE) %>%
  filter(n > 3000) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "2013 年山地管制區超過三千次申請之熱門山區", caption ="資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2013 年山地管制區超過三千次申請之熱門山區.png", plot = last_plot(), device = "png", dpi = 600)

# 2012
location_db  %>%
  filter(year == 2012) %>% 
  group_by(mountain) %>%
  summarise(n = n()) %>%
  arrange(mountain, .by_group = TRUE) %>%
  filter(n > 3000) %>%
  ggplot() + 
  geom_col(aes(x = mountain, y=n), show.legend = TRUE) +
  labs(title = "2012 年山地管制區超過三千次申請之熱門山區", caption ="資料來源內政部警政署 20180901") +
  xlab("山區") +
  ylab("申請次數") +
  geom_text(stat='identity', aes(label=n, x=mountain, y=n), vjust  = 2) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("201808/chart/2012 年山地管制區超過三千次申請之熱門山區.png", plot = last_plot(), device = "png", dpi = 600)

# filter(mountain != '慕谷慕魚') %>%
# filter(mountain != '清水溪上游') %>%
  
