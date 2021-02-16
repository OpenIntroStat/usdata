context("test-county_2019")

test_that("rows and columns match expected dimensions", {
  expect_equal(nrow(county_2019), 3142)
  expect_equal(ncol(county_2019), 95)
})

test_that("column names are lower case", {
  expect_identical(names(county_2019), tolower(names(county_2019)))
})
