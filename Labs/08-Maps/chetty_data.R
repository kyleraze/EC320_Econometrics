library(pacman)
p_load(tidyverse, janitor)


# HS grad rates -----------------------------------------------------------

hs_p25 <- read_csv("~/Data/Chetty/county_data/cty_hs_rP_gP_p25.csv") %>% 
  mutate(value = High_School_Graduation_Rate_rP_gP_p25,
         variable = "hs_grad",
         parent_inc = "Low",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

hs_p50 <- read_csv("~/Data/Chetty/county_data/cty_hs_rP_gP_p50.csv") %>% 
  mutate(value = High_School_Graduation_Rate_rP_gP_p50,
         variable = "hs_grad",
         parent_inc = "Middle",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

hs_p75 <- read_csv("~/Data/Chetty/county_data/cty_hs_rP_gP_p75.csv") %>% 
  mutate(value = High_School_Graduation_Rate_rP_gP_p75,
         variable = "hs_grad",
         parent_inc = "High",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

hs <- bind_rows(hs_p25, hs_p50, hs_p75)
rm(hs_p25, hs_p50, hs_p75)


# Incarceration data ------------------------------------------------------

jail_p25 <- read_csv("~/Data/Chetty/county_data/cty_jail_rP_gP_p25.csv") %>% 
  mutate(value = Incarceration_Rate_rP_gP_p25,
         variable = "incarceration",
         parent_inc = "Low",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)
  
jail_p50 <- read_csv("~/Data/Chetty/county_data/cty_jail_rP_gP_p50.csv") %>% 
  mutate(value = Incarceration_Rate_rP_gP_p50,
         variable = "incarceration",
         parent_inc = "Middle",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

jail_p75 <- read_csv("~/Data/Chetty/county_data/cty_jail_rP_gP_p75.csv") %>% 
  mutate(value = Incarceration_Rate_rP_gP_p75,
         variable = "incarceration",
         parent_inc = "High",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

jail <- bind_rows(jail_p25, jail_p50, jail_p75)
rm(jail_p25, jail_p50, jail_p75)


# Income data -------------------------------------------------------------

inc_p25 <- read_csv("~/Data/Chetty/county_data/cty_kfr_rP_gP_p25.csv") %>% 
  mutate(value = Household_Income_rP_gP_p25,
         variable = "hh_income",
         parent_inc = "Low",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

inc_p50 <- read_csv("~/Data/Chetty/county_data/cty_kfr_rP_gP_p50.csv") %>% 
  mutate(value = Household_Income_rP_gP_p50,
         variable = "hh_income",
         parent_inc = "Middle",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

inc_p75 <- read_csv("~/Data/Chetty/county_data/cty_kfr_rP_gP_p75.csv") %>% 
  mutate(value = Household_Income_rP_gP_p75,
         variable = "hh_income",
         parent_inc = "High",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

inc <- bind_rows(inc_p25, inc_p50, inc_p75)
rm(inc_p25, inc_p50, inc_p75)

t20_p25 <- read_csv("~/Data/Chetty/county_data/cty_kfr_top20_rP_gP_p25.csv") %>% 
  clean_names() %>% 
  mutate(value = frac_in_top_20_percent_based_on_household_income_r_p_g_p_p25,
         variable = "hh_income_t20",
         parent_inc = "Low",
         county_name = name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

t20_p50 <- read_csv("~/Data/Chetty/county_data/cty_kfr_top20_rP_gP_p50.csv") %>% 
  clean_names() %>% 
  mutate(value = frac_in_top_20_percent_based_on_household_income_r_p_g_p_p50,
         variable = "hh_income_t20",
         parent_inc = "Middle",
         county_name = name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

t20_p75 <- read_csv("~/Data/Chetty/county_data/cty_kfr_top20_rP_gP_p75.csv") %>% 
  clean_names() %>% 
  mutate(value = frac_in_top_20_percent_based_on_household_income_r_p_g_p_p75,
         variable = "hh_income_t20",
         parent_inc = "High",
         county_name = name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

t20 <- bind_rows(t20_p25, t20_p50, t20_p75)
rm(t20_p25, t20_p50, t20_p75)


# Teen pregnancy ----------------------------------------------------------

teen_p25 <- read_csv("~/Data/Chetty/county_data/cty_teenbirth_rP_gF_p25.csv") %>% 
  mutate(value = Teenage_Birth_Rate_women_only_rP_gF_p25,
         variable = "teen_birth",
         parent_inc = "Low",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

teen_p50 <- read_csv("~/Data/Chetty/county_data/cty_teenbirth_rP_gF_p50.csv") %>% 
  mutate(value = Teenage_Birth_Rate_women_only_rP_gF_p50,
         variable = "teen_birth",
         parent_inc = "Middle",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

teen_p75 <- read_csv("~/Data/Chetty/county_data/cty_teenbirth_rP_gF_p75.csv") %>% 
  mutate(value = Teenage_Birth_Rate_women_only_rP_gF_p75,
         variable = "teen_birth",
         parent_inc = "High",
         county_name = Name,
         fips = cty) %>% 
  select(fips, county_name, parent_inc, variable, value)

teen <- bind_rows(teen_p25, teen_p50, teen_p75)
rm(teen_p25, teen_p50, teen_p75)


# Join --------------------------------------------------------------------

county_data <- bind_rows(hs, jail, teen, t20, inc)

county_data <- county_data %>% 
  spread(variable, value) %>% 
  mutate(fips = str_remove(fips, "cty"),
         fips = as.numeric(fips))

write_csv(county_data, "08-Maps/social_mobility.csv")
  
