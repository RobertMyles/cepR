
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/cepR)](https://cran.r-project.org/package=cepR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/cepR)](https://CRAN.R-project.org/package=cepR)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/grand-total/cepR)](https://CRAN.R-project.org/package=cepR)
![R-CMD-check](https://github.com/RobertMyles/cepR/workflows/R/badge.svg)

cepR 🇧🇷
=======

<a href=#uk>(English below)</a>

**cepR** é um pacote para [R](https://www.r-project.org/) que acessa
dados postais do Brasil tais como nomes de bairros, cidades, estados,
logradouros, CEPs e outras informações de interesse como altitude,
longitude e latitude. Os dados são do projeto
[CEPaberto](https://cepaberto.com/) e para utilizar este pacote é
preciso se cadastrar no site do
[CEPaberto](https://cepaberto.com/users/register) e obter um *token*
pessoal. Você pode contribuir para o projeto CEPaberto clicando na aba
[“Colaborar”](http://cepaberto.com/ceps) do site. Para instalar o
**cepR** é só seguir as instruções abaixo. Um banco de dados com
endereços postais do estado de São Paulo está incluído no pacote e pode
ser acessado com `data("sp")`. Sugestões, *pull requests* e comentários
são muito bem-vindos!

Instalação
----------

CRAN:

    install.packages("cepR")

GitHub:

    # install.packages("remotes")
    remotes::install_github("RobertMyles/cepR")

Uso
---

É possível buscar os nomes das cidades e municipios com `busca_estado()`

    library(cepR)
    token <- "XXXXXXXXXXX" # seu token
    sp <- busca_estado(estado = "SP", token = token)

    sp
    # A tibble: 863 x 2
       estado                  municipio
        <chr>                      <chr>
     1     SP                 Adamantina
     2     SP                     Adolfo
     3     SP         Agisse (Rancharia)
     4     SP                      Aguaí
     5     SP             Águas da Prata
     6     SP           Águas de Lindóia
     7     SP     Águas de Santa Bárbara
     8     SP         Águas de São Pedro
     9     SP Água Vermelha (São Carlos)
    10     SP                     Agudos
    # ... with 853 more rows

Pode-se também buscar os endereços por CEP. Por exemplo, o valor
*default* do CEP é o da Praça de Sé:

    > busca_cep(token = token)

    # A tibble: 1 x 10
      estado    cidade bairro      cep              logradouro       latitude
       <chr>     <chr>  <chr>    <chr>                   <chr>          <chr>
    1     SP São Paulo     Sé 01001000 Praça da Sé, lado ímpar -23.5479099981
    # ... with 4 more variables: longitude <chr>, altitude <chr>, ddd <chr>,
    #   cod_IBGE <chr>

Para mais, veja o projeto CEPAberto.

<a name="uk">cepR</a> 🇬🇧
========================

**cepR** is a package for accessing Brazilian address data:
neighbourhood names, city and state names, actual addresses, postal
codes, and other info such as altitude, longitude & latitude. The data
come from the [CEPaberto](https://cepaberto.com/) project, and to use
the package, you’ll need a personal access token from the CEP Aberto
site. Suggestions, pull requests, criticisms all welcome. You can
install the package as shown in *Instalação* above. If you use it
regularly, please consider donating to the CEPAberto project.

The package is aimed at a Brazilian audience, so if you don’t speak
Portuguese:

-   bairro = neighbourhood;
-   cep = postal code;
-   logadouro = address;
-   município = municipality.

The others aren’t too hard to figure out 🐵.
