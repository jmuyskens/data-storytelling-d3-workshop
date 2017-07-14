library(dplyr)
library(tidyr)
library(here)
library(ggplot2)
here()
life.expectancy <- read.csv(here("oecd_life_expectancy.csv"))
health.spending <- read.csv(here("oecd_health_spending.csv"))

oecd <-
  health.spending %>%
  bind_rows(life.expectancy) %>%
  select(LOCATION, TIME, INDICATOR, Value) %>%
  spread(INDICATOR, Value) %>%
  filter(TIME > 1970)
  
write.csv(oecd, "oecd.csv")