library(openxlsx)
formatExcelsheet <- function (data, workbook, sheet, wrapHeadlineText = FALSE) {
  addWorksheet(wb = workbook, sheetName = sheet)
  writeData(wb = workbook, sheet = sheet, data, withFilter = TRUE)
  freezePane(wb = workbook, sheet = sheet, firstRow = TRUE)
  styleBold <- createStyle(textDecoration = "bold", wrapText = wrapHeadlineText)
  addStyle(wb = workbook, sheet = sheet, style = styleBold, rows = 1, cols = 1:dim(data)[2] )
}

# colnames(MTsak) <- snakecase::to_any_case(colnames(MTsak), case="sentence", abbreviations = c("ID"))
# colnames(MTsakprove) <- snakecase::to_any_case(colnames(MTsakprove), case="sentence", abbreviations = c("ID"))
#
# # MTExcelReport <- NULL
# MTExcelReport <- createWorkbook()
#
# formatExcelsheet(MTsak, MTExcelReport, "Saker", wrapHeadlineText = TRUE)
# # addWorksheet(wb = MTExcelReport, sheetName = "Saker")
# # writeData(wb = MTExcelReport, sheet = "Saker", MTsak, withFilter = TRUE)
#
# setColWidths(MTExcelReport, "Saker", cols = c(1:dim(MTsak)[1]), widths = c(12,6,14,8,8,8,10,12,6,10,11,25,6,6,15,10,10,10,10,10,10,10))

