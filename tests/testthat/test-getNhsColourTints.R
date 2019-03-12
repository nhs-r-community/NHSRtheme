context("test-getNhsColourTints")
library(mockery)
library(testthat)

test_that("getNhsColourTints returns a character vector", {
  colours <- getNhsColourTints(seq(0,1,0.1))
  expect_is(colours, "character")
})

test_that("getNhsColourTints returns", {
  actual <- getNhsColourTints(seq(0, 1, 0.1))
  expect_equal_to_reference(actual, "getNhsColourTints.rds")
})

test_that("getNhsColourTints throws an error if one of the tint values is not in [0, 1]", {
  expect_error(getNhsColourTints(1.1))
  expect_error(getNhsColourTints(-0.1))
})

test_that("getNhsColourTints calls getNhsColours", {
  m <- mock()
  stub(getNhsColourTints, "getNhsColours", m)

  getNhsColourTints(seq(0,1,0.1))
  getNhsColourTints(seq(0,1,0.1), "Blue", "Green")
  getNhsColourTints(seq(0,1,0.1), section = "blues")

  expect_called(m, 3)

  expect_call(m, 1, getNhsColours(section = section))
  expect_args(m, 1, section = NULL)

  expect_call(m, 2, getNhsColours("Blue", "Green", section = section))
  expect_args(m, 2, "Blue", "Green", section = NULL)

  expect_call(m, 3, getNhsColours(section = section))
  expect_args(m, 3, section = "blues")
})
