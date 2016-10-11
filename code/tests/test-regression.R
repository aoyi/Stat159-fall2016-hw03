library(testthat)

source("../functions/regression-functions.R")
data_set <- read.csv("../../data/Advertising.csv")
load("../../data/regression.RData")

context("Test for residual sum of squares")

test_that("RSS works as expected", {
  x <- multi_reg
  y <- data_set$Sales
  expect_gt(residual_sum_squares(x, y), 0)
  expect_equal(round(residual_sum_squares(x, y), digits = 2), 556.83)
  expect_length(residual_sum_squares(x, y), 1)
  expect_type(residual_sum_squares(x, y), 'double')
})

context("Test for total sum of squares")

test_that("TSS works as expected", {
  x <- multi_reg
  y <- data_set$Sales
  expect_gt(total_sum_squares(x, y), 0)
  expect_equal(round(total_sum_squares(x, y), digits = 2), 5417.15)
  expect_length(total_sum_squares(x, y), 1)
  expect_type(total_sum_squares(x, y), 'double')
})

context("Test for R Squared")

test_that("R-Squared works as expected", {
  x <- multi_reg
  y <- data_set$Sales
  expect_gt(r_squared(x, y), 0)
  expect_lt(r_squared(x, y), 1)
  expect_equal(round(r_squared(x, y), digits = 2), 0.90)
  expect_type(r_squared(x, y), 'double')
})

context("Test for F Statistic")

test_that("F-Statistic works as expected", {
  x <- multi_reg
  y <- data_set$Sales
  z <- 3
  expect_gt(f_statistic(x, y, z), 0)
  expect_equal(round(f_statistic(x, y, z), digits = 2), 570.27)
  expect_type(f_statistic(x, y, z), 'double')
})

context("Test for RSE")
test_that("F-Statistic works as expected", {
  x <- multi_reg
  y <- data_set$Sales
  z <- 3
  expect_gt(residual_std_error(x, y), 0)
  expect_equal(round(residual_std_error(x, y), digits = 2), 1.68)
  expect_type(residual_std_error(x, y), 'double')
})

