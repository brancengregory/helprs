#' @title Ratio
#' 
#' @export
#'
ratio <- function(.data,  ..., .na_rm = FALSE) {
  grouping_vars <- rlang::enquos(...)

  .data |>
    dplyr::group_by(!!!grouping_vars) |>
    dplyr::summarise(ratio = n() / sum(n(), na.rm = .na_rm))
}


#' @title Count and Ratio
#' 
#' @export 
#' 
count_and_ratio <- function(.data, ..., .na_rm = FALSE) {
  grouping_vars <- rlang::enquos(...)

  .data |>
    dplyr::count(!!!grouping_vars) |>
    dplyr::mutate(ratio = n / sum(n, na.rm = .na_rm))
}

library(ojodb)

ojo_civ_cases() |>
  head(100) |>
  count_and_ratio(district)

