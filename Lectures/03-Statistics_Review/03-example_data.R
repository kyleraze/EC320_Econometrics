library(pacman)
p_load(tidyverse, wooldridge)

# load data from the 'wooldridge' package
data <- get('wagepan')

# create untidy data
data <- data %>% 
  mutate(wage = exp(lwage),
         earnings = hours*wage,
         worker_id = nr) %>% 
  select(worker_id, year, educ, exper, earnings, union, black) %>% 
  gather(`educ`, `exper`, `earnings`, `union`, `black`, key = "variable", value = "value")

write_csv(data, "03-example_data.csv")
