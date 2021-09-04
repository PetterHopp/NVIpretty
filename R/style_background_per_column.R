#' @title Style cell background in Excel columns
#' @description Style the cell background with different colours. The colours are 
#'     given in the palette and the colours are named with the standard column names 
#'     like paavist, ikke_paavist. In each column, the cells that are following the 
#'     are styled. 
#'     
#' @details The colours in the palette should be named with the standard column 
#'     names corresponding to the different colours. The colname should give the 
#'     with the standard column names. If the names of the columns in the input
#'     data frame are not the standard column names, the colname should be named.
#'
#' @param workbook The workbook object
#' @param sheet The Excel sheet name
#' @param data The data frame that have been exported to the Excel sheet. Used to 
#'     find column number and number of rows in the workbook that should be styled.
#'     Can be \code{NULL} if both \code{colnames_in_data} and \code{nrows_in_data}
#'     are different from \code{NULL}.
#' @param colnames_in_data The column names of the data frame that has been exported to 
#'     Excel, i.e. \code{colnames(data)}. Can be \code{NULL} if \code{data} has a non-NULL 
#'     argument. Values in \code{colnames_in_data} have preference for values in \code{data}.
#' @param nrows_in_data The number of rows of the data frame that has been exported to 
#'     Excel, i.e. \code{nrow(data)}. Can be \code{NULL} if \code{data} has a non-NULL 
#'     argument. Values in \code{nrows_in_data} have preference for values in \code{data}.
#' @param rule Rule that should be sourced to \code{openxlsx::conditionalFormatting}. 
#'     Defaults to "!= 0".
#' @param colname Vector with colour names from the palette that should be used 
#'     for styling the columns. If the column name is not the same as the colour 
#'     name in the palette, the colour name should be named with the column name 
#'     in the data frame.
#' @param palette Palette with named colours.
#'
#' @return None. One or more columns in the workbook object is styled
#'
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @export

style_background_per_column <- function(workbook = workbook, 
                                        sheet = sheet,
                                        data = NULL,
                                        colnames_in_data = NULL,
                                        nrows_in_data = NULL,
                                        rule,
                                        colname,
                                        palette) {
  
  # Gather colnames and nrows from data
  if (is.null(colnames_in_data)) {colnames_in_data <- colnames(data)}
  if (is.null(nrows_in_data)) {nrows_in_data <- nrow(data)}
  
  # make table with colour and columnname
  colname <- set_name_vector(colname)
  colours <- cbind(names(colname), unname(palette[colname]))
  colnames(colours) <- c("colname", "colour") 
  
  # Style each column with colname
  # i <- 1
  for (i in 1:nrow(colours)) {
    openxlsx::conditionalFormatting(wb = workbook, 
                                    sheet = sheet,
                                    cols = which(colnames_in_data == colours[i, "colname"]),
                                    rows = 2:(nrows_in_data + 1),
                                    rule = rule,
                                    style = openxlsx::createStyle(bgFill = colours[i, "colour"]),
                                    type = "expression")
  } 
  
}

