#' @title Add excel sheet with a formatted header
#' @description Add excel sheet with a header formatted with bold font, column
#'     labels and column width. The function is a wrapper for
#'     \ifelse{html}{\code{\link[openxlsx:addWorksheet]{openxlsx::addWorksheet}}}{\code{openxlsx::addWorksheet}}
#'     and are using
#'     \ifelse{html}{\code{\link[NVIdb:standardize_columns]{NVIdb::standardize_columns}}}{\code{NVIdb::standardize_columns}}
#'     to standardize columns.
#'
#' @details Add excel sheet with a formatted header. The header will be formatted
#'     with bold text.
#'
#'     \code{collabels = TRUE} the column names are translated to column labels
#'     in accord with the column standards table, see
#'     \ifelse{html}{\code{\link[NVIdb:standardize_columns]{NVIdb::standardize_columns}}}{\code{NVIdb::standardize_columns}}.
#'
#'     \code{colwidths = TRUE} the column widths are given in accord with the
#'     column standards table, see
#'     \ifelse{html}{\code{\link[NVIdb:standardize_columns]{NVIdb::standardize_columns}}}{\code{NVIdb::standardize_columns}}.
#'
#'     \code{colwidths = "auto"} the column widths are given automatic column
#'     width. This is not recommend for large tables.
#'
#'     \code{wrapHeadlineText = TRUE} the headline text is allowed to wrap on
#'     two or more lines. The parameter should be chosen in accord with what looks
#'     nice depending on column labels and column widths.
#'
#'     \code{standards} is the name of the table or file with column standards.
#'     If \code{standards} = \code{NULL} the file "columns_standards.csv" is used.
#'     Column names are translated to column labels in accord with the column
#'     standards table, see
#'     \ifelse{html}{\code{\link[NVIdb:standardize_columns]{NVIdb::standardize_columns}}}{\code{NVIdb::standardize_columns}}.
#'
#'     It is also possible to give the standards as a \code{data.frame} or as a
#'     \code{list}. The list input to column_standards must follow a specific
#'     format. It is a \code{list} with at least three named vectors:
#' \itemize{
#' \item \code{colname}: a vector of all columns in in the source file that
#'     should be included in the Excel report with the selection list.
#' \item \code{collabel}: A vector with the labels that should be used in the
#'     Excel report.
#' \item \code{colwidth}: A vector with the column width that should be used
#'     in the Excel report.
#' }
#'
#'     In addition one may input:
#'
#' \itemize{
#' \item \code{colorder}: the order of the columns to be used in the Excel report.
#'     The default is to use the same order as they are entered in the vectors.
#' \item \code{column_db}: input added as a possibility to keep on the same format
#'     as \code{column_standards}. Not necessary to input.
#' \item \code{table_db}: input added as a possibility to keep on the same format
#'     as \code{column_standards}. Must be the same as \code{dbsource}. Not
#'     necessary to input.
#' }
#'
#' All vectors must have the same order and the same length.
#' #'     \code{dbsource} is the dbsource in the column standards table making it
#'     possible to tailer the column labels and column widths per table.
#'
#' @param data [\code{data.frame}]\cr
#'     The data to export to the Excel sheet.
#' @param workbook [\code{work book object}]\cr
#'     The workbook object used to create the Excel workbook.
#' @param sheet [\code{character(1)}]\cr
#'     The Excel sheet name.
#' @param wrapHeadlineText [\code{logical(1)}]\cr
#'     Should headline allow wrapping of text. Defaults to \code{FALSE}.
#' @param collabels [\code{logical(1)}]\cr
#'     Should headline be changed to standard labels. Defaults to \code{TRUE}.
#' @param colwidths [\code{logical(1)}] or \code{"auto"}\cr
#'     Should defined standard column widths be used. Defaults to \code{TRUE}.
#' @param standards [\code{data.frame} | \code{list} | \code{character(1)}]\cr
#' The column standards to be used as input for
#'     \ifelse{html}{\code{\link[NVIdb]{standardize_columns}}}{\code{NVIdb::standardize_columns}}
#'     when formatting the Excel sheet columns, see details. Defaults to \code{NULL}.
#' @param dbsource [\code{character(1)}]\cr
#'     Database source of data in column standards table. Defaults to name
#'     of input data.
#' @param FUN [\code{function}]\cr
#'     Function for additional formatting of the worksheet. Either
#'     predefined functions in this package or self made. Defaults to
#'     \code{NULL}.
#' @param \dots	Other arguments to be passed to \code{FUN}.
#'
#' @return None. A new sheet with formatted headline is added to the workbook object.
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
#' # Save the workbook
#' saveWorkbook(wb = workbook,
#'              file = paste0(td, "/iris.xlsx"),
#'                           overwrite = TRUE)
#'
#' print(paste("One may examine the Excel workbook at", normalizepath(td, )))
#' }
#'
add_formatted_worksheet <- function(data, workbook, sheet,
                                    wrapHeadlineText = FALSE,
                                    collabels = TRUE,
                                    colwidths = TRUE,
                                    standards = NULL,
                                    dbsource = deparse(substitute(data)),
                                    FUN = NULL,
                                    ...) {

  # PREPARE ARGUMENTS BEFORE CHECKING ----
  if (is.null(standards)) {
    standards <- file.path(NVIdb::set_dir_NVI("ProgrammeringR", slash = FALSE),
                           "standardization", "colnames", "column_standards.csv")
  }

  if (!is.null(FUN)) {FUN = match.fun(FUN)}

  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()

  # Perform checks
  checkmate::assert_data_frame(data, max.rows = (1048576 - 1), max.cols = 16384, add = checks)
  checkmate::assert_class(workbook, classes = "Workbook", add = checks)
  NVIcheckmate::assert_character(sheet, len = 1, min.chars = 1, max.chars = 31,
                                 comment = "Remark that sheet names can be at most 31 characters",
                                 add = checks)
  checkmate::assert_logical(wrapHeadlineText, add = checks)
  checkmate::assert_logical(collabels, add = checks)
  # standards
  # checkmate::assert_data_frame(standards, add = checks, null.ok = TRUE)
  checkmate::assert(checkmate::check_class(standards, classes = c("data.frame")),
                    checkmate::check_class(standards, classes = c("list")),
                    checkmate::check_class(standards, classes = c("character")),
                    add = checks)
  if (inherits(standards, what = "character")) {
    checkmate::assert_file_exists(standards, add = checks)
  }
  if (inherits(standards, what = "list")) {
    lengths_standard <- lengths(standards)
    NVIcheckmate::assert_integer(lengths_standard, lower = lengths_standard[1], upper = lengths_standard[1],
                                 min.len = 3, max.len = 6,
                                 comment = "When input as a list, all elements must have the same length",
                                 add = checks)
    checkmate::assert_subset(names(standards), choices = c("table_db", "colname_db", "colname", "collabel", "colwidth", "colorder"),
                             add = checks)
  }
  if (inherits(standards, what = "data.frame")) {
    checkmate::assert_data_frame(standards, min.rows = 1, min.cols = 6, add = checks)
  }
  # dbsource
  checkmate::assert_character(dbsource, add = checks)
  # colwidths
  NVIcheckmate::assert(checkmate::check_logical(colwidths),
                       checkmate::check_choice(colwidths, choices = "auto"),
                       combine = "or",
                       add = checks)

  # Report check-results
  checkmate::reportAssertions(checks)

  # REMOVE CHARACTERS THAT MAKES THE EXCEL-FILE UNREADABLE
  # remove hexadecimal code for record separator and unit separator
  data[] <- lapply(data, function(y) gsub("\u001F|\u001E", "", y)) # include u001C and u001D?
  # remove octal code for record separator and unit separator
  data[] <- lapply(data, function(y) gsub("\036|\037", "", y)) # include 034, 035?

  # RUNNING SCRIPT ----
  # Gather colnames and nrows from input data
  # These can be used to run functions based on original colnames even after colnames has been changed
  colnames_in_data <- colnames(data)
  nrows_in_data <- nrow(data)

  # The column widths must be set before changing headlines to labels
  # Ensure that colwidths_Excel always has a value, set standard Excel column width +0.01 as standard value (will be reduced to 10.88)
  colwidths_Excel <- 10.71
  if (colwidths == TRUE) {
    colwidths_Excel <- NVIdb::standardize_columns(data = data,
                                                  dbsource = dbsource,
                                                  standards = standards,
                                                  property = "colwidths_Excel")
    # TO DO: Fix of standardize_columns to avoid NULL in colwidths_Excel
    if (is.null(colwidths_Excel)) {colwidths_Excel <- 10.71}

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
  openxlsx::addStyle(wb = workbook, sheet = sheet, style = styleBold, rows = 1, cols = 1:dim(data)[2])

  # Set column widths
  openxlsx::setColWidths(wb = workbook, sheet = sheet, cols = c(1:dim(data)[2]), widths = colwidths_Excel)

  if (!is.null(FUN)) {
    FUN(workbook = workbook, sheet = sheet, nrows_in_data = nrows_in_data, colnames_in_data = colnames_in_data, ...)
  }
  # if (colwidths == TRUE | colwidths == "auto") {
  #   if (is.null(colwidths_Excel) ) {colwidths_Excel <- 10.78} # Until fix of standardize_columns to avoid NULL
  #   openxlsx::setColWidths(workbook, sheet, cols = c(1:dim(data)[2]), widths = colwidths_Excel)
  # }
  # if (colwidths == FALSE) {
  #   colwidths_Excel <- 10.78
  #   openxlsx::setColWidths(workbook, sheet, cols = c(1:dim(data)[2]), widths = colwidths_Excel)
  # }
}
