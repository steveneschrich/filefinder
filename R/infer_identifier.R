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
infer_identifier <- function(file_list=list_files(), file_pattern=".*") {
  # Split into file/directory
  res <- file_list |>
    split_file_path() |>
    dplyr::mutate(identifier = coalesce_identifiers(file, file_pattern))

  res
}

#' Find identifiers from a list of files using patterns and coalesce into single identifier
#'
#' @param file
#' @param file_pattern
#'
#' @return
#' @export
#'
#' @examples
coalesce_identifiers <- function(file, file_pattern) {
  dplyr::coalesce(!!!find_identifiers(file, file_pattern))
}

