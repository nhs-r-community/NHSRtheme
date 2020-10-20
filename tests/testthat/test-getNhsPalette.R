context("test-get_nhs_palette")
library(mockery)
library(testthat)

test_that("get_nhs_palette returns a function", {
  expect_is(get_nhs_palette(), "function")
})

test_that("get_nhs_palette returns a function that returns colour strings", {
  expected <- c("#005EB8", "#330072", "#DA291C", "#ED8B00", "#009639")
  actual <- get_nhs_palette()(5)
  expect_equal(actual, expected)

  expected <- c("#003087", "#0072CE", "#00A9CE")
  actual <- get_nhs_palette("blues")(3)
  expect_equal(actual, expected)

  expected <- c("#231F20", "#323941", "#425563", "#5C6D7A", "#768692", "#AEB9C0",
                "#E8EDEE")
  actual <- get_nhs_palette("neutrals")(7)
  expect_equal(actual, expected)
})

test_that("get_nhs_palette calls colorRampPalette", {
  m <- mock()

  with_mock(
    colorRampPalette = m,
    get_nhs_palette()
  )

  expect_call(m, 1, colorRampPalette(pal))
})

test_that("get_nhs_palette calls get_nhs_colours", {
  m <- mock(c("#000000", "#ffffff"), cycle = TRUE)
  stub(get_nhs_palette, "get_nhs_colours", m)

  # first without a section
  get_nhs_palette()
  # then, with a section
  get_nhs_palette("blues")

  expect_called(m, 2)

  expect_call(m, 1, get_nhs_colours("Blue", "Purple", "Red", "Orange", "Green"))
  expect_args(m, 1, "Blue", "Purple", "Red", "Orange", "Green")

  expect_call(m, 2, get_nhs_colours(section = palette))
  expect_args(m, 2, section = "blues")
})

test_that("get_nhs_palette doesn't call rev by default", {
  m <- mock(c("#000000", "#ffffff"))
  stub(get_nhs_palette, "rev", m)

  get_nhs_palette()

  expect_called(m, 0)
})

test_that("get_nhs_palette doesn't call rev when argument is false", {
  m <- mock(c("#000000", "#ffffff"))
  stub(get_nhs_palette, "rev", m)

  get_nhs_palette(reverse = FALSE)

  expect_called(m, 0)
})

test_that("get_nhs_palette calls rev when argument is true", {
  pal <- c("a", "b", "c")

  m <- mock(c("#000000", "#ffffff"))
  stub(get_nhs_palette, "rev", m)
  stub(get_nhs_palette, "get_nhs_colours", mock(pal))

  get_nhs_palette(reverse = TRUE)

  expect_called(m, 1)

  expect_call(m, 1, rev(pal))
  expect_args(m, 1, pal)
})
