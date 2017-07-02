#' @title Busca Bairros por Latitude e Longitude
#' @description Busca bairros por latitude e longitude.
#' @importFrom purrr map_chr
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#' @importFrom tibble tibble
#' @importFrom dplyr mutate
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

  url <- paste0("http://www.cepaberto.com/api/v2/ceps.json?lat=",
                lat, "&lng=", long)

  auth <- paste0("Token token=", token)
  r <- httr::GET(url, httr::add_headers(Authorization = auth)) %>%
    httr::content("parsed")

  depth <- list_depth(r)

  if(depth == 1){
    r <- list(r)
  }

  df <- setNames(object = data.frame(do.call(rbind, lapply(r, as.character, unlist)),
                                     stringsAsFactors = FALSE),
                nm = names(r[[1]]))
  df <- replace(df, df == "NULL", NA) %>% tibble::as.tibble()
  df <- df %>%
    dplyr::mutate(latitude = as.numeric(latitude),
                  longitude = as.numeric(longitude),
                  altitude = as.numeric(altitude))

  return(df)
}
