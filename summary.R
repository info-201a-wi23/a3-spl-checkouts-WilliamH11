# load library
library(dplyr)

# import dataset
df <- read.csv("/Users/williamhardjanto/Desktop/info201/coding/assignment/a3-spl-checkouts-WilliamH11/Checkouts_by_Title.csv")

# total checkout of all item and most common checkout
totalCheckout <- sum(df$Checkouts)

tc_item <- df %>% group_by(Title) %>% 
  summarise(checkoutNum = sum(Checkouts)) %>% 
  filter(checkoutNum == max(checkoutNum))

# average checkout for every single year and overall
averageCheckout <- df %>% group_by(CheckoutYear) %>%
  summarize(totalCheckouts = sum(Checkouts), meanCheckoutsPerMonth = mean(Checkouts)) %>% 
  round(digits = 1)

meanCheckout <- df %>% 
  summarize(totalCheckouts = sum(Checkouts), meanCheckoutsPerYear = mean(Checkouts)) %>% 
  round(digits = 1)

# most popular material type
count_material <- df %>%  group_by(MaterialType) %>% 
  summarise(amount = sum(Checkouts))

mp_material <- count_material %>% 
  filter(amount == max(amount)) %>% 
  pull(MaterialType, amount)

# peak checkout month every year
peakCheckout <- df %>% 
  group_by(CheckoutYear, CheckoutMonth) %>% 
  summarize(totalCheckouts = sum(Checkouts)) %>% 
  filter(totalCheckouts == max(totalCheckouts)) %>% 
  select(CheckoutYear, CheckoutMonth, totalCheckouts)

# lowest checkout year and month
lowestCheckout <- df %>% 
  group_by(CheckoutYear, CheckoutMonth) %>% 
  summarize(totalCheckouts = sum(Checkouts)) %>% 
  filter(totalCheckouts == min(totalCheckouts)) %>% 
  select(CheckoutYear, CheckoutMonth, totalCheckouts)

