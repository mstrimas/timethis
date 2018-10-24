
# timethis

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
#> [1] -0.001679024
#> 
#> $time
#>    user  system elapsed 
#>   0.075   0.002   0.077

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
#>      0.9964       2.0042  
#> 
#> 
#> $time
#>    user  system elapsed 
#>   0.286   0.057   0.345
```

Use `add_timer()` to wrap an existing function so its execution is timed
with `system.time()` and both the results of the funciton call and the
execution time are returned as a list.

``` r
mean_timed <- add_timer(mean)
mean_timed(rnorm(1e6))
#> $result
#> [1] 0.001268237
#> 
#> $time
#>    user  system elapsed 
#>   0.073   0.001   0.074

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
#>      0.9998       2.0032  
#> 
#> 
#> $time
#>    user  system elapsed 
#>   0.140   0.057   0.197
```
