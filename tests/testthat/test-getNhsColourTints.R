context("test-get_nhs_colour_tints")
library(mockery)
library(testthat)

test_that("get_nhs_colour_tints returns a character vector", {
  colours <- get_nhs_colour_tints(seq(0,1,0.1))
  expect_is(colours, "character")
})

test_that("get_nhs_colour_tints returns", {
  actual <- get_nhs_colour_tints(seq(0, 1, 0.1))
  expect_equal_to_reference(actual, "get_nhs_colour_tints.rds")
})

test_that("get_nhs_colour_tints throws an error if one of the tint values is not in [0, 1]", {
  expect_error(get_nhs_colour_tints(1.1))
  expect_error(get_nhs_colour_tints(-0.1))
})

test_that("get_nhs_colour_tints calls get_nhs_colours", {
  m <- mock()
  stub(get_nhs_colour_tints, "get_nhs_colours", m)

  get_nhs_colour_tints(seq(0,1,0.1))
  get_nhs_colour_tints(seq(0,1,0.1), "Blue", "Green")
  get_nhs_colour_tints(seq(0,1,0.1), section = "blues")

  expect_called(m, 3)

  expect_call(m, 1, get_nhs_colours(section = section))
  expect_args(m, 1, section = NULL)

  expect_call(m, 2, get_nhs_colours("Blue", "Green", section = section))
  expect_args(m, 2, "Blue", "Green", section = NULL)

  expect_call(m, 3, get_nhs_colours(section = section))
  expect_args(m, 3, section = "blues")
})
