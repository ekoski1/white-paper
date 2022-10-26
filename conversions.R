# title: "conversions.Rmd"
# author: "Eric Koski"
# Copyright (c) 2021 Eric Koski under MIT License; see LICENSE.md. 

# Energy- and fuel-related constants and conversions

kgPerLb <- 0.4535923
MWhPerMMBTU <- 0.2932972
metricTonsPerShortTon <- 0.90719

CPI_annual <- read_csv(str_c(
  "https://fred.stlouisfed.org/graph/fredgraph.csv?bgcolor=%23e1e9f0&",
  "chart_type=line&drp=0&fo=open%20sans&graph_bgcolor=%23ffffff&height=450&",
  "mode=fred&tts=12&width=1168&nt=0&",
  "thu=0&trc=0&",
  "id=CUUR0000SA0R&scale=left&cosd=1913-01-01&",
  "link_values=false&mw=3&",
  "lw=2&ost=-99999&oet=99999&mma=0&fml=a&fq=Annual&fam=avg&fgst=lin&",
  "line_index=1&transformation=lin&",
  "nd=1913-01-01")) %>%
  filter(trimws(CUUR0000SA0R) != ".") %>%
  mutate(Value = as.numeric(CUUR0000SA0R)) %>%
  mutate(Year = year(DATE)) %>%
  select(Year, Value)

adjustForInflation <- function(dollarValue, fromYear, toYear) {
  if (!(fromYear %in% CPI_annual$Year) | !(toYear %in% CPI_annual$Year)) {
    warning("Invalid year")
    0.0
  } else {
    fromCPI <- filter(CPI_annual, Year == fromYear)$Value
    toCPI <- filter(CPI_annual, Year == toYear)$Value
    dollarValue * (toCPI / fromCPI)
  }
}


