context("getNhsColours")
library(dplyr)
library(purrr)

test_that("getNhsColours returns a character vector", {
  colours <- getNhsColours()
  expect_is(colours, "character")
})

test_that("getNhsColours returns correct colours", {
  actual <- getNhsColours()
  expect_equal_to_reference(actual, "getNhsColours.rds")
})

test_that("getNhsColours returns only the colour passed to it", {
  expected <- readRDS("getNhsColours.rds")
  actual <- expected %>% names %>% map_chr(getNhsColours)
  expect_equal(actual, unname(expected))
})

test_that("getNhsColours returns all of the colours passed to it", {
  expected <- readRDS("getNhsColours.rds")[c("DarkBlue", "AquaBlue", "PaleGrey")]
  actual <- getNhsColours("DarkBlue", "AquaBlue", "PaleGrey")
  expect_equal(actual, expected)
})

test_that("getNhsColours ignores duplicated colour names", {
  expected <- 1
  actual <- getNhsColours("DarkBlue", "DarkBlue")
  expect_length(actual, expected)
})

test_that("getNhsColours throws an error if an unrecognised colour name is passed", {
  expect_error(getNhsColours("Unknown"))
})

test_that("getNhsColours returns specific colours if a section is passed", {
  all_colours <- readRDS("getNhsColours.rds")

  sections = list(
    `blues` = c("DarkBlue", "Blue", "BrightBlue", "LightBlue", "AquaBlue"),
    `neutrals` = c("Black", "DarkGrey", "MidGrey", "PaleGrey"),
    `support greens` = c("Green", "DarkGreen", "LightGreen", "AquaGreen"),
    `highlights` = c("Purple", "DarkPink", "Pink", "DarkRed", "Red", "Orange",
                     "WarmYellow", "Yellow")
  )

  map(names(sections), function(s) {
    expected <- all_colours[sections[[s]]]
    actual <- getNhsColours(section = s)
    expect_equal(actual, expected)
  })
})

test_that("getNhsColours throws an error if an incorrect section is passed", {
  expect_error(getNhsColours(section = "Unknown"))
})
