#' Find files from a list of files using filters
#'
#' @param file_list A list of files from [fs::dir_info()].
#' @param dirs A list of directories to filter on (can be absolute, use regex)
#' @param file_pattern A list of patterns to match for files
#'
#' @return A `file_list` filtered to the files matching the criteria.
#' @export
#'
#' @examples
#' if (FALSE) {
#'   find_files(file_list=list_files("."), dirs = ".", file_pattern=".*")
#' }
find_files <- function(file_list=list_files(), dirs=".", file_pattern=".*") {
  file_list |>
    split_file_path() |>
    dplyr::filter(purrr::map_lgl(dir, ~any(stringr::str_detect(.x, dirs)))) |>
    dplyr::filter(purrr::map_lgl(file, ~any(stringr::str_detect(.x, file_pattern))))

}
