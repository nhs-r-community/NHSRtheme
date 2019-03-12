context("test-getNhsPalette")
library(mockery)
library(testthat)

test_that("getNhsPalette returns a function", {
  expect_is(getNhsPalette(), "function")
})

test_that("getNhsPalette returns a function that returns colour strings", {
  expected <- c("#005EB8", "#330072", "#DA291C", "#ED8B00", "#009639")
  actual <- getNhsPalette()(5)
  expect_equal(actual, expected)

  expected <- c("#003087", "#0072CE", "#00A9CE")
  actual <- getNhsPalette("blues")(3)
  expect_equal(actual, expected)

  expected <- c("#231F20", "#323941", "#425563", "#5C6D7A", "#768692", "#AEB9C0",
                "#E8EDEE")
  actual <- getNhsPalette("neutrals")(7)
  expect_equal(actual, expected)
})

test_that("getNhsPalette calls colorRampPalette", {
  m <- mock()

  with_mock(
    colorRampPalette = m,
    getNhsPalette()
  )

  expect_call(m, 1, colorRampPalette(pal))
})

test_that("getNhsPalette calls getNhsColours", {
  m <- mock(c("#000000", "#ffffff"), cycle = TRUE)
  stub(getNhsPalette, "getNhsColours", m)

  # first without a section
  getNhsPalette()
  # then, with a section
  getNhsPalette("blues")

  expect_called(m, 2)

  expect_call(m, 1, getNhsColours("Blue", "Purple", "Red", "Orange", "Green"))
  expect_args(m, 1, "Blue", "Purple", "Red", "Orange", "Green")

  expect_call(m, 2, getNhsColours(section = palette))
  expect_args(m, 2, section = "blues")
})

test_that("getNhsPalette doesn't call rev by default", {
  m <- mock(c("#000000", "#ffffff"))
  stub(getNhsPalette, 'rev', m)

  getNhsPalette()

  expect_called(m, 0)
})

test_that("getNhsPalette doesn't call rev when argument is false", {
  m <- mock(c("#000000", "#ffffff"))
  stub(getNhsPalette, 'rev', m)

  getNhsPalette(reverse = FALSE)

  expect_called(m, 0)
})

test_that("getNhsPalette calls rev when argument is true", {
  pal <- c("a","b","c")

  m <- mock(c("#000000", "#ffffff"))
  stub(getNhsPalette, 'rev', m)
  stub(getNhsPalette, 'getNhsColours', mock(pal))

  getNhsPalette(reverse = TRUE)

  expect_called(m, 1)

  expect_call(m, 1, rev(pal))
  expect_args(m, 1, pal)
})
