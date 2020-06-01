#' @importFrom purrr pluck
parse_api <- function(response) {
  out <- tibble(
    estado = pluck(response, "estado", .default = N) %>%
      pluck("sigla", .default = N),
    cidade = pluck(response, "cidade", .default = N) %>%
      pluck("nome", .default = N),
    bairro = pluck(response, "bairro", .default = N),
    cep = pluck(response, "cep", .default = N),
    logradouro = pluck(response, "logradouro", .default = N),
    latitude = pluck(response, "latitude", .default = N) %>%
      as.numeric(),
    longitude = pluck(response, "longitude", .default = N) %>%
      as.numeric(),
    altitude = pluck(response, "altitude", .default = N) %>%
      as.numeric(),
    ddd = pluck(response, "cidade", .default = N) %>%
      pluck("ddd", .default = N),
    cod_IBGE = pluck(response, "cidade", .default = N) %>%
      pluck("ibge", .default = N)
  )
  out
}
