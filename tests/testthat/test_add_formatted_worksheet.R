# Attach packages and set up with temporary directory
library(NVIpretty)
# library(openxlsx)
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
  expect_false(excel_styles[[1]]$wrapText)
  
  
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
  
  
  
  # # Add a sheet to the workbook
  # # Generate Excel-sheet
  # data <- as.data.frame(list("x" = c("test", "test\037", "test\036")))
  # workbook <- openxlsx::createWorkbook()
  # add_formatted_worksheet(iris,
  #                         workbook,
  #                         sheet = "iris",
  #                         wrapHeadlineText = TRUE,
  #                         collabels = TRUE,
  #                         colwidths = "auto",
  #                         standards = NULL)
  
})












test_that("include function in add_formatted_worksheet", {
  
  # Generate Excel-sheet
  workbook <- openxlsx::createWorkbook()
  
  # Add a sheet to the workbook
  add_formatted_worksheet(data = iris,
                          workbook = workbook,
                          sheet = "iris",
                          wrapHeadlineText = TRUE,
                          collabels = TRUE,
                          colwidths = FALSE,
                          standards = NULL,
                          FUN = style_background_per_column,
                          rule = "> 4",
                          colname = c("PCR-positiv" = "Sepal.Width"),
                          palette = c("PCR-positiv" = "red", "Seropositiv" = "orange", "Tvilsom" = "yellow", "Negativ" = "green"))
  
  
  
  # Save the workbook
  openxlsx::saveWorkbook(wb = workbook,
                         file = paste0(td, "/iris.xlsx"),
                         overwrite = TRUE)
  
  expect_identical(colnames(openxlsx::read.xlsx(xlsxFile = paste0(td, "/iris.xlsx"), sheet = "iris", rows = 1, sep.names = " ")),
                   c("Sepal length", "Sepal width", "Petal length", "Petal width", "Species"))
  
  
  # print(paste("One I may examine the Excel workbook at", normalizePath(td, winslash = "/")))
})
