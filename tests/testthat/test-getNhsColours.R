context("test-get_nhs_colours")
library(dplyr)
library(purrr)

test_that("get_nhs_colours returns a character vector", {
  colours <- get_nhs_colours()
  expect_is(colours, "character")
})

test_that("get_nhs_colours returns correct colours", {
  actual <- get_nhs_colours()
  expect_equal_to_reference(actual, "get_nhs_colours.rds")
})

test_that("get_nhs_colours returns only the colour passed to it", {
  expected <- readRDS("get_nhs_colours.rds")
  actual <- expected %>% names %>% map_chr(get_nhs_colours)
  expect_equal(actual, unname(expected))
})

test_that("get_nhs_colours returns all of the colours passed to it", {
  expected <- readRDS("get_nhs_colours.rds")[c("DarkBlue", "AquaBlue", "PaleGrey")]
  actual <- get_nhs_colours("DarkBlue", "AquaBlue", "PaleGrey")
  expect_equal(actual, expected)
})

test_that("get_nhs_colours ignores duplicated colour names", {
  expected <- 1
  actual <- get_nhs_colours("DarkBlue", "DarkBlue")
  expect_length(actual, expected)
})

test_that("get_nhs_colours throws an error if an unrecognised colour name is passed", {
  expect_error(get_nhs_colours("Unknown"))
})

test_that("get_nhs_colours returns specific colours if a section is passed", {
  all_colours <- readRDS("get_nhs_colours.rds")

  sections = list(
    `blues` = c("DarkBlue", "Blue", "BrightBlue", "LightBlue", "AquaBlue"),
    `neutrals` = c("Black", "DarkGrey", "MidGrey", "PaleGrey"),
    `support greens` = c("DarkGreen", "Green", "LightGreen", "AquaGreen"),
    `highlights` = c("Purple", "DarkPink", "Pink", "DarkRed", "Red", "Orange",
                     "WarmYellow", "Yellow")
  )

  map(names(sections), function(s) {
    expected <- all_colours[sections[[s]]]
    actual <- get_nhs_colours(section = s)
    expect_equal(actual, expected)
  })
})

test_that("get_nhs_colours throws an error if an incorrect section is passed", {
  expect_error(get_nhs_colours(section = "Unknown"))
})
