# base url for all requests to API v3
base_url <- "http://www.cepaberto.com/api/v3/"
# default value for null results in `pluck()`
N <- NA_character_

#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

# global vars (rlang::.data not working)
if(getRversion() >= "2.15.1")  utils::globalVariables(
  c(".", "altitude", "latitude", "longitude", "setNames",
    "estado", "cidade", "bairro", "cep", "logradouro", "ddd",
    "cod_IBGE", "ibge"))
