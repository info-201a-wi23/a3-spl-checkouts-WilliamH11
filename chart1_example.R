# load libraries
library(dplyr)
library(ggplot2)
library(stringr)

# import dataset
df <- read.csv("/Users/williamhardjanto/Desktop/info201/coding/assignment/a3-spl-checkouts-WilliamH11/Checkouts_by_Title.csv")

# years and total checkout
first <- df %>% group_by(CheckoutYear, CheckoutMonth) %>% 
  summarize(totalCheckout = sum(Checkouts)) %>% 
  arrange(CheckoutYear, CheckoutMonth) %>% 
  ungroup()
  
# create the vertical bar chart
ggplot(data = first) +
  geom_col(mapping = aes(x=CheckoutYear, y = totalCheckout, fill = totalCheckout)) +
  labs(title = "Number of Checkout Per Year", x = "Year", y = "Checkout", fill = "Number of Checkout")

