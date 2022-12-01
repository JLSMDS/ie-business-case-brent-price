# Packages ------
library(ggplot2)
library(dplyr)
# Data-------
brent <- readRDS("data/processed/brent_price.rds")
exports <- readRDS("data/processed/exports.rds")
imports <- readRDS("data/processed/imports.rds")
stock_levels <- readRDS("data/processed/stocks_levels.rds")
supply <- readRDS("data/processed/supply.rds")
# Visualizations ------
brent %>%
  ggplot() + 
  geom_line(aes(x = date, y = value)) + 
  ggtitle("Brent price",
          subtitle = "Dollar per barrel") + 
  ylab("Dollars") + 
  xlab("Dates") + 
  theme_bw()

exports %>%
  ggplot() + 
  geom_line(aes(x = date, y = value, col = geography)) + 
  ggtitle("Exports of petroleum by country",
          subtitle = "Thousands of Tonnes") + 
  ylab("Thousand of tonnes") + 
  xlab("Dates") + 
  theme_bw() + 
  guides(col=guide_legend(title="Regions")) + 
  theme(legend.position = "bottom")


imports %>%
  ggplot() + 
  geom_line(aes(x = date, y = value, col = geography)) + 
  ggtitle("Imports of petroleum by country",
          subtitle = "Thousands of Tonnes") + 
  ylab("Thousand of tonnes") + 
  xlab("Dates") + 
  theme_bw() + 
  guides(col=guide_legend(title="Regions")) + 
  theme(legend.position = "bottom")


stocks_levels %>%
  ggplot() + 
  geom_line(aes(x = date, y = value, col = geography)) + 
  ggtitle("Imports of petroleum by country",
          subtitle = "Thousands of Tonnes") + 
  ylab("Thousand of tonnes") + 
  xlab("Dates") + 
  theme_bw() + 
  guides(col=guide_legend(title="Regions")) + 
  theme(legend.position = "bottom")


supply%>%
  ggplot() + 
  geom_line(aes(x = date, y = value, col = geography)) + 
  ggtitle("Supply of petroleum by country",
          subtitle = "Thousands of Barrels") + 
  ylab("Thousand of tonnes") + 
  xlab("Dates") + 
  theme_bw() + 
  guides(col=guide_legend(title="Regions")) + 
  theme(legend.position = "bottom")
