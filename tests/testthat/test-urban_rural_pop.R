context("test-urban_rural_pop")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(urban_rural_pop), 51)
  expect_equal(ncol(urban_rural_pop), 5)
})

test_that("column names are lower case", {
  expect_identical(names(urban_rural_pop), tolower(names(urban_rural_pop)))
})
