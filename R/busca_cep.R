#' @title Busca por CEP
#' @description Busca por CEP (search for information by postal code).
#' @importFrom purrr pluck
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#' @importFrom tibble tibble
#' @param cep CEP (postal code), \code{character}.
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @export
busca_cep <- function(cep = "01001000", token = NULL) {
  if (nchar(cep) != 8) {
    stop("O cep deve ter 8 digitos.")
  }
  if (is.null(token)) {
    stop("Um token \u00e9 preciso")
  }

  url <- paste0("https://www.cepaberto.com/api/v3/cep?cep=", cep)

  auth <- paste0("Token token=", token)
  r <- httr::GET(url, httr::add_headers(Authorization = auth)) %>%
    httr::content("parsed")
  r <- list(r)
  N <- NA_character_

  CEP <- tibble(
    estado = pluck(r, 1, "estado", .default = N) %>%
      pluck("sigla", .default = N),
    cidade = pluck(r, 1, "cidade", .default = N) %>%
      pluck("nome", .default = N),
    bairro = pluck(r, "bairro", .default = N),
    cep = pluck(r, "cep", .default = N),
    logradouro = pluck(r, "logradouro", .default = N),
    latitude = pluck(r, "latitude", .default = N),
    longitude = pluck(r, "longitude", .default = N),
    altitude = pluck(r, "altitude", .default = N),
    ddd = pluck(r, 1, "cidade", .default = N) %>%
      pluck("ddd", .default = N),
    cod_IBGE = pluck(r, 1, "cidade", .default = N) %>%
      pluck("ibge", .default = N)
  )

  return(CEP)
}
