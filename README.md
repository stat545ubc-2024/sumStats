
# sumStats

The goal of sumStats is to provide a simple function, sum_stats(), which
groups a dataset based on an input column and then performs summary
statistics on an input numeric variable within the dataset. This
function is useful for users that want to quickly obtain the mean, min,
max, and standard deviation of a numeric variable for separate groups
within their data.

## Installation

You can install the development version of sumStats like so:

``` r
#install devtools if not already installed
install.packages("devtools")

#install 'sumStats' from Github
devtools::install_github("stat545ubc-2024/sumStats", ref = "0.1.0")
```

## Example: penguins dataset

This is a basic example which loads the penguins dataset from the
palmerpenguins package. It then groups the penguins dataset by island
and computes the summary statistics for the body_mass_g variable,
yielding a tibble with the island and the summary statistics as columns.
The function removes NA values while performing the calculations.

``` r
library(sumStats)
## basic example code; only runs if palmerpenguins is installed
if (requireNamespace("palmerpenguins", quietly = TRUE)) {
   penguins <- palmerpenguins::penguins
   sum_stats(penguins, island, body_mass_g)
 }
#> # A tibble: 3 × 5
#>   island      min   max  mean stdev
#>   <fct>     <int> <int> <dbl> <dbl>
#> 1 Biscoe     2850  6300 4716.  783.
#> 2 Dream      2700  4800 3713.  417.
#> 3 Torgersen  2900  4700 3706.  445.
```
