context("test-prrace08")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(prrace08), 51)
  expect_equal(ncol(prrace08), 7)
})

test_that("column names are lower case", {
  expect_identical(names(prrace08), tolower(names(prrace08)))
})
