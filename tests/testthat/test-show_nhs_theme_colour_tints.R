context("test-show_nhs_theme_colour_tints")
library(mockery)
library(testthat)

test_that("show_nhs_theme_colour_tints returns a ggplot object", {
  plot <- show_nhs_theme_colour_tints(seq(0, 1, 0.1), "Blue")
  expect_is(plot, "ggplot")
  expect_equal_to_reference(plot, "show_nhs_theme_colour_tints.rds")
})

test_that("show_nhs_theme_colour_tints calls get_nhs_colour_tints", {
  m <- mock(c(`Blue.0%` = "#005EB8", `Blue.10%` = "#1A6EBF"))
  stub(show_nhs_theme_colour_tints, "get_nhs_colour_tints", m)
  show_nhs_theme_colour_tints(seq(0, 1, 0.1), "Blue")
  expect_call(m, 1, get_nhs_colour_tints(tints, colour))
})
