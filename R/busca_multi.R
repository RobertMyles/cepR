#' @title Busca por CEP
#' @description Busca usando multiplos CEP (search for information using multiple postal code).
#' @importFrom magrittr %<>%
#' @importFrom dplyr add_row
#' @importFrom stats na.exclude
#' @param lista_ceps lista de CEPs (postal code list).
#' @param token Token de autorização. Veja <http://cepaberto.com/users/register>.
#' @export
busca_multi <- function( lista_ceps = c("01001000", "01001001") , token = NULL ) {
  CEPS <- parse_api(NA) %>% na.exclude()
  lista_ceps %<>%  as.vector()
  for (i in lista_ceps) {
    CEPS %<>% add_row(
      busca_cep(cep = i, token = token)
    )
    Sys.sleep(1)
  }
  return(CEPS)
}
