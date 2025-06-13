# library(NVIpretty)
library(openxlsx)
library(testthat)

test_that("Style footnote in last row", {


# Create an Excel sheet with data and footnote
  # Create test data
  db <- as.data.frame(list("year" = c(2021:2025),
                           "number" = c(1:5)))
  db <- append_text_line(data = db, text = "This is a footnote giving a disclaimer", empty_rows = 2)
  # Create a workbook with a new worksheet.
  wb <- createWorkbook()
  addWorksheet(wb = wb, sheetName = "test")
  # Write data to the worksheet
  writeData(wb = wb, sheet = "test", x = db)

 style_text_line(workbook = wb,
                  sheet = "test",
                  data = db,
                  text = "This is a footnote giving a disclaimer",
                  text_decoration = "bold",
                  wrap_text = TRUE,
                  merge_cells = TRUE,
                  heights = 24)

  saveWorkbook(wb, file = file.path(tempdir(), "test.xlsx"), overwrite = TRUE)

  # Check format
  # Load your Excel file
  wbtest <- loadWorkbook(file.path(tempdir(), "test.xlsx"))

  # Get cell styles
  styles <- getStyles(wbtest)[[1]]

  expect_equal(styles$fontDecoration, "BOLD")
  expect_true(styles$wrapText)
})

test_that("Error testing of style_text_line", {

  linewidth <- options("width")
  options(width = 80)
  wb <- createWorkbook()
  db <- as.data.frame(list("year" = c(2021:2025),
                           "number" = c(1:5)))

  expect_error(style_text_line(workbook = "workbook",
                               sheet = "sheetname",
                               data = db,
                               text = "Sum",
                               text_decoration = "bold",
                               wrap_text = FALSE,
                               merge_cells = FALSE,
                               heights = NULL),
               regexp = "Variable 'workbook': Must inherit from class 'Workbook', but has",
               fixed = TRUE)

  expect_error(style_text_line(workbook = wb,
                               sheet = "sheetname_is_too_long_for_an_Excel_sheetname",
                               data = db,
                               text = "Sum",
                               text_decoration = "bold",
                               wrap_text = FALSE,
                               merge_cells = FALSE,
                               heights = NULL),
               regexp = "Remark that sheet names can be at most",
               fixed = TRUE)

  expect_error(style_text_line(workbook = wb,
                               sheet = "sheetname",
                               data = "db",
                               text = "Sum",
                               text_decoration = "bold",
                               wrap_text = FALSE,
                               merge_cells = FALSE,
                               heights = NULL),
               regexp = "Variable 'data': Must be of type 'data.frame', not 'character'",
               fixed = TRUE)

  expect_error(style_text_line(workbook = wb,
                               sheet = "sheetname",
                               data = db,
                               text = c("Sum", "Sum"),
                               text_decoration = "bold",
                               wrap_text = FALSE,
                               merge_cells = FALSE,
                               heights = NULL),
               regexp = "Variable 'text': Must have length 1",
               fixed = TRUE)

  expect_error(style_text_line(workbook = wb,
                               sheet = "sheetname",
                               data = db,
                               text = "Sum",
                               text_decoration = "verybold",
                               wrap_text = FALSE,
                               merge_cells = FALSE,
                               heights = NULL),
               regexp = "'bold','strikeout','italic','underline','underline2'",
               fixed = TRUE)

  expect_error(style_text_line(workbook = wb,
                               sheet = "sheetname",
                               data = db,
                               text = "Sum",
                               text_decoration = "bold",
                               wrap_text = "FALSE",
                               merge_cells = FALSE,
                               heights = NULL),
               regexp = "Variable 'wrap_text': Must be of type 'logical flag'",
               fixed = TRUE)

  expect_error(style_text_line(workbook = wb,
                               sheet = "sheetname",
                               data = db,
                               text = "Sum",
                               text_decoration = "bold",
                               wrap_text = FALSE,
                               merge_cells = "FALSE",
                               heights = NULL),
               regexp = "Variable 'merge_cells': Must be of type 'logical flag'",
               fixed = TRUE)

  expect_error(style_text_line(workbook = wb,
                               sheet = "sheetname",
                               data = db,
                               text = "Sum",
                               text_decoration = "bold",
                               wrap_text = FALSE,
                               merge_cells = FALSE,
                               heights = 1.5),
               regexp = "Variable 'heights': Must be of type 'integerish'",
               fixed = TRUE)

  options(width = unlist(linewidth))
})
