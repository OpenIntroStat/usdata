context("test-houserace10")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(houserace10), 435)
  expect_equal(ncol(houserace10), 24)
})

test_that("column names are lower case", {
  expect_identical(names(houserace10), tolower(names(houserace10)))
})
