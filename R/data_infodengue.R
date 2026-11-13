get_infodengue_cases <- function(geocode = 3304557,
                                 disease = "dengue",
                                 ew_start = 1,
                                 ew_end = 53,
                                 ey_start = 2015,
                                 ey_end = 2026,
                                 format = "csv"
){

  url <- "https://info.dengue.mat.br/api/alertcity?"
  # geocode: 3304557 # Rio de Janeiro
  # geocode: 3301702 # Duque de Caxias
  # geocode: 5208707 # Goiania
  # geodoce: 3106200 # BH

  # do not change
  cons1 <- paste0(url,"geocode=",geocode,"&disease=",disease,"&format=",format,"&ew_start=",ew_start,"&ew_end=",ew_end,"&ey_start=",ey_start,"&ey_end=",ey_end)
  # cons1

  dados <- read_csv(cons1, show_col_types=FALSE) %>% arrange(data_iniSE)

  dados
}


dengueRio <- get_infodengue_cases(ey_start = 2010)

dengueRio |> ggplot(aes(x = data_iniSE)) +
  geom_line(aes(y = casprov, color = "Casos provaveis")) +
  geom_line(aes(y = casos, color = "Casos suspeitos")) +
  theme_bw()


dengueGoiania <- get_infodengue_cases(geocode = 5208707, ey_start = 2010)

dengueGoiania |>
  ggplot(aes(x = data_iniSE)) +
  geom_line(aes(y = casprov, color = "Casos provaveis")) +
  geom_line(aes(y = casos, color = "Casos suspeitos")) +
  theme_bw()


dengueBH <- get_infodengue_cases(geocode = 3106200, ey_start = 2010)

dengueBH |>
  ggplot(aes(x = data_iniSE)) +
  geom_line(aes(y = casprov, color = "Casos provaveis")) +
  geom_line(aes(y = casos, color = "Casos suspeitos")) +
  theme_bw()
