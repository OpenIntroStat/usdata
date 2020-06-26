context("test-urban_owner")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(urban_owner), 52)
  expect_equal(ncol(urban_owner), 28)
})

test_that("column names are lower case", {
  expect_identical(names(urban_owner), tolower(names(urban_owner)))
})
