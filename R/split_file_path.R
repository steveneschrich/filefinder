#' Split filename into file/path components
#'
#' @param file_list A tibble of file information from [fs::dir_info()].
#'
#' @return A `file_list` with two additional columns: `dir` and `file`.
#' @export
#'
#' @importFrom rlang .data
#'
split_file_path <- function(file_list=list_files()) {
  dplyr::mutate(
    file_list,
    dir = dirname(.data$path),
    file = basename(.data$path)
  )
}
