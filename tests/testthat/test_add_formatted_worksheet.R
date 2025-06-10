# Attach packages and set up with temporary directory
# library(NVIpretty)
library(NVIdb)
library(openxlsx)
library(testthat)


# Assigns temporary dir to td
td <- tempdir()

test_that("formatting headline through add_formated_worksheet", {

  # Generate Excel-sheet
  workbook <- openxlsx::createWorkbook()

  # Add a sheet to the workbook
  add_formatted_worksheet(iris,
                          workbook,
                          sheet = "iris",
                          wrapHeadlineText = FALSE,
                          collabels = FALSE,
                          colwidths = FALSE,
                          standards = NULL)


  # Save the workbook
  openxlsx::saveWorkbook(wb = workbook,
                         file = paste0(td, "/iris.xlsx"),
                         overwrite = TRUE)

  expect_identical(colnames(openxlsx::read.xlsx(xlsxFile = paste0(td, "/iris.xlsx"), sheet = "iris", rows = 1, sep.names = " ")),
                   c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species"))

  excel_styles <- openxlsx::getStyles(workbook)
  expect_null(excel_styles[[1]]$wrapText)


  # Generate Excel-sheet
  workbook <- openxlsx::createWorkbook()

  # Add a sheet to the workbook
  add_formatted_worksheet(iris,
                          workbook,
                          sheet = "iris",
                          wrapHeadlineText = TRUE,
                          collabels = TRUE,
                          colwidths = FALSE,
                          standards = NULL)


  # Save the workbook
  openxlsx::saveWorkbook(wb = workbook,
                         file = paste0(td, "/iris.xlsx"),
                         overwrite = TRUE)

  expect_identical(colnames(openxlsx::read.xlsx(xlsxFile = paste0(td, "/iris.xlsx"), sheet = "iris", rows = 1, sep.names = " ")),
                   c("Sepal length", "Sepal width", "Petal length", "Petal width", "Species"))

  excel_styles <- openxlsx::getStyles(workbook)
  expect_true(excel_styles[[1]]$wrapText)
})

# test_that("formatting headline colwidth through add_formated_worksheet", {
#   # skip if no connection to 'FAG' have been established
#   skip_if_not(dir.exists(set_dir_NVI("FAG")))
#
#   # Generate Excel-sheet
#   workbook <- openxlsx::createWorkbook()
#
#   # Add a sheet to the workbook
#   add_formatted_worksheet(iris,
#                           workbook,
#                           sheet = "iris",
#                           wrapHeadlineText = FALSE,
#                           collabels = FALSE,
#                           colwidths = TRUE,
#                           standards = NULL)
#
#
#   # Save the workbook
#   openxlsx::saveWorkbook(wb = workbook,
#                          file = paste0(td, "/iris.xlsx"),
#                          overwrite = TRUE)
#
# })


test_that("formatting headline through add_formated_worksheet", {

  # Generate Excel-sheet and add a sheet to the workbook
  test <- as.data.frame(list("x" = c("test", "test\037", "test\036", "test\u001F\u001E",
                                     "\037test", "test\037\037", "test\036\037\037", "te\036st\036",
                                     "\u001Ftest\u001E", "te\u001Est", "t\u001Eest",
                                     "te\u001Est", "t\u001Eest", "test\u001F\u001E\u001F")))
  workbook <- openxlsx::createWorkbook()
  add_formatted_worksheet(test,
                          workbook,
                          sheet = "test",
                          wrapHeadlineText = TRUE,
                          collabels = TRUE,
                          colwidths = "auto",
                          standards = NULL)


  expect_equal(unname(unlist(as.vector(unique(openxlsx::read.xlsx(xlsxFile = workbook, sheet = "test"))))),
               "test")

})

test_that("Error testing of add_formatted_worksheet", {

  linewidth <- options("width")
  options(width = 80)

  workbook <- openxlsx::createWorkbook()
  expect_error(add_formatted_worksheet(iris,
                                       workbook,
                                       sheet = "test_more_than_31_characters_long",
                                       wrapHeadlineText = TRUE,
                                       collabels = TRUE,
                                       colwidths = "auto",
                                       standards = NULL),
               regexp = "element 1 has 33 characters. Remark that",
               fixed = TRUE)

  expect_error(add_formatted_worksheet(iris,
                                       workbook,
                                       sheet = "iris",
                                       wrapHeadlineText = NA,
                                       collabels = TRUE,
                                       colwidths = "auto",
                                       standards = NULL),
               regexp = "missing value where TRUE/FALSE needed",
               fixed = TRUE)

  expect_error(add_formatted_worksheet(iris,
                                       workbook,
                                       sheet = "iris",
                                       wrapHeadlineText = "TRUE",
                                       collabels = TRUE,
                                       colwidths = "auto",
                                       standards = NULL),
               regexp = "Must be of type 'logical', not",
               fixed = TRUE)

  expect_error(add_formatted_worksheet(iris,
                                       workbook,
                                       sheet = "iris",
                                       wrapHeadlineText = TRUE,
                                       collabels = "TRUE",
                                       colwidths = "auto",
                                       standards = NULL),
               regexp = "Must be of type 'logical', not",
               fixed = TRUE)

  expect_error(add_formatted_worksheet(iris,
                                       workbook,
                                       sheet = "iris",
                                       wrapHeadlineText = TRUE,
                                       collabels = TRUE,
                                       colwidths = "width",
                                       standards = NULL),
               regexp = "of set {'auto'}, * but is 'width'",
               fixed = TRUE)


  options(width = unlist(linewidth))
})
