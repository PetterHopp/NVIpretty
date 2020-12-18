



add_worksheet_with_header <- function (data, workbook, sheet, wrapHeadlineText = FALSE,
                                       standards = NULL,
                                       collabels = TRUE,
                                       colwidths = TRUE) {
  # Identify name of input data frame
  dbsource <- deparse(substitute(data))

  # Change colnames o labels
  colnames(data) <- standardize_columns(data = data, dbsource = dbsource, property = "collabels")

  # Include a new worksheet. The workbook must have been created previously
  addWorksheet(wb = workbook, sheetName = sheet)

  # Wrte data to the worsheet
  writeData(wb = workbook, sheet = sheet, data, withFilter = TRUE)

  # Formatting the headline
  # Frozen headline
  freezePane(wb = workbook, sheet = sheet, firstRow = TRUE)
  # Headline in bold, wrapline in accord with function input
  styleBold <- createStyle(textDecoration = "bold", wrapText = wrapHeadlineText)
  addStyle(wb = workbook, sheet = sheet, style = styleBold, rows = 1, cols = 1:dim(data)[2] )
  # Set column widths
  colclasses <- standardize_columns(data = data,
                                  dbsource = dbsource,
                                  property = "colwidths")
  setColWidths(workbook, sheet, cols = c(1:dim(MTsak)[1]), widths = colwidths)
}





