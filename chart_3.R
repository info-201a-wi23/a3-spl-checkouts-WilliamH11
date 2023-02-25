# load libraries
library(dplyr)
library(ggplot2)

# import dataset
df <- read.csv("/Users/williamhardjanto/Desktop/info201/coding/assignment/a3-spl-checkouts-WilliamH11/Checkouts_by_Title.csv")

mean_material <- df %>%
  group_by(MaterialType) %>%
  summarise(mean_checkout = mean(Checkouts)) %>%
  arrange(mean_checkout)

ggplot(mean_material, aes(x = MaterialType, y = mean_checkout, fill = MaterialType)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(x = "Material Type", y = "Mean Checkout Amount", title = "Mean Checkout Amount by Material Type")

