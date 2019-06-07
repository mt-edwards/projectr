#' A function to create a data science directory
#'
#' @return
#' @export
#'
#' @examples
structure_directory <- function() {
  fs::dir_create("data")
  fs::dir_create(fs::path("notebooks", "1_import"))
  fs::dir_create(fs::path("notebooks", "2_tidy"))
  fs::dir_create(fs::path("notebooks", "3_export"))
  fs::dir_create(fs::path("notebooks", "4_model"))
  fs::dir_create(fs::path("notebooks", "5_communicate"))
}

#' A function to locate project data
#'
#' @param data_directory
#'
#' @return
#' @export
#'
#' @examples
locate_data <- function(data_directory) {
  fs::file_create("config.yml")
  write("default:", file = "config.yml")
  write(glue::glue('  data_directory: "{data_directory}"'), file = "config.yml")
  write("config.yml", file = ".gitignore", append = TRUE)
}
