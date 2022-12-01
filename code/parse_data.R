library(readr)
library(dplyr)
# Brent Price------
## Units: Dollars per Barrel
## Frequency: Daily
brent <- read_csv("data/Brent Price.csv",
                  col_types = cols(
                    DATE = col_date(),
                    DCOILBRENTEU = col_double()
                  ),
                  na = ".")

brent <- brent |>
  rename(
    date = DATE,
    value = DCOILBRENTEU
  )

# Exports ------
## Units: Thousands of Tonnes
## Frquency: Monthly
exports <- read_csv("data/Exports.csv",
                    col_select = c("geo", "TIME_PERIOD", "OBS_VALUE"),
                    col_types = cols(
                      geo = col_character(),
                      TIME_PERIOD = col_date(format = "%Y-%m"),
                      OBS_VALUE = col_double()
                    ))
exports <- exports |>
  rename(
    geography = geo,
    date = TIME_PERIOD,
    value = OBS_VALUE
  )
# Imports ------
## Units: Thousands of Tonnes
## Frquency: Monthly
imports <- read_csv("data/Imports.csv",
                    col_select = c("geo", "TIME_PERIOD", "OBS_VALUE"),
                    col_types = cols(
                      geo = col_character(),
                      TIME_PERIOD = col_date(format = "%Y-%m"),
                      OBS_VALUE = col_double()
                    ))

imports <- imports |>
  rename(
    geography = geo,
    date = TIME_PERIOD,
    value = OBS_VALUE
  )

# Stocks Levels ------
## Units: Thousands of Tonnes
## Frquency: Monthly
stocks_levels <- read_csv("data/Stock levels.csv",
                    col_select = c("geo", "TIME_PERIOD", "OBS_VALUE"),
                    col_types = cols(
                      geo = col_character(),
                      TIME_PERIOD = col_date(format = "%Y-%m"),
                      OBS_VALUE = col_double()
                    ))

stocks_levels <- stocks_levels |>
  rename(
    geography = geo,
    date = TIME_PERIOD,
    value = OBS_VALUE
  )

# Supply -------
## Unidades: thousand barrels
## Frquency: Monthly
supply <- read_csv("data/Supply.csv",
                          col_select = c("GEO", "TIME", "Value", "INDIC_NRG"),
                          col_types = cols(
                            GEO = col_character(),
                            TIME = col_date(format = "%YM%m"),
                            Value = col_number(),
                            INDIC_NRG = col_character()
                          ),
                          na = ":", 
                   locale = readr::locale(encoding = "latin1"))

supply <- supply |>
  filter(INDIC_NRG == "Volume - thousand barrels") %>%
  select(-INDIC_NRG) %>%
  rename(
    geography = GEO,
    date = TIME,
    value = Value
  )

if (!dir.exists("data/processed")) {
  dir.create("data/processed")
}
saveRDS(brent, file = "data/processed/brent_price.rds")
saveRDS(exports, file = "data/processed/exports.rds")
saveRDS(imports, file = "data/processed/imports.rds")
saveRDS(stocks_levels, file = "data/processed/stocks_levels.rds")
saveRDS(supply, file = "data/processed/supply.rds")

