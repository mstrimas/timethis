context("time_this")

test_that("correctly returns time as a list element", {
  r <- time_this(mean(rnorm(1e6)))

  expect_named(r, c("result", "time"))
  expect_is(r$time, "proc_time")
})

test_that("correctly returns time as an attribute", {
  r <- time_this(mean(rnorm(1e6)), time_as = "attr")

  expect_named(attributes(r), "time")
  expect_is(attr(r, "time"), "proc_time")
})

test_that("fails with invalid time_as", {
  expect_error(time_this(mean(rnorm(1e6)), time_as = "x"))
})
