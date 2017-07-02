#' @title Busca Bairros por Estado
#' @description Busca bairros por estado.
#' @importFrom purrr map_chr
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#' @importFrom tibble tibble
#' @param estado sigla do estado.
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @export
busca_estado <- function(estado = c("AC", "AL", "AP", "AM", "BA", "CE",
                                    "DF", "ES", "GO", "MA", "MT", "MS",
                                    "MG", "PA", "PB", "PR", "PE", "PI",
                                    "RJ", "RN", "RS", "RO", "RR", "SC",
                                    "SP", "SE", "TO"), token = NULL){

  estado <- match.arg(estado, choices = c("AC", "AL", "AP", "AM", "BA", "CE",
                                          "DF", "ES", "GO", "MA", "MT", "MS",
                                          "MG", "PA", "PB", "PR", "PE", "PI",
                                          "RJ", "RN", "RS", "RO", "RR", "SC",
                                          "SP", "SE", "TO"))

  if(is.null(token)){
    stop("Um token \u00e9 preciso")
  }

  url <- paste0("http://www.cepaberto.com/api/v2/cities.json?estado=", estado)

  auth <- paste0("Token token=", token)
  r <- httr::GET(url, httr::add_headers(Authorization = auth)) %>%
    httr::content("parsed")
  N <- NA_character_

  bairros <- tibble::tibble(
    estado = estado,
    municipio = purrr::map_chr(r, .null = N, "nome")
  )

  return(bairros)

}

