context("test-county")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(county), 3142)
  expect_equal(ncol(county), 15)
})

test_that("column names are lower case", {
  expect_identical(names(county), tolower(names(county)))
})
