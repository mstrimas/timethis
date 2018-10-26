#' Time an expression or code chunk
#'
#' Time an expression or chunk of R code with `system.time()` and return both
#' the results of evaluating the expression and the execution time in a list.
#'
#' @param code An expression or code chunk (wrapped in curly brackets) to time.
#' @param time_as character; return the execution time and results as list
#'   elements ("list") or return results with time as an attribute ("attr").
#'
#' @return A list with elements `result` and `time`, containing the results of
#'   evaluating `code` and the execution time, respectively. If `time_as =
#'   "attr"`, the result will be returned directly with the time stored as an
#'   attribute.
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
#'
#' # time can also be stored as an attribute
#' time_this(mean(rnorm(1e6)), time_as = "attr")
time_this <- function(code, time_as = c("list", "attr")) {
  time_as <- match.arg(time_as)
  systime <- system.time({result = code})
  if (time_as == "list") {
    return(list(result = result, time = systime))
  } else {
    attr(result, "time") <- systime
    return(result)
  }
}
