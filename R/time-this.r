#' Time an expression or code chunk
#'
#' Time an expression or chunk of R code with `system.time()` and return both
#' the results of evaluating the expression and the execution time in a list.
#'
#' @param code An expression or code chunk (wrapped in curly brackets) to time.
#'
#' @return A list with elements `result` and `time`, containing the results of
#'   evaluating `code` and the execution time, respectively.
#' @export
#' @examples
#' # time a simple expression
#' time_this(mean(rnorm(1e6)))
#'
#' # time a code chunk
#' time_this({
#'   x <- (1:1e6) / 1e6
#'   y = 2 * x + 1 + rnorm(x)
#'   lm(y ~ x)
#' })
time_this <- function(code) {
  systime <- system.time({result = code})
  list(result = result, time = systime)
}
