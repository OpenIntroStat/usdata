context("test-county_complete")

test_that("rows and columns match expected dimensions", {
  expect_equal(nrow(county_complete), 3142)
  expect_equal(ncol(county_complete), 188)
})

test_that("column names are lower case", {
  expect_identical(names(county_complete), tolower(names(county_complete)))
})
