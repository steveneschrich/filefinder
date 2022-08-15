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
