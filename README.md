# NVIpretty
================

  - [Overview](#overview)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Copyright and license](#copyright-and-license)
  - [Contributing](#contributing)

# Overview

Tools for making R-output pretty in accord with NVI graphical profile. For products that are not described in the graphical profile, the tools should help standardizing the output and aid in increasing readability and use.  

The package is under development. Currently the only function is add_formatted_worksheet() that standardizes output to Excel, see [Usage](#usage). [Contributions](#contributing) to enhance the package is highly appreciated.

# Installation

`NVIpretty` is publicly available at https://github.com/NorwegianVeterinaryInstitute. To install `NVIpretty` 
you will need:
  - R version > 4.0.2
  - R package `devtools`
  - Rtools 4.0

This requires first to install and attach the `devtools` package.  

``` r
install.packages("devtools")
library(devtools)
```

In order to install (or update) the `NVIpretty` package, run the following code:

``` r
remotes::install_github("NorwegianVeterinaryInstitute/NVIpretty", 
	upgrade = FALSE, 
	build = TRUE,
	build_manual = TRUE)
```

# Usage


``` r
# Attach packages and set up with temporary directory
library(NVIpretty)
library(openxlsx)
td <- tempdir()

# Generate Excel-sheet
workbook <- createWorkbook()

# Add a sheet to the workbook
add_formatted_worksheet(iris,
                        workbook,
                        sheet = "iris",
                        wrapHeadlineText = TRUE,
                        collabels = TRUE,
                        colwidths = FALSE,
                        standards = NULL)

#Save the workbook
saveWorkbook(wb = workbook,
             file = paste0(td, "/iris.xlsx"),
                          overwrite = TRUE)
```

# Copyright and license
Copyright 2021 Norwegian Veterinary Institute

Licensed under the BSD 3-Clause License (the "License"); 
you may use `NVIdb` in compliance with the [License](https://github.com/NorwegianVeterinaryInstitute/NVIdb/blob/main/LICENSE).

# Contributing

There are several ways you can contribute to the development of `NVIpretty`: reporting a bug, fixing documentation errors, contributing new code, or commenting on issues/pull requests. Contributions to extend the package use for NVI is highly appreciated. 


-----

Please note that this project is released with a [Contributor Code of  Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). 
By participating to this project, you agree to abide by its terms.
