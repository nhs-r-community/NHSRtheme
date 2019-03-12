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
  m <- mock("#000000", "#ffffff")

  # first without a section
  with_mock(
    getNhsColours = m,
    getNhsPalette()
  )

  expect_call(m, 1, getNhsColours("Blue", "Purple", "Red", "Orange", "Green"))

  # then, with a section
  with_mock(
    getNhsColours = m,
    getNhsPalette("blues")
  )

  expect_call(m, 2, getNhsColours(section = palette))
})

test_that("getNhsPalette doesn't call rev by default", {
  m <- mock("#000000", "#ffffff")
  stub(getNhsPalette, 'rev', m)
  getNhsPalette()
  expect_called(m, 0)
})

test_that("getNhsPalette doesn't call rev when argument is false", {
  m <- mock("#000000", "#ffffff")
  stub(getNhsPalette, 'rev', m)
  getNhsPalette(reverse = FALSE)
  expect_called(m, 0)
})

test_that("getNhsPalette calls rev when argument is true", {
  m <- mock("#000000", "#ffffff")
  stub(getNhsPalette, 'rev', m)
  getNhsPalette(reverse = TRUE)
  expect_called(m, 1)
})
