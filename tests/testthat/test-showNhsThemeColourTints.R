context("test-showNhsThemeColourTints")
library(mockery)
library(testthat)

test_that("showNhsThemeColourTints returns a ggplot object", {
  plot <- showNhsThemeColourTints(seq(0,1,0.1), "Blue")
  expect_is(plot, "ggplot")
  expect_equal_to_reference(plot, "showNhsThemeColourTints.rds")
})

test_that("showNhsThemeColourTints calls getNhsColourTints", {
  m <- mock(c(`Blue.0%` = "#005EB8", `Blue.10%` = "#1A6EBF"))

  with_mock(
    getNhsColourTints = m,
    showNhsThemeColourTints(seq(0,1,0.1), "Blue")
  )

  expect_call(m, 1, getNhsColourTints(tints, colour))
})
