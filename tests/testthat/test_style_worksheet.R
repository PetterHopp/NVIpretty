# Attach packages and set up with temporary directory
library(NVIpretty)
# library(openxlsx)
library(testthat)


# Assigns temporary dir to td
td <- tempdir()

test_that("format worksheet", {

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


  style_background_per_column(workbook = workbook,
                              sheet = "iris",
                              data = iris,
                              rule = "> 4",
                              colname = c("PCR-positiv" = "Sepal.Width"),
                              palette = c("PCR-positiv" = "red", "Seropositiv" = "orange", "Tvilsom" = "yellow", "Negativ" = "green"))

  # Save the workbook
  openxlsx::saveWorkbook(wb = workbook,
               file = paste0(td, "/iris.xlsx"),
               overwrite = TRUE)

  expect_identical(colnames(openxlsx::read.xlsx(xlsxFile = paste0(td, "/iris.xlsx"), sheet = "iris", rows = 1, sep.names = " ")),
                   c("Sepal length", "Sepal width", "Petal length", "Petal width", "Species"))


  # saveRDS(workbook, file = "./tests/testthat/iris_wb.RSD")
  # paste0(td, "/iris.xlsx")
  # print(paste("One I may examine the Excel workbook at", normalizePath(td, winslash = "/")))
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
