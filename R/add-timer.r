#' Wrap a function to add a timer
#'
#' Modify a function so its execution is timed with `system.time()` and both
#' the results of the funciton call and the execution time are returned as a
#' list.
#'
#' @param .f A function to modify to add a timer.
#' @param time_as character; return the execution time and results as list
#'   elements ("list") or return results with time as an attribute ("attr").
#'
#' @return Wrapped function that returns a list with components `result` and
#'   `time`. If `time_as = "attr"`, the result will be returned directly with
#'   the time stored as an attribute.
#' @export
#' @examples
#' mean_timed <- add_timer(mean)
#' mean_timed(rnorm(1e6))
#'
#' lm_timed <- add_timer(lm)
#' x <- (1:1e6) / 1e6
#' y = 2 * x + 1 + rnorm(x)
#' lm_timed(y ~ x)
#'
#' # time can also be stored as an attribute
#' mean_timed_a <- add_timer(mean, time_as = "attr")
#' mean_timed_a(rnorm(1e6))
add_timer <- function(.f, time_as = c("list", "attr")) {
  time_as <- match.arg(time_as)
  function(...) {
    time_this(.f(...), time_as = time_as)
  }
}
