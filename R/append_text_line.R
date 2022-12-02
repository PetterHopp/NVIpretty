#' @title Append new last row with text
#' @description Function to add new row with text in a data frame.
#'     This is intended for appending explanation text (footnotes etc.)
#'     to data frames that should be published in Excel.
#'
#' @details Two rows are appended to the data frame, the first is empty, the second has the generated date in the first column. The
#'
#' @param data Data frame with data that should get new row with the text.
#' @param text The text that should be appended.
#' @param empty_rows Number of empty rows between the data and the text.
#'
#' @return A data frame with two more rows, one empty and one with generated data in the first column.
#'
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export
#' @examples
#' \dontrun{
#' # Add row with generated date using standard values
#' gris_virus_slaktegris_utvalg <- append_date_generated_line(gris_virus_slaktegris_utvalg)
#' }
#'
append_text_line <- function(data, text, empty_rows = 0) {

  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  # Perform checks
  checkmate::assert_data_frame(data, add = checks)
  checkmate::assert_character(text, add = checks)
  checkmate::assert_integerish(empty_rows, lower = 0, add = checks)
  # Report check-results
  checkmate::reportAssertions(checks)

  # Transforms to data frame as this is more flexible than tibble, i.e. accepts adding character to numeric variable
  data <- as.data.frame(data)

  # Includes n_rows_ahead empty rows at end of data frame
  data[(dim(data)[1] + 1):(dim(data)[1] + empty_rows + 1), ] <- NA

  # input text
  data[dim(data)[1], 1] <- text

  return(data)
}
