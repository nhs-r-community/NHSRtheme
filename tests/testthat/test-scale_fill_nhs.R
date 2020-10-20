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

test_that("scale_fill_nhs calls get_nhs_palette", {
  m <- mock()
  stub(scale_fill_nhs, "get_nhs_palette", m)

  scale_fill_nhs()
  scale_fill_nhs(reverse = FALSE)
  scale_fill_nhs(reverse = TRUE)

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

  stub(scale_fill_nhs, "discrete_scale", d)
  stub(scale_fill_nhs, "scale_fill_gradientn", c)
  stub(scale_fill_nhs, "get_nhs_palette", mock(p))

  code <- substitute(code)
  eval(code)

  expect_called(d, as.numeric( discrete))
  expect_called(c, as.numeric(!discrete))

  if (discrete) {
    expect_call(d, 1, discrete_scale("fill", paste0("nhstheme_", palette), palette = pal))
    expect_args(d, 1, "fill", "nhstheme_main", palette = p)
  } else {
    expect_call(c, 1, scale_fill_gradientn(colours = pal(256)))
    expect_args(c, 1, colours = p(256))
  }
}

test_that("scale_fill_nhs calls discrete_scale when discrete is left as default", {
  discrete_scale_helper(scale_fill_nhs(), TRUE)
})

test_that("scale_fill_nhs calls discrete_scale when discrete = TRUE", {
  discrete_scale_helper(scale_fill_nhs(discrete = TRUE), TRUE)
})

test_that("scale_fill_nhs calls scale_fill_gradientn when discrete = FALSE", {
  discrete_scale_helper(scale_fill_nhs(discrete = FALSE), FALSE)
})
