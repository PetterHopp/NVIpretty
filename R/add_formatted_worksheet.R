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
#'    \code{colwidths = "auto"} the column widths are given automatic column width. This is not recommend for large tables.
#'
#'    \code{wrapHeadlineText = TRUE} theheadline text is allowed to wrap on two or more lines. The parameter should be chosen in accord with what looks
#'    nice depending on column labels and column widths.
#'
#'    \code{standards} is the name of the table with column standards. If no parameter is given, the columns_standards.csv is used.  column names are translated to column labels in accord with the column standards table, see \code{standardize_columns}.
#'
#'    \code{dbsource} is the dbsource in the column standards table making it possible to tailer the column laels and column widths per table.
#'
#' @param data the Data frame to export to the Excel sheet
#' @param workbook The workbook object
#' @param sheet The Excel sheet name
#' @param wrapHeadlineText Should headline allow wrapping of text. TRUE / FALSE, standard is FALSE
#' @param collabels Should headline be changed to standard labels, TRUE / FALSE, standard is TRUE
#' @param colwidths Should defined standard column widths be used. TRUE / FALSE or "auto", standard is TRUE
#' @param standards tables with column_standards
#' @param dbsource database source of data in column standards table
#'
#'
#' @return None. A new sheet with formatted headline is added to the workbook object
#'
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export
#' @examples
#' \dontrun{
#' # Attach packages and set up with temporary directory
#' td <- tempdir()
#' library(NVIpretty)
#' library(openxlsx)

#'
#' # Generate Excel-sheet
#' workbook <- createWorkbook()
#'
#' # Add a sheet to the workbook
#' add_formatted_worksheet(iris,
#'                         workbook,
#'                         sheet = "iris",
#'                         wrapHeadlineText = TRUE,
#'                         collabels = TRUE,
#'                         colwidths = FALSE,
#'                         standards = NULL)
#'
#' #Save the workbook
#' saveWorkbook(wb = workbook,
#'              file = paste0(td, "/iris.xlsx"),
#'                           overwrite = TRUE)
#'
#' print(paste("One I may examine the Excel workbook at", td))
#' }
#'

add_formatted_worksheet <- function (data, workbook, sheet,
                                     wrapHeadlineText = FALSE,
                                     collabels = TRUE,
                                     colwidths = TRUE,
                                     standards = NULL,
                                     dbsource = deparse(substitute(data))) {

  # Argument checking
  checks <- checkmate::makeAssertCollection()
  checkmate::assert_data_frame(data, max.rows = (1048576 - 1), max.cols = 16384, add = checks)
  checkmate::assert_class(workbook, classes = "Workbook", add = checks)
  checkmate::assert_character(sheet, len = 1, min.chars = 1, add = checks)
  checkmate::assert_logical(wrapHeadlineText, add = checks)
  checkmate::assert_logical(collabels, add = checks)
  checkmate::assert_data_frame(standards, add = checks, null.ok = TRUE)
  checkmate::assert_character(dbsource, add = checks)
  checkmate::reportAssertions(checks)

  checkmate::assert(checkmate::check_logical(colwidths),
                    checkmate::check_choice(colwidths, choices = "auto"))
  # The column widths must be set before changing headlines to labels
  # Ensure that colwidths_Excel always has a value, set standard Excel column width +0.01 as standard value (will be reduced to 10.88)
  colwidths_Excel <- 10.89
  if (colwidths == TRUE) {
    colwidths_Excel <- NVIdb::standardize_columns(data = data,
                                                  dbsource = dbsource,
                                                  standards = standards,
                                                  property = "colwidths_Excel")
    # TO DO: Fix of standardize_columns to avoid NULL in colwidths_Excel
      if (is.null(colwidths_Excel)) {colwidths_Excel <- 10.89}

  }
  if (colwidths == "auto") {
    colwidths_Excel <- colwidths
  }

  # Change column names to labels
  if (collabels == TRUE) {
    colnames(data) <- NVIdb::standardize_columns(data = data, dbsource = dbsource, standards = standards, property = "collabels")
  }

  # Include a new worksheet. The workbook must have been created previously
  openxlsx::addWorksheet(wb = workbook, sheetName = sheet)

  # Write data to the worksheet
  openxlsx::writeData(wb = workbook, sheet = sheet, data, withFilter = TRUE)

  # Formatting the headline
  # Frozen headline
  openxlsx::freezePane(wb = workbook, sheet = sheet, firstRow = TRUE)
  # Headline in bold, wrap line in accord with function input
  styleBold <- openxlsx::createStyle(textDecoration = "bold", wrapText = wrapHeadlineText)
  openxlsx::addStyle(wb = workbook, sheet = sheet, style = styleBold, rows = 1, cols = 1:dim(data)[2] )

  # Set column widths
    openxlsx::setColWidths(workbook, sheet, cols = c(1:dim(data)[2]), widths = colwidths_Excel)

  # if (colwidths == TRUE | colwidths == "auto") {
  #   if (is.null(colwidths_Excel) ) {colwidths_Excel <- 10.78} # Until fix of standardize_columns to avoid NULL
  #   openxlsx::setColWidths(workbook, sheet, cols = c(1:dim(data)[2]), widths = colwidths_Excel)
  # }
  # if (colwidths == FALSE) {
  #   colwidths_Excel <- 10.78
  #   openxlsx::setColWidths(workbook, sheet, cols = c(1:dim(data)[2]), widths = colwidths_Excel)
  # }
}





