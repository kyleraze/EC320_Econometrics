# Load packages and data --------------------------------------------------

library(pacman)
p_load(tidyverse, broom)

election_2016 <- read_csv("election_2016.csv")


# Data prep ---------------------------------------------------------------

election_2016 <- election_2016 %>% 
  mutate(trump_pct = trump/totalvotes*100,
         clinton_pct = clinton/totalvotes*100,
         trump_margin = trump_pct - clinton_pct)


# Analysis ----------------------------------------------------------------

reg1 <- lm(trump_margin ~ white, data = election_2016)
reg2 <- lm(trump_margin ~ poverty, data = election_2016)
reg3 <- lm(trump_margin ~ white + poverty, data = election_2016)

tidy(reg1)
tidy(reg2)
tidy(reg3)