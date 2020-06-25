context("test-state_stats")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(state_stats), 51)
  expect_equal(ncol(state_stats), 24)
})

test_that("column names are lower case", {
  expect_identical(names(state_stats), tolower(names(state_stats)))
})
