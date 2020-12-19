#' @title Add excel sheet with a formatted header
#' @description Add excel sheet with a header formatted with bold font, column labels and column width. The function is a wrapper for
#'     \code{openxlsx::addWorksheet} and are using \code{NVIdb::standardize_columns} to standardize columns.
#'
#' @details Add excel sheet with a formatted header. The header will be formatted with bold text.
#'
#'    \code{collabels = TRUE} the column names are translated to column labels in accord with the column standards table, see \code{standardize_columns}.
#'
#'    \code{colwidths = TRUE} the column widths are given in accord with the column standards table, see \code{standardize_columns}.
#'
#'    \code{wrapHeadlineText = TRUE} theheadline text is alowed to wrap on two or more lines. The parameter should be chosen in accord with what looks
#'    nice depending on column labels and column widths.
#'
#'    \code{standards} is the name of the table with column standards. If no parameter is given, the columns_standards.csv is used.  column names are translated to column labels in accord with the column standards table, see \code{standardize_columns}.
#'
#'    \code{dbsource} is the dbsource in the column standards table making it possible to tailer the column laels and column widths per table.
#'
#' @param data the Data frame to export to the Excel sheet
#' @param workbook The woorkbook object
#' @param sheet The Excel sheet name
#' @param wrapHeadlineText Should headline allow wrapping of text. TRUE / FALSE, standard is FALSE
#' @param collabels Should headline be changed to standard labels, TRUE / FALSE, standard is TRUE
#' @param colwidths Should defined standard colwidths be used. TRUE / FALSE, standard is TRUE
#' @param standards tables with column_standards
#' @param dbsource database source of data in column standards table
#'
#'
#' @return None. A new sheet with formatted headline is added to the workbook object with
#'
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export
#' @examples
#' \dontrun{
#' #
#'
#' }
#'

add_formatted_worksheet <- function (data, workbook, sheet,
                                       wrapHeadlineText = FALSE,
                                       collabels = TRUE,
                                       colwidths = TRUE,
                                       standards = NULL,
                                       dbsourde = NULL) {
  # Identify name of input data frame
  dbsource <- deparse(substitute(data))

  # Change colnames o labels
  colnames(data) <- NVIdb::standardize_columns(data = data, dbsource = dbsource, property = "collabels")

  # Include a new worksheet. The workbook must have been created previously
  openxlsx::addWorksheet(wb = workbook, sheetName = sheet)

  # Wrte data to the worsheet
  openxlsx::writeData(wb = workbook, sheet = sheet, data, withFilter = TRUE)

  # Formatting the headline
  # Frozen headline
  openxlsx::freezePane(wb = workbook, sheet = sheet, firstRow = TRUE)
  # Headline in bold, wrapline in accord with function input
  styleBold <- openxlsx::createStyle(textDecoration = "bold", wrapText = wrapHeadlineText)
  openxlsx::addStyle(wb = workbook, sheet = sheet, style = styleBold, rows = 1, cols = 1:dim(data)[2] )
  # Set column widths
  colwidths <- NVIdb::standardize_columns(data = data,
                                  dbsource = dbsource,
                                  property = "colwidths")
  openxlsx::setColWidths(workbook, sheet, cols = c(1:dim(data)[1]), widths = colwidths)
}





