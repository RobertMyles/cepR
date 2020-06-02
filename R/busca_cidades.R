#' @title Busca Cidades por Estado
#' @description Busca cidades por estado.
#' @importFrom purrr map_chr pluck
#' @importFrom tibble tibble
#' @importFrom httr GET add_headers content
#' @param estado sigla do estado (acronym of the state).
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @examples
#' \dontrun{
#' ubatuba <- busca_cidades(estado = "AM", token = token)
#' }
#' @export
busca_cidades <- function(estado = c("AC", "AL", "AP", "AM", "BA", "CE",
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

  url <- paste0(base_url, "cities?estado=", estado)
  auth <- paste0("Token token=", token)
  r <- GET(url, add_headers(Authorization = auth)) %>% content("parsed")
  cities <- tibble(
    estado = estado,
    cidade = map_chr(r, ~{pluck(.x, "nome", .default = NA_character_)})
  )

  return(cities)
}

