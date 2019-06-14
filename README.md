
<!-- README.md is generated from README.Rmd. Please edit that file -->

# projectr

<!-- badges: start -->

<!-- badges: end -->

This package provides tools to facilitate a data analysis project. These
tools include a function to structure the project directory, a function
to set up a directory external to the project directory, a function to
get the absolute path to files in the external directory and a function
to git ignore files.

## Installation

This package is not currently available from CRAN. To install the
package from [GitHub](https://github.com/) run:

``` r
# install.packages("devtools")
devtools::install_github("mt-edwards/projectr")
```

## Example

To structure a new data analysis project, in the console, run:

``` r
projectr::structure_project()
```

To set a directory (e.g. `~/documents/data`) external to the project
directory, in the console, run:

``` r
projectr::set_external_directory("~/documents/data")
```

To get the absolute path to a file (e.g. `file.csv`) in the external
directory run:

``` r
projectr::external_directory_path("file.csv")
```

To git ingnore a file (e.g. `temp.R`), in the console, run:

``` r
git_ignore("temp.R")
```