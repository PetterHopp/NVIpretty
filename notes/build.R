# TEST, DOCUMENT AND BUILD NVIdb PACKAGE

# Set up environment
Rlibrary <- R.home()

library(devtools)
library(roxygen2)
library(withr)

# Creates new help files
# Should be run before git push when documentation for functions have been changed
devtools::document()

# Run tests included in ./tests. NVIpretty use thestthat
# devtools::test()

# Build the vignette
# devtools::build_vignettes()
# vignetteRDS <- readRDS("./Meta/vignette.rds")

# devtools::build_manual()

# Build the package
# system("R CMD build ../NVIpretty")
# devtools::build(binary = TRUE)
devtools::build(binary = FALSE, manual = TRUE, vignettes = TRUE)

version <- packageVersion("NVIpretty", lib.loc = paste0(getwd(),"/.."))
# devtools::check_built(path = paste0("../NVIpretty_", version, ".tar.gz"), manual = TRUE)
devtools::check_built(path = paste0("../NVIpretty_", version, ".tar.gz"), args = c("--no-tests"), manual = TRUE)


# Extensive checking of package. Is done after build. Creates PDF-manual
# system("R CMD check --ignore-vignettes ../NVIpretty")

# Alternative for creating the PDF-manual. The manual is not put in the correct directory
# system(paste(shQuote(file.path(R.home("bin"), "R")),
#              "CMD",
#              "Rd2pdf",
#              shQuote(paste0(Rlibrary,"/library/NVIdb"))))



# Innstall rebuilt package
detach("package:NVIpretty", unload=TRUE)

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

remotes::install_github("NorwegianVeterinaryInstitute/NVIpretty",
                        upgrade = FALSE,
                        build = TRUE,
                        build_manual = TRUE)


help(package="NVIpretty")
library(NVIpretty)

