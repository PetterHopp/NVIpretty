#' @title Style a row in an Excel sheet based on the text in a cell
#' @description Style the row if at least one cell in the row includes
#'     the specified text. This can be used to style rows with footnotes,
#'     explanatory text, summary rows or similar.
#'
#' @details The whole line will be styled.
#'
#'     \ifelse{html}{\code{\link[openxlsx:createStyle]{openxlsx::createStyle}}}{\code{openxlsx::createStyle}}
#'     is used for formatting the row. Use
#'     \code{text_decoration = "bold"} to format the row with bold font.
#'     Use \code{wrap_text = TRUE} and  \code{merge_cells = TRUE} if you
#'     want a footnote to span all cells under the table and potentially
#'     span more lines. If the text spans more than one line, the height
#'     of the row can be adjusted by setting \code{heights = }.
#'
#' @param workbook [\code{work book object}]\cr
#'     The workbook object used to create the Excel workbook. Defaults to `workbook`.
#' @param sheet [\code{character(1)}]\cr
#'     The Excel sheet name. Defaults to `sheet`.
#' @param data [\code{data.frame}]\cr
#'     The data that have been exported to the Excel sheet. Used to
#'     find column number and row number for the pretext for which the row should be styled.
#' @param text [\code{character(1)}]\cr
#'     The text in the cell for which the row should be styled.
#' @param text_decoration [\code{character(1)}]\cr
#'     The text decoration style that should be used. Should be one of
#'     c("bold", "strikeout", "italic", "underline", "underline2"), see
#'     \ifelse{html}{\code{\link[openxlsx:createStyle]{openxlsx::createStyle}}}{\code{openxlsx::createStyle}}.
#'     Defaults to \code{NULL}.
#' @param merge_cells [\code{logical(1)}]\cr
#'     Should the cells in the row spanning the table be merged?
#'     Defaults to \code{FALSE}.
#' @param wrap_text [\code{logical(1)}]\cr
#'     Should the text in the cell be wrapped to fit in the column.
#'     Defaults to \code{FALSE}.
#' @param heights [\code{integer}]\cr
#'     The row height for the formatted row. Defaults to \code{NULL}.
#' @param \dots	Other arguments to be passed to
#'     \ifelse{html}{\code{\link[openxlsx:createStyle]{openxlsx::createStyle}}}{\code{openxlsx::createStyle}}.
#'
#' @return None. One row in the workbook object is styled.
#'
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export


style_text_line <- function(workbook = workbook,
                            sheet = sheet,
                            data,
                            text,
                            text_decoration = NULL,
                            wrap_text = FALSE,
                            merge_cells = FALSE,
                            heights = NULL,
                            ...) {

  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()
  # Perform checks
  checkmate::assert_class(workbook, classes = "Workbook", add = checks)
  NVIcheckmate::assert_character(sheet, len = 1, min.chars = 1, max.chars = 31,
                                 comment = "Remark that sheet names can be at most 31 characters",
                                 add = checks)
  checkmate::assert_data_frame(data, add = checks)
  checkmate::assert_string(text, min.chars = 1, add = checks)
  checkmate::assert_choice(text_decoration,
                           choices = c("bold", "strikeout", "italic", "underline", "underline2"),
                           null.ok = TRUE,
                           add = checks)
  checkmate::assert_flag(wrap_text, add = checks)
  checkmate::assert_flag(merge_cells, add = checks)
  checkmate::assert_integerish(heights, null.ok = TRUE, add = checks)
  # Report check-results
  checkmate::reportAssertions(checks)

  # STYLING ----
  # Style a row in the Excel sheet with the given text in a cell
  if (isTRUE(merge_cells)) {
    openxlsx::mergeCells(wb = workbook,
                         sheet = sheet,
                         cols = 1:dim(data)[2],
                         rows = which(data == text, arr.ind = TRUE)[1] + 1)
  }

  if (!is.null(heights)) {
    openxlsx::setRowHeights(wb = workbook,
                            sheet = sheet,
                            rows = which(data == text, arr.ind = TRUE)[1] + 1,
                            heights = heights)
  }

  # Style a row in the Excel sheet with the given text in a cell
  style <- openxlsx::createStyle(textDecoration = text_decoration, wrapText = wrap_text, ...)
  openxlsx::addStyle(wb = workbook,
                     sheet = sheet,
                     style = style,
                     cols = 1:dim(data)[2],
                     rows = which(data == text, arr.ind = TRUE)[1] + 1)

}
