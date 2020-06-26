context("test-vote_nsa")

test_that("rows and columns match old openintro data", {
  expect_equal(nrow(vote_nsa), 434)
  expect_equal(ncol(vote_nsa), 5)
})

test_that("column names are lower case", {
  expect_identical(names(vote_nsa), tolower(names(vote_nsa)))
})
