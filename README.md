
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/RobertMyles/cepR?branch=master&svg=true)](https://ci.appveyor.com/project/RobertMyles/cepR) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/cepR)](https://cran.r-project.org/package=cepR)

cepR 🇧🇷
=======

<a href=#uk>(English below)</a>

A proposta de **cepR** é para disponibilizar CEPs, nomes de bairros, logradouros de todos as cidades e estados do Brasil. Os dados vem do projeto [CEPaberto](http://cepaberto.com/). Para usar este pacote, você vai ter que registrar no site do [CEPaberto](http://cepaberto.com/users/register) e usar o *token* pessoal. Este token é usado nas funções do pacote. Pode contribuir ao projeto CEPaberto através o tab "Colaborar" no site. Contribuições a este pacote estão bem vindos por meio de pull request, sugestões e críticas nos issues. Me contata se quiser ser colaborador, todos estão bem vindos (inclusive para melhorar o português ruim desse pacote 🐵).

Instalação
----------

``` r
# install.packages("devtools")
devtools::install_github("RobertMyles/cepR")
```

Uso
---

Pode achar os nomes das cidades e municipios com `busca_estado()`

``` r
library(cepR)
token <- "XXXXXXXXXXX" # o seu token
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
```

Pode também busca por CEP. O valor default do CEP (para dar exemplo) é da Praça de Sé:

``` r
> busca_cep(token = token)

# A tibble: 1 x 10
  estado    cidade bairro      cep              logradouro       latitude
   <chr>     <chr>  <chr>    <chr>                   <chr>          <chr>
1     SP São Paulo     Sé 01001000 Praça da Sé, lado ímpar -23.5479099981
# ... with 4 more variables: longitude <chr>, altitude <chr>, ddd <chr>,
#   cod_IBGE <chr>
```

Pode buscar por cidade usando `busca_cidade()`.

Dados
-----

O pacote vem com uma base dos endereços, nome de bairros e CEP do estado de São Paulo. Para carregar, digite `data("sp")`:

``` r
       cep                                                                   local bairro
     <chr>                                                                   <chr>  <chr>
1 01001000                                                 Praça da Sé, lado ímpar     Sé
2 01001001                                                   Praça da Sé, lado par     Sé
3 01001010                                                  Rua Filipe de Oliveira     Sé
4 01001900 UNESP - Universidade Estadual Júlio de Mesquita Filho, Praça da Sé, 108     Sé
5 01001901                                  Edifício Santa Lídia, Praça da Sé, 371     Sé
6 01001902                  OAB - Ordem dos Advogados do Brasil., Praça da Sé, 385     Sé
# ... with 4 more variables: id_cidade <int>, id_estado <int>, cidade <chr>, estado <chr>
```

<a name="uk">cepR</a> 🇬🇧
========================

**cepR** is a package for accessing Brazilian address data: neighbourhood names, city and state names, actual addresses, postal codes, and other info such as altitude, longitude & latitude. The data come from the [CEPaberto](http://cepaberto.com/) project, and to use the package, you'll need a personal access token from the CEP Aberto site. Suggestions, pull requests, criticisms all welcome. You can install the package as shown in *Instalação* above. A dataset of address data for the state of São Paulo comes with the package and is accessible with `data("sp")`.
The package is aimed at a Brazilian audience, so if you don't speak Portuguese:

-   bairro = neighbourhood;
-   cep = postal code;
-   logadouro = address;
-   município = municipality.

The others aren't too hard to figure out 🐵.
