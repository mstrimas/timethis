context("add_timer")

test_that("correctly returns time as a list element", {
  f <- add_timer(lm)
  x <- (1:100) / 100
  y = 2 * x + 1 + rnorm(x)
  r <- f(y ~ x)

  expect_named(r, c("result", "time"))
  expect_is(r$time, "proc_time")
})

test_that("correctly returns time as an attribute", {
  f <- add_timer(lm, time_as = "attr")
  x <- (1:100) / 100
  y = 2 * x + 1 + rnorm(x)
  r <- f(y ~ x)

  expect_true("time" %in% names(attributes(r)))
  expect_is(attr(r, "time"), "proc_time")
})

test_that("fails with invalid time_as", {
  expect_error(f <- add_timer(lm, time_as = "x"))
})
