#' @title Busca por CEP
#' @description Busca por CEP.
#' @importFrom purrr map_chr
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#' @importFrom tibble tibble
#' @param cep CEP, como \code{character}.
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @export
busca_cep <- function(cep = "01001000", token = NULL){

  if(nchar(cep) != 8){
    stop("O cep deve ter 8 digitos.")
  }
  if(is.null(token)){
    stop("Um token \u00e9 preciso")
  }

  url <- paste0("http://www.cepaberto.com/api/v2/ceps.json?cep=", cep)

  auth <- paste0("Token token=", token)
  r <- httr::GET(url, httr::add_headers(Authorization = auth)) %>%
    httr::content("parsed")
  r <- list(r)
  N <- NA_character_

  CEP <- tibble::tibble(
    estado = purrr::map_chr(r, .null = N, "estado"),
    cidade = purrr::map_chr(r, .null = N, "cidade"),
    bairro = purrr::map_chr(r, .null = N, "bairro"),
    cep = purrr::map_chr(r, .null = N, "cep"),
    logradouro = purrr::map_chr(r, .null = N, "logradouro"),
    latitude = purrr::map_chr(r, .null = N, "latitude"),
    longitude = purrr::map_chr(r, .null = N, "longitude"),
    altitude = purrr::map_chr(r, .null = N, "altitude"),
    ddd = purrr::map_chr(r, .null = N, "ddd"),
    cod_IBGE = purrr::map_chr(r, .null = N, "ibge")
  )

  return(CEP)
}
