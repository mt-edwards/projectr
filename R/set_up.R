#' @title Structure Data Analysis Project
#'
#' @description structure_project creates a directory for data, a directory for
#' notebooks and a directory for R scripts in the project directory. The
#' directory for notebooks contains five subdirectories: 1_import, 2_tidy,
#' 3_explore, 4_model and 5_communicate. These directories correspond to the
#' five data analysis stages identified in
#' \href{https://r4ds.had.co.nz/}{R for Data Science} by Hadley Wickham. The
#' data directory is added to the .gitignore file.
#'
#' @export
structure_project <- function() {
  fs::dir_create("data")
  usethis::use_git_ignore("data")
  fs::dir_create(fs::path("notebooks", "1_import"))
  fs::dir_create(fs::path("notebooks", "2_tidy"))
  fs::dir_create(fs::path("notebooks", "3_explore"))
  fs::dir_create(fs::path("notebooks", "4_model"))
  fs::dir_create(fs::path("notebooks", "5_communicate"))
  fs::dir_create("R")
}

#' @title Set Data Directory
#'
#' @description set_data_directory sets a directory external to the project
#' directory with the config package. The absolute path to the data
#' directory is stored in a config.yml file that is added to the .gitignore. The
#' data directory can be different for each collaborator of the project.
#'
#' @param path absolute path to data directory
#'
#' @export
set_data_directory <- function(path) {
  fs::file_create("config.yml")
  usethis::use_git_ignore("config.yml")
  write("default:", file = "config.yml")
  write(glue::glue('  data_directory: "{path}"'),
    file = "config.yml",
    append = TRUE
  )
}

#' @title Data Directory File Path
#'
#' @description data_file_path returns an absolute path to a file in the
#' data directory set by \code{\link{set_data_directory}}. The data
#' directory can be different for each collaborator of the project.
#'
#' @param path relative path from data directory to file
#'
#' @return absolute path to file
#' @export
data_file_path <- function(path) {
  fs::path(config::get("data_directory"), path)
}
