library(NVIpretty)
library(testthat)

test_that("Append text in last row", {


# Make example data
x <- as.data.frame(cbind("År" = 2021, "Rapport" = "Brucellose hos geit, utvalgsliste",
                         "MT regionnr" = "M21000", "MT region" = "Region Stor-Oslo", "MT avdelingsnr" = "M21150", "MT avdeling" = "Romerike",
                         "Produsentnr" = "30303030", "Foretak" = "XXX XXXXX", "Postnr" = "0468", "Poststed" = "OSLO", "Antall prøver" = 26))

# Include row with generated text
y <- append_text_line(data = x, text = paste("Datauttrekket er gjort", format(Sys.Date(), "%d/%m/%Y")), empty_rows = 0)

expect_equal(dim(y)[1], dim(x)[1] + 1)
expect_identical(y[dim(y)[1], 1], paste("Datauttrekket er gjort", format(Sys.Date(), "%d/%m/%Y")))


y <- append_text_line(x, text = paste("Datauttrekket er gjort", format(Sys.Date(), "%d/%m/%Y")), empty_rows = 2)

expect_equal(dim(y)[1], dim(x)[1] + 3)
expect_identical(y[dim(y)[1], 1], paste("Datauttrekket er gjort", format(Sys.Date(), "%d/%m/%Y")))


})

test_that("Error testing of append_text_line", {

  linewidth <- options("width")
  options(width = 80)

  expect_error(append_text_line(data = "vector", text = "text", empty_rows = 0),
               regexp = "Variable 'data': Must be of type 'data.frame', not 'character'",
               fixed = TRUE)

  expect_error(append_text_line(data = mtcars, text = NULL, empty_rows = 0),
               regexp = "Variable 'text': Must be of type 'character', not 'NULL'",
               fixed = TRUE)

  expect_error(append_text_line(data = mtcars, text = "text", empty_rows = -1),
               regexp = "Variable 'empty_rows': Element 1 is not >= 0.",
               fixed = TRUE)


  options(width = unlist(linewidth))
})
