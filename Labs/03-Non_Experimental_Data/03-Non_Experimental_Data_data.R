library(pacman)
p_load(tidyverse, haven)

cps <- read_dta("03-Non_Experimental_Data/cps.dta") %>% 
  rename(educ = education, 
         exper = yearsexp) %>% 
  mutate(educ = case_when(educ == 0 ~ "Not Reported",
                          educ == 1 ~ "HS Dropout",
                          educ == 2 ~ "HS Graduate",
                          educ == 3 ~ "Some College",
                          educ == 4 ~ "College or Higher"))

write_csv(cps, "03-Non_Experimental_Data/03-Non_Experimental_Data_data.csv")
