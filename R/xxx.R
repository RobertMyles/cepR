
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



list_depth <- function(this) ifelse(is.list(this),
                                    1L + max(sapply(this, list_depth)), 0L)
