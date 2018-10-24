#' Wrap a function to add a timer
#'
#' Modify a function so its execution is timed with `system.time()` and both
#' the results of the funciton call and the execution time are returned as a
#' list.
#'
#' @param .f A function to modify to add a timer.
#'
#' @return Wrapped function that returns a list with components `result` and
#'   `time`.
#' @export
#' @examples
#' mean_timed <- add_timer(mean)
#' mean_timed(rnorm(1e6))
#'
#' lm_timed <- add_timer(lm)
#' x <- (1:1e6) / 1e6
#' y = 2 * x + 1 + rnorm(x)
#' lm_timed(y ~ x)
add_timer <- function(.f) {
  function(...) {
    time_this(.f(...))
  }
}
