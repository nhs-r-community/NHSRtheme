context("getNhsColours")
library(nhsrtheme)
library(dplyr)
library(purrr)

test_that("getNhsColours returns a character vector", {
  colours <- getNhsColours()

  testthat::expect_is(colours, "character")
})

test_that("getNhsColours returns correct colours", {
  expected <- c(DarkBlue   = "#003087",
                Blue       = "#005EB8",
                BrightBlue = "#0072CE",
                LightBlue  = "#41B6E6",
                AquaBlue   = "#00A9CE",
                Black      = "#231f20",
                DarkGrey   = "#425563",
                MidGrey    = "#768692",
                PaleGrey   = "#E8EDEE",
                Green      = "#009639",
                DarkGreen  = "#006747",
                LightGreen = "#78BE20",
                AquaGreen  = "#00A499",
                Purple     = "#330072",
                DarkPink   = "#7C2855",
                Pink       = "#AE2573",
                DarkRed    = "#8A1538",
                Red        = "#DA291C",
                Orange     = "#ED8B00",
                WarmYellow = "#FFB81C",
                Yellow     = "#FAE100")

  actual <- getNhsColours()

  expect_equal(actual, expected)
})

test_that("getNhsColours returns only the colour passed to it", {
  expected <- c(DarkBlue   = "#003087",
                Blue       = "#005EB8",
                BrightBlue = "#0072CE",
                LightBlue  = "#41B6E6",
                AquaBlue   = "#00A9CE",
                Black      = "#231f20",
                DarkGrey   = "#425563",
                MidGrey    = "#768692",
                PaleGrey   = "#E8EDEE",
                Green      = "#009639",
                DarkGreen  = "#006747",
                LightGreen = "#78BE20",
                AquaGreen  = "#00A499",
                Purple     = "#330072",
                DarkPink   = "#7C2855",
                Pink       = "#AE2573",
                DarkRed    = "#8A1538",
                Red        = "#DA291C",
                Orange     = "#ED8B00",
                WarmYellow = "#FFB81C",
                Yellow     = "#FAE100")

  actual <- expected %>% names %>% map_chr(getNhsColours)

  expect_equal(actual, unname(expected))
})

test_that("getNhsColours returns all of the colours passed to it", {
  expected <- c(DarkBlue   = "#003087",
                AquaBlue   = "#00A9CE",
                PaleGrey   = "#E8EDEE")
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
  # blues
  expected <- c(DarkBlue   = "#003087",
                Blue       = "#005EB8",
                BrightBlue = "#0072CE",
                LightBlue  = "#41B6E6",
                AquaBlue   = "#00A9CE")

  actual <- getNhsColours(section = "blues")

  expect_equal(actual, expected)

  # neutrals
  expected <- c(Black      = "#231f20",
                DarkGrey   = "#425563",
                MidGrey    = "#768692",
                PaleGrey   = "#E8EDEE")

  actual <- getNhsColours(section = "neutrals")

  expect_equal(actual, expected)

  # support greens
  expected <- c(Green      = "#009639",
                DarkGreen  = "#006747",
                LightGreen = "#78BE20",
                AquaGreen  = "#00A499")

  actual <- getNhsColours(section = "support greens")

  expect_equal(actual, expected)

  # highlights
  expected <- c(Purple     = "#330072",
                DarkPink   = "#7C2855",
                Pink       = "#AE2573",
                DarkRed    = "#8A1538",
                Red        = "#DA291C",
                Orange     = "#ED8B00",
                WarmYellow = "#FFB81C",
                Yellow     = "#FAE100")

  actual <- getNhsColours(section = "highlights")

  expect_equal(actual, expected)
})

test_that("getNhsColours throws an error if an incorrect section is passed", {
  expect_error(getNhsColours(section = "Unknown"))
})
