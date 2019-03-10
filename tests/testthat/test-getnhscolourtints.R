context("test-getnhscolourtints")
library(mockery)

test_that("getNhsColourTints returns", {
  actual <- getNhsColourTints(seq(0, 1, 0.1))

  expect_equal_to_reference(actual, "getNhsColourTints.rds")
})

test_that("getNhsColourTints throws an error if one of the tint values is not in [0, 1]", {
  expect_error(getNhsColourTints(1.1))
  expect_error(getNhsColourTints(-0.1))
})

test_that("getNhsColourTints calls getNhsColours", {
  m <- mock()

  with_mock(getNhsColours = m,
            getNhsColourTints(seq(0,1,0.1)))

  expect_called(m, 1)

  with_mock(getNhsColours = m,
            getNhsColourTints(seq(0,1,0.1), "Blue", "Green"))

  expect_call(m, 2, getNhsColours("Blue", "Green", section = section))

  with_mock(getNhsColours = m,
            getNhsColourTints(seq(0,1,0.1), section = "blues"))

  expect_call(m, 3, getNhsColours(section = section))
})
