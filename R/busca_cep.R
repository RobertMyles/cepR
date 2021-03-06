#' @title Busca por CEP
#' @description Busca por CEP (search for information by postal code).
#' @importFrom httr GET add_headers content
#' @param cep CEP (postal code), \code{character}.
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @export
busca_cep <- function(cep = "01001000", token = NULL) {
  if (nchar(cep) != 8) {
    stop("O cep deve ter 8 digitos.")
  }
  if (is.null(token)) {
    stop(msg)
  }

  url <- paste0(base_url, "cep?cep=", cep)
  auth <- paste0("Token token=", token)
  r <- GET(url, add_headers(Authorization = auth)) %>% content("parsed")
  CEP <- parse_api(r)

  return(CEP)
}
