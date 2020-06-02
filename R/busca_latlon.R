#' @title Busca Bairros por Latitude e Longitude
#' @description Busca bairros por latitude e longitude.
#' @importFrom httr GET add_headers content
#' @param lat \code{numerico}. Latitude
#' @param long \code{numerico}. Longitude.
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>
#' @examples
#' \dontrun{
#' busca_latlon(lat = -20.55, long = -43.63, token = XXXXXX)
#' }
#' @export
busca_latlon <- function(lat = NULL, long = NULL, token = NULL){

  if(is.null(lat)){
    stop("latitude \u00e9 preciso")
  }
  if(is.null(long)){
    stop("longitude \u00e9 preciso")
  }
  if(is.null(token)){
    stop("Um token \u00e9 preciso")
  }

  url <- paste0(base_url, "nearest?", "lat=", lat, "&lng=", long)
  auth <- paste0("Token token=", token)
  r <- GET(url, add_headers(Authorization = auth)) %>% content("parsed")
  latlon <- parse_api(r)

  return(latlon)
}
