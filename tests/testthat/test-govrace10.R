context("test-govrace10")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(govrace10), 37)
  expect_equal(ncol(govrace10), 23)
})

test_that("column names are lower case", {
  expect_identical(names(govrace10), tolower(names(govrace10)))
})
