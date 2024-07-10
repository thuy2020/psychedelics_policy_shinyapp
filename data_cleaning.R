library(dplyr)
library(janitor)
library(plotly)
library(tidyr)
library(stringr)

#sheet2
ORcrime <- rio::import("data/public health data (1).xlsx", sheet = "Oregon crime hallucinogen-relat")%>% 
  clean_names() %>% select(1:5) %>% drop_na() %>% 
  rename(violence_assault = people_eg_violence_assault) %>% 
  mutate(other = total_crime - dui - property - violence_assault) %>% 
  select(-total_crime) %>% 
  pivot_longer(cols = 2:5,
               names_to = "cat", 
               values_to = "value")

# OR
ORpsilocybin <- rio::import("data/public health data (1).xlsx", sheet = "oregon psilocybin")  %>% 
  select(1:2) %>% 
  rename(count = 2)

#sheet 3
COcrime_DUI <- rio::import("data/public health data (1).xlsx", sheet = "colorado drug crime - DUI")%>% 
  clean_names() %>% 
  select(1:5) %>% drop_na() %>% 
  rename(year = date) %>% 
  pivot_longer(cols = 2:4,
               names_to = "cat",
               values_to = "value")


#sheet4
#TODO: double check with Greg. Why 2 columns have same value?
COcrime_totaldrug <- rio::import("data/public health data (1).xlsx", sheet = "colorado drug crime - total dru")%>% 
  clean_names() %>% 
  rename(year = 1) %>% 
select(1:2) %>% drop_na()


#sheet5
american_psilocybin <- rio::import("data/public health data (1).xlsx", sheet = "american psilocybin users") %>% 
  clean_names() %>% select(1:2) %>% drop_na() %>% 
  mutate(percent_ever_used_psilocybin = round(percent_ever_used_psilocybin,1))


#sheet 6
CAhallucinogen <- rio::import("data/public health data (1).xlsx", sheet = "california hospital incidences ")%>% 
  clean_names() %>% select(1:2) %>% drop_na() 


#Sheet 8
MAhallucinogens <- rio::import("data/public health data (1).xlsx", sheet = "massachussetts crime")%>% 
  clean_names() %>% 
  rename(year = 1) %>% 
 select(1:2) %>% drop_na()

#sheet 9
COinterview <- rio::import("data/public health data (1).xlsx", sheet = "Colorado interviews")%>% 
  clean_names() %>% 
  select(categorized) %>% 
  mutate(categorized = str_to_lower(categorized),
         categorized = str_squish(categorized),
         categorized = as.factor(categorized)) %>% 
  drop_na() %>% 
  add_count(categorized) %>% distinct()

