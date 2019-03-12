context("test-showNhsThemeColours")
library(testthat)

test_that("showNhsThemeColours returns a ggplot object", {
  plot <- showNhsThemeColours()
  expect_is(plot, "ggplot")
  expect_equal_to_reference(plot, "showNhsThemeColours.rds")
})

test_that("showNhsThemeColours calls getNhsColours", {
  m <- mock(c(Blue = "#005EB8", Green = "#009639"), cycle = TRUE)

  with_mock(
    getNhsColours = m,
    showNhsThemeColours()
  )

  expect_called(m, 5)
  expect_call(m, 1, getNhsColours(section = s))
  expect_call(m, 2, getNhsColours(section = s))
  expect_call(m, 3, getNhsColours(section = s))
  expect_call(m, 4, getNhsColours(section = s))
  expect_call(m, 5, getNhsColours())
})
