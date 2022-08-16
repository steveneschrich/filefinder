#' Extract identifiers from a list of files using regexes
#'
#' @param file_list A list of files from [fs::dir_info()].
#' @param file_pattern A list of patterns to match for files and extract capture groups.
#'
#' @return A `file_list` with a new column, `identifier`, populated using the regexes of the
#'  parameter `file_pattern`.
#' @export
#'
#' @examples
#' if (FALSE) {
#'   extract_identifier(file_list=list_files("."), file_pattern="^([A-Z]).*")
#' }
extract_identifier <- function(file_list=list_files(), file_pattern=".*") {
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


#' Find identifiers from a list of files using patterns
#'
#' @param file
#' @param file_pattern
#'
#' @return
#' @export
#'
#' @examples
find_identifiers <- function(file, file_pattern) {
  purrr::map(file_pattern, ~find_identifier(file, .x))
}

#' Find identifier from a list of files using a single pattern
#'
#' @param file
#' @param file_pattern
#'
#' @return
#' @export
#'
#' @examples
find_identifier <- function(file, file_pattern) {
  stringr::str_match(file, file_pattern)[,2]
}
