library(NVIpretty)
library(testthat)

test_that("utils: set_name_vector", {


# Make example data
x <- c("År", "MT regionnr", "MT region", "MT avdelingsnr", "MT avdeling")

y <- NVIpretty:::set_name_vector(x)
expect_equal(unname(y), names(y))


x <- c("Aar" = "År", "MT_regionnr" = "MT regionnr", "MT region", "MT avdelingsnr", "MT avdeling")
y <- NVIpretty:::set_name_vector(x)
expect_equal(names(y),
             c("Aar", "MT_regionnr", "MT region", "MT avdelingsnr", "MT avdeling") )

x <- c("Aar" = "År", "MT_regionnr" = "MT regionnr", "MT region" = "MT region",
       "MT avdelingsnr" = "MT avdelingsnr", "MT avdeling" = "MT avdeling")
y <- NVIpretty:::set_name_vector(x)
expect_equal(names(y),
             c("Aar", "MT_regionnr", "MT region", "MT avdelingsnr", "MT avdeling"))

})

