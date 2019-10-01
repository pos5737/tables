
# load package
library(tidyverse)
library(kableExtra)

# load nominate data
df <- read_rds("data/nominate.rds")

# compute ave and SD for each party and state
smry_df <- df %>%
  group_by(party, congress) %>%
  summarize(ave = mean(ideology, na.rm = TRUE)) %>%
  glimpse()

# wrangle data into nice table format
tab_df <- smry_df %>% 
  # pivot the party variable into columns
  pivot_wider(names_from = party, values_from = ave) %>%
  # rename variables
  rename(Congress = congress) %>%
  glimpse()

# create basic latex table with kable
k <- tab_df %>%
  kable(format = "latex", booktabs = TRUE, digits = 2) %>%
  kable_styling(position = "center")
# for more, see https://haozhu233.github.io/kableExtra/awesome_table_in_pdf.pdf

# write table as png, convenient for browsing
k %>% save_kable("doc/tab/ave-by-party-congress.png")

# write table as .tex for LaTeX \input
k %>% cat(file = "doc/tab/ave-by-party-congress.tex")
