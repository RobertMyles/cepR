#' @importFrom purrr pluck
parse_api <- function(response) {
  out <- tibble(
    estado = pluck(response, "estado", .default = N) %>%
      pluck("sigla", .default = N)%>%
      as.character(),
    cidade = pluck(response, "cidade", .default = N) %>%
      pluck("nome", .default = N)%>%
      as.character(),
    bairro = pluck(response, "bairro", .default = N)%>%
      as.character(),
    cep = pluck(response, "cep", .default = N)%>%
      as.character(),
    logradouro = pluck(response, "logradouro", .default = N)%>%
      as.character(),
    latitude = pluck(response, "latitude", .default = N) %>%
      as.numeric(),
    longitude = pluck(response, "longitude", .default = N) %>%
      as.numeric(),
    altitude = pluck(response, "altitude", .default = N) %>%
      as.numeric(),
    ddd = pluck(response, "cidade", .default = N) %>%
      pluck("ddd", .default = N) %>%
      as.numeric(),
    cod_IBGE = pluck(response, "cidade", .default = N) %>%
      pluck("ibge", .default = N) %>%
      as.character()
  )
  out
}
