context("test-scale_fill_nhs")
library(mockery)
library(testthat)

test_that("scale_fill_nhs returns a ggplot scale", {
  expect_is(scale_fill_nhs(),
            c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  expect_is(scale_fill_nhs(discrete = TRUE),
            c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  expect_is(scale_fill_nhs(discrete = FALSE),
            c("ScaleContinuous", "Scale", "ggproto", "gg"))
})

test_that("scale_fill_nhs calls getNhsPalette", {
  m <- mock()
  stub(scale_fill_nhs, "getNhsPalette", m)

  scale_fill_nhs()
  scale_fill_nhs(reverse = FALSE)
  scale_fill_nhs(reverse = TRUE)

  expect_called(m, 3)

  expect_call(m, 1, getNhsPalette(palette = palette, reverse = reverse))
  expect_args(m, 1, palette = "main", reverese = FALSE)

  expect_call(m, 2, getNhsPalette(palette = palette, reverse = reverse))
  expect_args(m, 2, palette = "main", reverese = FALSE)

  expect_call(m, 3, getNhsPalette(palette = palette, reverse = reverse))
  expect_args(m, 3, palette = "main", reverese = TRUE)
})

test_that("scale_fill_nhs calls discrete_scale when discrete is left as default", {
  d <- mock()
  c <- mock()
  p <- function(n) { n }

  stub(scale_fill_nhs, "discrete_scale", d)
  stub(scale_fill_nhs, "scale_fill_gradientn", c)
  stub(scale_fill_nhs, "getNhsPalette", mock(p))

  scale_fill_nhs()

  expect_called(d, 1)
  expect_called(c, 0)

  expect_call(d, 1, discrete_scale("fill", paste0("nhstheme_", palette), palette = pal))
  expect_args(d, 1, "fill", "nhstheme_main", palette = p)
})

test_that("scale_fill_nhs calls discrete_scale when discrete = TRUE", {
  d <- mock()
  c <- mock()
  p <- function(n) { n }

  stub(scale_fill_nhs, "discrete_scale", d)
  stub(scale_fill_nhs, "scale_fill_gradientn", c)
  stub(scale_fill_nhs, "getNhsPalette", mock(p))

  scale_fill_nhs(discrete = TRUE)

  expect_called(d, 1)
  expect_called(c, 0)

  expect_call(d, 1, discrete_scale("fill", paste0("nhstheme_", palette), palette = pal))
  expect_args(d, 1, "fill", "nhstheme_main", palette = p)
})

test_that("scale_fill_nhs calls scale_fill_gradientn when discrete = FALSE", {
  d <- mock()
  c <- mock()
  p <- function(n) { n }

  stub(scale_fill_nhs, "discrete_scale", d)
  stub(scale_fill_nhs, "scale_fill_gradientn", c)
  stub(scale_fill_nhs, "getNhsPalette", mock(p))

  scale_fill_nhs(discrete = FALSE)

  expect_called(d, 0)
  expect_called(c, 1)

  expect_call(c, 1, scale_fill_gradientn(colours = pal(256)))
  expect_args(c, 1, colours = p(256))
})
