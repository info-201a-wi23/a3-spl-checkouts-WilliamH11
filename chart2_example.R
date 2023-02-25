# load libraries
library(dplyr)
library(ggplot2)
library(tidyr)

# import dataset
df <- read.csv("/Users/williamhardjanto/Desktop/info201/coding/assignment/a3-spl-checkouts-WilliamH11/Checkouts_by_Title.csv")

#number of unique usageclass per year

# Aggregate checkouts by year and type
checkout_summary <- df %>% 
  group_by(CheckoutYear, UsageClass) %>% 
  summarize(total_checkouts = sum(Checkouts)) %>% 
  filter(UsageClass %in% c("Physical", "Digital")) # Only include physical and digital checkouts

# Create line plot
library(ggplot2)
ggplot(checkout_summary, aes(x = CheckoutYear, y = total_checkouts, color = UsageClass)) +
  geom_line() +
  labs(x = "Year", y = "Total checkouts", color = "Material type") +
  scale_color_manual(values = c("Physical" = "blue", "Digital" = "red"))

