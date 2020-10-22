context("test-show_nhs_theme_colours")
library(testthat)
library(mockery)

test_that("show_nhs_theme_colours returns a ggplot object", {
  plot <- show_nhs_theme_colours()
  expect_is(plot, "ggplot")
  expect_equal_to_reference(plot, "show_nhs_theme_colours.rds")
})

test_that("show_nhs_theme_colours calls get_nhs_colours", {
  m <- mock(c(Blue = "#005EB8", Green = "#009639"), cycle = TRUE)
  stub(show_nhs_theme_colours, "get_nhs_colours", m)

  show_nhs_theme_colours()

  expect_called(m, 5)

  expect_call(m, 1, get_nhs_colours(section = s))
  expect_args(m, 1, section = "blues")

  expect_call(m, 2, get_nhs_colours(section = s))
  expect_args(m, 2, section = "neutrals")

  expect_call(m, 3, get_nhs_colours(section = s))
  expect_args(m, 3, section = "support greens")

  expect_call(m, 4, get_nhs_colours(section = s))
  expect_args(m, 4, section = "highlights")

  expect_call(m, 5, get_nhs_colours())
  expect_args(m, 5)
})
