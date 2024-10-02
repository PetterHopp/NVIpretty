#' @title Style cell background in Excel sheet based on column name
#' @description Style the cell background with different colours. The background
#'     colours are chosen based on the column names, for example "paavist" or
#'     "tvilsom". In each column, all cells that are following the given
#'     rule, will get the same background colour.
#'
#' @details The columns will be styled with the colour in the palette that have
#'     the same name as the column. If the column name is not the same as the
#'     name of the colour in the palette, the vector of column names can be named
#'     with the corresponding colour name, see example.
#'
#' @param workbook [\code{work book object}]\cr
#'     The workbook object used to create the Excel workbook. Defaults to `workbook`.
#' @param sheet [\code{character(1)}]\cr
#'     The Excel sheet name. Defaults to `sheet`.
#' @param data [\code{data.frame}]\cr
#'     The data that have been exported to the Excel sheet. Used to
#'     find column number and number of rows in the workbook that should be styled.
#'     Can be \code{NULL} if both \code{colnames_in_data} and \code{nrows_in_data}
#'     are different from \code{NULL}. Defaults to \code{NULL}.
#' @param colnames_in_data [\code{character}]\cr
#'     The column names of the data frame that has been exported to Excel, i.e.
#'     \code{colnames(data)}. Can be \code{NULL} if \code{data} has a non-NULL
#'     argument. Values in \code{colnames_in_data} have preference for values in
#'     \code{data}. Defaults to \code{NULL}.
#' @param nrows_in_data  [\code{integer(1)}]\cr
#'     The number of rows of the data frame that has been exported to
#'     Excel, i.e. \code{nrow(data)}. Can be \code{NULL} if \code{data} has a non-NULL
#'     argument. Values in \code{nrows_in_data} have preference for values in
#'     \code{data}. Defaults to \code{NULL}.
#' @param rule [\code{integer(1)}]\cr
#'     Rule that should be sourced to
#'     \ifelse{html}{\code{\link[openxlsx:conditionalFormatting]{openxlsx::conditionalFormatting}}}{\code{openxlsx::conditionalFormatting}}.
#' @param colname [\code{character}]\cr
#'     Vector with colour names from the palette that should be used
#'     for styling the columns. If the column name is not the same as the colour
#'     name in the palette, the colour name should be named with the column name
#'     in the data frame.
#' @param palette [\code{character}]\cr
#'     Palette with named colours.
#'
#' @return None. One or more columns in the workbook object is styled.
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
#' # Make workbook object
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
#' style_background_per_column(workbook = workbook,
#'                              sheet = sheet,
#'                              data = iris,
#'                              rule = "> 3",
#'                              colname = c("bluegrey" = "Sepal.Length",
#'                                          "bluegrey" = "Sepal.Width",
#'                                          "green" = "Petal.Length"),
#'                              palette = c("bluegrey" = "#6fb2d3", "green" = "#579e65"))
#'
#' # Save the workbook
#' saveWorkbook(wb = workbook, file = paste0(td, "/iris.xlsx"), overwrite = TRUE)
#'
#' print(paste("You may examine the Excel workbook at", normalizePath(td, winslash = "/")))
#' }
#'
style_background_per_column <- function(workbook = workbook,
                                        sheet = sheet,
                                        data = NULL,
                                        colnames_in_data = NULL,
                                        nrows_in_data = NULL,
                                        rule,
                                        colname,
                                        palette) {

  # MANAGE INPUT ARGUMENTS BEFORE CHECKING ----
  # Gather colnames and nrows from data
  if (is.null(colnames_in_data)) {colnames_in_data <- colnames(data)}
  if (is.null(nrows_in_data)) {nrows_in_data <- nrow(data)}

  # make table with colour and columnname
  colname <- set_name_vector(colname)
  colours <- cbind(unname(colname), unname(palette[names(colname)]))
  colnames(colours) <- c("colname", "colour")

  # ARGUMENT CHECKING ----
  # Object to store check-results
  checks <- checkmate::makeAssertCollection()

  # Perform checks
  checkmate::assert_class(workbook, classes = "Workbook", add = checks)
  NVIcheckmate::assert_character(sheet, len = 1, min.chars = 1, max.chars = 31,
                                 comment = "Remark that sheet names can be at most 31 characters",
                                 add = checks)
  checkmate::assert_data_frame(data, null.ok = TRUE, add = checks)
  checkmate::assert_character(colnames_in_data, min.len = 1, null.ok = TRUE, add = checks)
  checkmate::assert_integerish(nrows_in_data, lower = 2, len = 1, null.ok = TRUE, add = checks)
  NVIcheckmate::assert_non_null(x = list(data, colnames_in_data), add = checks)
  NVIcheckmate::assert_non_null(x = list(data, nrows_in_data), add = checks)
  checkmate::assert_character(rule, len = 1, add = checks)
  checkmate::assert_character(colname, min.len = 1, add = checks)
  checkmate::assert_character(palette, min.len = 1, add = checks)
  NVIcheckmate::assert_character(x = intersect(names(colname), names(palette)), min.len = 1,
                                 comment = "At least one column must be associated with a colour in the palette",
                                 add = checks)

  # Report check-results
  checkmate::reportAssertions(checks)

  # RUNNING SCRIPT ----
  # Style each column with colname
  # i <- 1
  for (i in c(1:nrow(colours))) {
    openxlsx::conditionalFormatting(wb = workbook,
                                    sheet = sheet,
                                    cols = which(colnames_in_data == colours[i, "colname"]),
                                    rows = 2:(nrows_in_data + 1),
                                    rule = rule,
                                    style = openxlsx::createStyle(bgFill = colours[i, "colour"]),
                                    type = "expression")
  }

}
