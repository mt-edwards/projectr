#' @title Add Line to Gitignore File
#'
#' @description git_ignore adds a line to the .gitignore file if the .gitignore
#' file exists and does not contain the line. This function is used in the
#' \code{\link{structure_project}} function and the
#' \code{\link{set_external_directory} function.
#'
#' @param line line to add
#'
#' @export
git_ignore <- function(line) {
  if (fs::file_exists(".gitignore") & !any(readLines(".gitignore") == line)) {
    write(line, file = ".gitignore", append = TRUE)
  }
}

#' @title Structure Data Analysis Project
#'
#' @description structure_project creates a directory for data, a directory for
#' notebooks and a directory for R scripts in the project directory. The
#' directory for notebooks contains five subdirectories: 1_import, 2_tidy,
#' 3_explore, 4_model and 5_communicate. These directories correspond to the
#' five data analysis stages identified in R for Data Science by Hadley Wickham.
#' The data directory is added to the .gitignore file.
#'
#' @export
structure_project <- function() {
  fs::dir_create("data")
  git_ignore("data")
  fs::dir_create(fs::path("notebooks", "1_import"))
  fs::dir_create(fs::path("notebooks", "2_tidy"))
  fs::dir_create(fs::path("notebooks", "3_explore"))
  fs::dir_create(fs::path("notebooks", "4_model"))
  fs::dir_create(fs::path("notebooks", "5_communicate"))
  fs::dir_create("R")
}

#' @title Set External Project Directory
#'
#' @description set_external_directory sets a directory external to the project
#' directory with the config package. The absolute path to the external
#' directory is stored in a config.yml file that is added to the .gitignore. The
#' external directory can be different for each collaborator of the project.
#'
#' @param path absolute path to external directory
#'
#' @export
set_external_directory <- function(path) {
  fs::file_create("config.yml")
  git_ignore("config.yml")
  write("default:", file = "config.yml")
  write(glue::glue('  external_directory: "{path}"'), file = "config.yml", append = TRUE)
}

#' @title Return File from External Project Directory
#'
#' @description external_file_path returns an absolute path to a file in the
#' external directory set by \code{\link{set_external_directory}}. The external
#' directory can be different for each collaborator of the project.
#'
#' @param path relative path from external directory to file
#'
#' @return absolute path to file
#' @export
external_file_path <- function(path) {
  fs::path(config::get("external_directory"), path)
}
