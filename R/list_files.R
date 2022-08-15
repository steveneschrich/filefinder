#' List files in one or more directories
#'
#' @description Performs a [fs::dir_info()] function call on the specified paths
#' with recursion.
#'
#'
#' @param path A character vector of one or more paths. See [fs::dir_info()] for more details.
#'
#' @return A tibble of file information
#' @export
#'
#'
#' @examples
#' if (FALSE) {
#'    list_files(".")
#' }
list_files <- function(path = ".") {
  fs::dir_info(path, recurse=TRUE)
}
