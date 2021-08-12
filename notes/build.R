# DOCUMENT, TEST AND BUILD THE PACKAGE

# Set up environment
# rm(list = ls())    # Benyttes for å tømme R-environment ved behov

pkg <- "NVIpretty"

Rlibrary <- R.home()

library(devtools)
library(roxygen2)

# Creates new help files
# Should be run before git push when documentation for functions have been changed
devtools::document()

# For updating README.md when the Rmd-file has been updated.
rmarkdown::render(input = paste0("./README.Rmd"),
                  # output_format = "md_document",
                  output_file = "README.md",
                  output_dir = "./")

# For updating CONTRIBUTE.md when the vignette has been updated.
rmarkdown::render(input = paste0("./vignettes/Contribute_to_", pkg, ".Rmd"),
                  output_format = "md_document",
                  output_file = "CONTRIBUTING.md",
                  output_dir = "./")
header <- paste0("# Contribute to ", pkg, "\n",
                 "<!-- CONTRIBUTING.md is generated from ./vignettes/Contribute_to_", pkg, ".Rmd. Please edit that file -->", "\n")
writeLines(c(header,readLines("./CONTRIBUTING.md")),"./CONTRIBUTING.md")

# Run tests included in ./tests.
devtools::test()

# Build the vignette
# devtools::build_vignettes()
# vignetteRDS <- readRDS("./Meta/vignette.rds")

# devtools::build_manual()

# Build the package
# system("R CMD build ../NVIpretty")
# devtools::build(binary = TRUE)
devtools::build(binary = FALSE, manual = TRUE, vignettes = TRUE)

version <- packageVersion(pkg, lib.loc = paste0(getwd(),"/.."))
devtools::check_built(path = paste0("../", pkg, "_", version, ".tar.gz"), args = c("--no-tests"), manual = TRUE)

# Extensive checking of package. Is done after build. Creates PDF-manual
# system("R CMD check --ignore-vignettes ../NVIpretty")
# Alternative for creating the PDF-manual. The manual is not put in the correct directory
# system(paste(shQuote(file.path(R.home("bin"), "R")),
#              "CMD",
#              "Rd2pdf",
#              paste0("../", pkg)))
# file.copy(from = paste0(pkg, ".pdf"), to = "./vignettes/.install_extras", overwrite = TRUE)


