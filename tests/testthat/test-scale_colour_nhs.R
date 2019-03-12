context("test-scale_colour_nhs")
library(mockery)
library(testthat)

test_that("scale_colour_nhs returns a ggplot scale", {
  expect_is(scale_colour_nhs(),
            c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  expect_is(scale_colour_nhs(discrete = TRUE),
            c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  expect_is(scale_colour_nhs(discrete = FALSE),
            c("ScaleContinuous", "Scale", "ggproto", "gg"))
})

test_that("scale_colour_nhs calls getNhsPalette", {
  m <- mock()
  stub(scale_colour_nhs, "getNhsPalette", m)

  scale_colour_nhs()

  expect_called(m, 1)

  expect_call(m, 1, getNhsPalette(palette = palette, reverse = reverse))
  expect_args(m, 1, palette = "main", reverese = FALSE)
})

test_that("scale_colour_nhs calls discrete_scale when discrete is left as default", {
  d <- mock()
  c <- mock()
  p <- function(n) { n }

  stub(scale_colour_nhs, "discrete_scale", d)
  stub(scale_colour_nhs, "scale_colour_gradientn", c)
  stub(scale_colour_nhs, "getNhsPalette", mock(p))

  scale_colour_nhs()

  expect_called(d, 1)
  expect_called(c, 0)

  expect_call(d, 1, discrete_scale("colour", paste0("nhstheme_", palette), palette = pal))
  expect_args(d, 1, "colour", "nhstheme_main", palette = p)
})

test_that("scale_colour_nhs calls discrete_scale when discrete = TRUE", {
  d <- mock()
  c <- mock()
  p <- function(n) { n }

  stub(scale_colour_nhs, "discrete_scale", d)
  stub(scale_colour_nhs, "scale_colour_gradientn", c)
  stub(scale_colour_nhs, "getNhsPalette", mock(p))

  scale_colour_nhs(discrete = TRUE)

  expect_called(d, 1)
  expect_called(c, 0)

  expect_call(d, 1, discrete_scale("colour", paste0("nhstheme_", palette), palette = pal))
  expect_args(d, 1, "colour", "nhstheme_main", palette = p)
})

test_that("scale_colour_nhs calls scale_colour_gradientn when dicrete = FALSE", {
  d <- mock()
  c <- mock()
  p <- function(n) { n }

  stub(scale_colour_nhs, "discrete_scale", d)
  stub(scale_colour_nhs, "scale_colour_gradientn", c)
  stub(scale_colour_nhs, "getNhsPalette", mock(p))

  scale_colour_nhs(discrete = FALSE)

  expect_called(d, 0)
  expect_called(c, 1)

  expect_call(c, 1, scale_colour_gradientn(colours = pal(256)))
  expect_args(c, 1, colours = p(256))
})
