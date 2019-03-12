context("test-showNhsThemeColours")
library(testthat)

test_that("showNhsThemeColours returns a ggplot object", {
  plot <- showNhsThemeColours()
  expect_is(plot, "ggplot")
  expect_equal_to_reference(plot, "showNhsThemeColours.rds")
})

test_that("showNhsThemeColours calls getNhsColours", {
  m <- mock(c(Blue = "#005EB8", Green = "#009639"), cycle = TRUE)
  stub(showNhsThemeColours, "getNhsColours", m)

  showNhsThemeColours()

  expect_called(m, 5)

  expect_call(m, 1, getNhsColours(section = s))
  expect_args(m, 1, section = "blues")

  expect_call(m, 2, getNhsColours(section = s))
  expect_args(m, 2, section = "neutrals")

  expect_call(m, 3, getNhsColours(section = s))
  expect_args(m, 3, section = "support greens")

  expect_call(m, 4, getNhsColours(section = s))
  expect_args(m, 4, section = "highlights")

  expect_call(m, 5, getNhsColours())
  expect_args(m, 5)
})
