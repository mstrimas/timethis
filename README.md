
# timethis

[![Travis build
status](https://travis-ci.org/mstrimas/timethis.svg?branch=master)](https://travis-ci.org/mstrimas/timethis)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mstrimas/timethis?branch=master&svg=true)](https://ci.appveyor.com/project/mstrimas/timethis)
[![Coverage
status](https://codecov.io/gh/mstrimas/timethis/branch/master/graph/badge.svg)](https://codecov.io/github/mstrimas/timethis?branch=master)

`timethis` is a simple package for modifying functions and expressions
to return both the results and the execution time in a single list.

## Installation

You can install the released version of timethis from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("timethis")
```

Install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("mstrimas/timethis")
```

## Usage

To time an expression or chunk of R code use `time_this()`. This will
return a list with elements `result` and `time` containing the results
of evaluating the code and the executuion time (calculated with
`system.time()`), respectively.

``` r
library(timethis)

# time a simple expression
time_this(mean(rnorm(1e6)))
#> $result
#> [1] -0.000110017
#> 
#> $time
#>    user  system elapsed 
#>   0.065   0.002   0.067

# time a code chunk
time_this({
  x <- (1:1e6) / 1e6
  y = 2 * x + 1 + rnorm(x)
  lm(y ~ x)
})
#> $result
#> 
#> Call:
#> lm(formula = y ~ x)
#> 
#> Coefficients:
#> (Intercept)            x  
#>      0.9981       2.0017  
#> 
#> 
#> $time
#>    user  system elapsed 
#>   0.247   0.037   0.285
```

Use `add_timer()` to wrap an existing function so its execution is timed
with `system.time()` and both the results of the funciton call and the
execution time are returned as a list.

``` r
mean_timed <- add_timer(mean)
mean_timed(rnorm(1e6))
#> $result
#> [1] -0.001177068
#> 
#> $time
#>    user  system elapsed 
#>   0.073   0.000   0.074

lm_timed <- add_timer(lm)
x <- (1:1e6) / 1e6
y = 2 * x + 1 + rnorm(x)
lm_timed(y ~ x)
#> $result
#> 
#> Call:
#> .f(formula = ..1)
#> 
#> Coefficients:
#> (Intercept)            x  
#>       1.003        1.998  
#> 
#> 
#> $time
#>    user  system elapsed 
#>   0.139   0.044   0.183
```
