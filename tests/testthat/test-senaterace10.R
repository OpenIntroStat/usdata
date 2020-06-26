context("test-senaterace10")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(senaterace10), 38)
  expect_equal(ncol(senaterace10), 23)
})

test_that("column names are lower case", {
  expect_identical(names(senaterace10), tolower(names(senaterace10)))
})
