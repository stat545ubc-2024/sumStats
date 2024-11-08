#test case 1: vector with no NAs
test_that("Sum_stats testing with data with no NAs works", {
  data_noNA <- data.frame(
    sort_var = c("A", "A", "B", "B", "C", "C"),
    stat_var = c(1,2,3,4,5,6)
  )
  expect_equal(sum_stats(data_noNA, sort_var, stat_var)$min, c(1, 3, 5))
})

#test case 2: vector with NAs
test_that("Sum_stats testing with data including NAs should also work", {

  data_withNA <- data.frame(
    sort_var = c("A", "A", "B", "B", "C", "C"),
    stat_var = c(1,2, NA, NA, NA, 6)
  )
  expect_equal(sum_stats(data_withNA, sort_var, stat_var)$mean, c(1.5, NA, 6))
})

#test case 3: Data has non-numeric input as the variable for summarizing
test_that("Sum_stats fails with non-numeric input as summarizing variable", {

  data_nonNumeric <- data.frame(
    sort_var = c("A", "A", "B", "B", "C", "C"),
    stat_var = c("Hello", "Yes", "Mountain", "River", "Forest", "Desert")
  )
  expect_error(sum_stats(data_nonNumeric))
})
