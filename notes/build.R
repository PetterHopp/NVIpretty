# TEST, DOCUMENT AND BUILD NVIdb PACKAGE

# Set up environment
Rlibrary <- R.home()

library(devtools)
library(roxygen2)
library(withr)

# Creates new help files
# Should be run before git push when documentation for functions have been changed
devtools::document()

# Run tests included in ./tests. NVIdb use thestthat
devtools::test()

# Build the vignette
devtools::build_vignettes()
# vignetteRDS <- readRDS("./Meta/vignette.rds")

# devtools::build_manual()

# Build the package
# system("R CMD build ../NVIdb")
devtools::build(binary = TRUE)
# devtools::build(binary = TRUE, manual = TRUE, vignettes = TRUE)

# Extensive checking of package. Is done after build. Creates PDF-manual
system("R CMD check --ignore-vignettes ../NVIdb")

# Alternative for creating the PDF-manual. The manual is not put in the correct directory
# system(paste(shQuote(file.path(R.home("bin"), "R")),
#              "CMD",
#              "Rd2pdf",
#              shQuote(paste0(Rlibrary,"/library/NVIdb"))))



# Innstall rebuilt package
detach("package:NVIdb", unload=TRUE)

with_libpaths(paste0(Rlibrary,"/library"),
              install(sub("notes", "", dirname(rstudioapi::getSourceEditorContext()$path)),
                      dependencies = TRUE,
                      upgrade=FALSE,
                      build_vignettes = TRUE)
)

# # Install from binary file
# remove.packages("NVIdb")
# # install.packages("C:/Users/13hopp/Documents/GitProjects/NVIdb_0.1.5.9000.zip",
# install.packages("C:/Users/13hopp/OneDrive - Veterinærinstituttet/R/NVIdb_0.2.2.9002.zip",
#                  repos = NULL,
#                  type = "binary")


help(package="NVIdb")
library(NVIdb)

