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

test_that("scale_colour_nhs calls get_nhs_palette", {
  m <- mock()
  stub(scale_colour_nhs, "get_nhs_palette", m)

  scale_colour_nhs()
  scale_colour_nhs(reverse = FALSE)
  scale_colour_nhs(reverse = TRUE)

  expect_called(m, 3)

  expect_call(m, 1, get_nhs_palette(palette = palette, reverse = reverse))
  expect_args(m, 1, palette = "main", reverese = FALSE)

  expect_call(m, 2, get_nhs_palette(palette = palette, reverse = reverse))
  expect_args(m, 2, palette = "main", reverese = FALSE)

  expect_call(m, 3, get_nhs_palette(palette = palette, reverse = reverse))
  expect_args(m, 3, palette = "main", reverese = TRUE)
})

discrete_scale_helper <- function(code, discrete) {
  d <- mock()
  c <- mock()
  p <- function(n) { n }

  stub(scale_colour_nhs, "discrete_scale", d)
  stub(scale_colour_nhs, "scale_colour_gradientn", c)
  stub(scale_colour_nhs, "get_nhs_palette", mock(p))

  code <- substitute(code)
  eval(code)

  expect_called(d, as.numeric( discrete))
  expect_called(c, as.numeric(!discrete))

  if (discrete) {
    expect_call(d, 1, discrete_scale("colour", paste0("nhstheme_", palette), palette = pal))
    expect_args(d, 1, "colour", "nhstheme_main", palette = p)
  } else {
    expect_call(c, 1, scale_colour_gradientn(colours = pal(256)))
    expect_args(c, 1, colours = p(256))
  }
}

test_that("scale_colour_nhs calls discrete_scale when discrete is left as default", {
  discrete_scale_helper(scale_colour_nhs(), TRUE)
})

test_that("scale_colour_nhs calls discrete_scale when discrete = TRUE", {
  discrete_scale_helper(scale_colour_nhs(discrete = TRUE), TRUE)
})

test_that("scale_colour_nhs calls scale_fill_gradientn when discrete = FALSE", {
  discrete_scale_helper(scale_colour_nhs(discrete = FALSE), FALSE)
})
