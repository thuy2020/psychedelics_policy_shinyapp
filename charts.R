library(ggplot2)
library(plotly)
library(ggimage)
library(forcats)
library(wesanderson)
source("data_cleaning.R")

anderson_palette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

american_psilocybin %>% 
  ggplot(aes(year, percent_ever_used_psilocybin)) +
  geom_line(size = 2, color = "#D55E00") +
  theme_minimal() +
  labs(x = "", y = "Percent ever used psilocybin") +
  theme(legend.position = "none") -> p_american

plotly_american <- ggplotly(p_american, tooltip = c("year", "y", "fill"))

# OR crime
ORcrime %>% 
  filter(cat != "other") %>% 
  ggplot(aes(year, value, group = cat, fill = cat)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = wes_palette("IsleofDogs1")) +
  theme_minimal() +
  labs(x = "", y = "") +
  theme(legend.position = "none") -> p_ORcrime

plotly_ORcrime <- ggplotly(p_ORcrime, tooltip = c("year", "y", "fill"))

# OR psilocybin

ORpsilocybin %>% 
  mutate(licence = str_to_title(licence)) %>% 
  ggplot(aes(fct_reorder(licence, count), count, 
             fill = as.factor(fct_reorder(licence, count)))) +
  geom_col() +
  coord_flip()+
  scale_fill_manual(values = anderson_palette) +
  theme_minimal() +
  labs(x = "", y = "Count of licence",
       caption = "As of 4/15/2024") +
  theme(legend.position = "none") -> p_ORpsilocybin

plotly_ORpsilocybin <- ggplotly(p_ORpsilocybin, 
                              tooltip = c("licence", "count"))

# CO

COcrime_DUI %>% 
  ggplot(aes(as.factor(year), value, group = cat, fill = cat)) +
  geom_col(position = "dodge") +
   geom_segment(aes(x = 5, xend = 5, y = 280, 
                    yend = 240), 
                arrow = arrow(length = unit(0.2, "cm")), color = "red") +
   annotate("text", x = 5, y = 300, label = "Policy\nchange", color = "red", size = 3) +
  scale_fill_manual(values = wes_palette("Chevalier1")) +
  theme_minimal() +
  labs(x = "", y = "") +
  theme(legend.position = "none") -> p_COcrime

plotly_COcrime <- ggplotly(p_COcrime, tooltip = c("year", "y", "fill"))


COcrime_totaldrug %>% 
  ggplot(aes(year, hallucinogens)) +
  geom_col(fill = "orange") +
  theme_minimal() +
  labs(x = "", y = "") +
  theme(legend.position = "none") -> p_COhallucinogens

plotly_COhallucinogens <- ggplotly(p_COhallucinogens, tooltip = c("year", "y", "fill"))

CAhallucinogen %>%
  ggplot(aes(as.factor(year), total_hallucinogen_related_incidences)) +
  geom_col(fill = "#0072B2") +
  theme_minimal() +
  labs(x = "", y = "",
       title = "California: Total hallucinogen-related incidences") +
  theme(legend.position = "none") -> p_CAhallucinogen

plotly_CAhallucinogen <- ggplotly(p_CAhallucinogen, tooltip = c("year", "y", "fill"))


MAhallucinogens %>%
  ggplot(aes(as.factor(year), hallucinogens)) +
  geom_col(fill = "#CC79A7") +
  theme_minimal() +
  labs(x = "", y = "",
       title = "Massachusetts: Associated drugs with arrests") +
  theme(legend.position = "none") -> p_MAhallucinogen

plotly_MAhallucinogen <- ggplotly(p_MAhallucinogen, tooltip = c("year", "y", "fill"))



COinterview %>% 
  rename(count = n) %>% 
  mutate(categorized = str_to_sentence(categorized)) %>% 
  ggplot(aes(fct_reorder(categorized, count), count, fill = categorized)) +
  geom_col() +
  coord_flip()+
  theme_minimal() +
  scale_fill_discrete()+
  scale_fill_manual(values = wes_palette("AsteroidCity3")) +
  scale_y_continuous(breaks = seq(0, 10, by = 5)) +
  labs(x = "", y = "",
       title = "") +
  theme(legend.position = "none") -> p_COinterview

plotly_COinterview <- ggplotly(p_COinterview, tooltip = c("year", "y", "fill"))
