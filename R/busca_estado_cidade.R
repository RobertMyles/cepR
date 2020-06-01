#' @title Busca Bairros por Estado
#' @description Busca bairros por estado.
#' @importFrom purrr map_chr
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#' @importFrom tibble tibble
#' @importFrom dplyr select
#' @importFrom dplyr mutate
#' @param estado sigla do estado (acronym of the state).
#' @param cidade \code{character}. Nome da cidade, por exemplo, \code{"Salvador"}. (Name of the city.)
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @examples
#' \dontrun{
#' ubatuba <- busca_cidade(estado = "SP", cidade = "Ubatuba", token = token)
#' }
#' @export
busca_cidade <- function(estado = c("AC", "AL", "AP", "AM", "BA", "CE",
                                    "DF", "ES", "GO", "MA", "MT", "MS",
                                    "MG", "PA", "PB", "PR", "PE", "PI",
                                    "RJ", "RN", "RS", "RO", "RR", "SC",
                                    "SP", "SE", "TO"),
                         cidade = "", token = NULL){

  estado <- match.arg(estado, choices = c("AC", "AL", "AP", "AM", "BA", "CE",
                                          "DF", "ES", "GO", "MA", "MT", "MS",
                                          "MG", "PA", "PB", "PR", "PE", "PI",
                                          "RJ", "RN", "RS", "RO", "RR", "SC",
                                          "SP", "SE", "TO"))
  if(is.null(token)){
    stop("Um token \u00e9 preciso")
  }

  if(nchar(cidade) == 0){
    stop("Cidade \u00e9 preciso")
  } else{
    url <- paste0(base_url, "address?", "estado=", estado, "&cidade=", cidade)
  }
  auth <- paste0("Token token=", token)
  r <- GET(url, add_headers(Authorization = auth)) %>% content("parsed")

}

