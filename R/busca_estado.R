#' @title Busca Bairros por Estado e Cidade
#' @description Busca bairros por estado  e cidade (search for neighbourhoods by state and city).
#' @importFrom httr GET add_headers content
#' @param estado sigla do estado (acronym of the state).
#' @param cidade nome da cidade (city name).
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @export
busca_estado <- function(estado = c("AC", "AL", "AP", "AM", "BA", "CE",
                                    "DF", "ES", "GO", "MA", "MT", "MS",
                                    "MG", "PA", "PB", "PR", "PE", "PI",
                                    "RJ", "RN", "RS", "RO", "RR", "SC",
                                    "SP", "SE", "TO"), cidade = NULL, token = NULL){

  estado <- match.arg(estado, choices = c("AC", "AL", "AP", "AM", "BA", "CE",
                                          "DF", "ES", "GO", "MA", "MT", "MS",
                                          "MG", "PA", "PB", "PR", "PE", "PI",
                                          "RJ", "RN", "RS", "RO", "RR", "SC",
                                          "SP", "SE", "TO"))
  if(is.null(cidade)){
    stop("precisa 'cidade'")
  }
  if(is.null(token)){
    stop(msg)
  }
  cidade <- gsub(pattern = " ", replacement = "%20", x = cidade)
  url <- paste0(base_url, "address", "?estado=", estado, "&cidade=", cidade)
  auth <- paste0("Token token=", token)
  r <- GET(url, add_headers(Authorization = auth)) %>% content("parsed")
  bairros <- parse_api(r)

  return(bairros)
}

