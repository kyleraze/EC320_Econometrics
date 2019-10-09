library(pacman)
p_load(tidyverse, readxl, janitor, crosswalkr)

# drug poisoning deaths
deaths <- read_csv("02-Introduction_tidyverse/CDC_state_drug_poisoning_deaths.csv") %>% 
  clean_names() %>% 
  select(state, year, deaths, population) %>% 
  filter(!is.na(state)) %>% 
  rename(stname = state)

# poverty/unemployment
poverty <- read_excel("02-Introduction_tidyverse/UKCPR_National_Welfare_Data_Update_060519.xlsx", 
                      sheet = "Data") %>% 
  clean_names() %>% 
  select(state_name, year, poverty_rate, unemployment_rate) %>% 
  filter(year >= 1999) %>% 
  rename(stabbr = state_name)

stcrosswalk <- get(data(stcrosswalk)) %>% 
  mutate(division = cendivnm, region = cenregnm, state = as.numeric(stfips)) %>% 
  select(division, region, stabbr, stname)

deaths <- left_join(deaths, stcrosswalk, by = "stname")

deaths <- left_join(deaths, poverty, by = c("stabbr", "year"))

rm(stcrosswalk, poverty)

write_csv(deaths, "02-Introduction_tidyverse/02-Introduction_tidyverse_data.csv")
