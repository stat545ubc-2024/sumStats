#' Calculate Summary Statistics by Group
#'
#' @description
#' The function calculates four summary statistics (min, max, mean, standard deviation) of a variable
#' by group within a data table. The variables used for grouping and summarizing are input by the user.
#'
#' @param data Input data.
#' @param sort_var Variable used for grouping; named as sort_var to indicate that it is used to sort
#' the data into groups for subsequent analysis
#' @param stat_var Numeric variable which is used to calculate summary statistics. Named stat_var as
#' this is the variable with which the summary statistics are calculated
#'
#' @return A tibble is returned which contains the grouping variable and summary statistics as columns (min, max, mean, and standard deviation)
#'
#' @examples
#' if (requireNamespace("palmerpenguins", quietly = TRUE)) {
#'   penguins <- palmerpenguins::penguins
#'   sum_stats(penguins, island, body_mass_g)
#' }
#'
#' if (requireNamespace("datateachr", quietly = TRUE)) {
#'   cancer_sample <- datateachr::cancer_sample
#'   sum_stats(cancer_sample, diagnosis, area_mean)
#' }
#' @importFrom dplyr pull group_by summarize %>%
#' @importFrom stats sd
#' @importFrom rlang enquo
#' @export
sum_stats <- function(data, sort_var, stat_var) {
  #check to see if the variable for summary statistics calculations is numeric
  if (!is.numeric(pull(data, !!enquo(stat_var)))) {
    stop("The variable you are trying to summarize is not numeric.")
  }
  new_data <- {{data}} %>%
    group_by({{sort_var}}) %>%
    summarize(min = if(all(is.na({{stat_var}}))) NA_real_   #if all values are NA, treat NA as double/numeric missing value
              else min({{stat_var}}, na.rm = TRUE),         #remove all NA values before calculation
              max = if(all(is.na({{stat_var}}))) NA_real_   #if all values are NA, treat NA as double/numeric missing value
              else max({{stat_var}}, na.rm = TRUE),
              mean= mean({{stat_var}}, na.rm = TRUE),
              stdev = sd({{stat_var}}, na.rm = TRUE))
  return(new_data)
}
