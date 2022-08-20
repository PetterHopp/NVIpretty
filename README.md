# NVIpretty: Tools for making R-output pretty in accord with NVI’s graphical profile

<!-- README.md is generated from README.Rmd. Please edit that file -->

-   [Overview](#overview)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Copyright and license](#copyright-and-license)
-   [Contributing](#contributing)

# Overview

`NVIpretty`provides tools for styling output from R in accord with NVI’s
graphical profile. Included are colour palettes and a NVI-theme for
ggplot2 as well as tools to format and style output in Excel.

`NVIpretty` is part of `NVIverse`, a collection of R-packages with tools
to facilitate data management and data reporting at the Norwegian
Veterinary Institute (NVI). The `NVIverse` consists of the following
packages: `NVIconfig`, `NVIdb`, `NVIspatial`, `NVIpretty`, `NVIbatch`,
`OKplan`, `OKcheck`, `NVIcheckmate`, `NVIpackager`, `NVIrpackages`. See
[Contribute to
NVIpretty](https://github.com/NorwegianVeterinaryInstitute/NVIpretty/blob/main/CONTRIBUTING.md)
for more information.

`NVIpretty` provide tools to make R-output pretty in accord with
Norwegian Veterinary Institute’s (NVI) graphical profile. For products
that are not described in the graphical profile, the tools should help
standardizing the output and aid in increasing readability and use.

The package is under development. Currently the package comprises
functions that standardizes output to Excel and palettes with colour
codes for the NVI colours. [Contributions](#contributing) to enhance the
package is highly appreciated.

# Installation

`NVIpretty` is available at
[GitHub](https://github.com/NorwegianVeterinaryInstitute). To install
`NVIpretty` you will need:

-   R version > 4.0.0
-   R package `remotes`
-   Rtools 4.0 or Rtools 4.2 depending on R version

First install and attach the `remotes` package.

    install.packages("remotes")
    library(remotes)

To install (or update) the `NVIpretty` package, run the following code:

    remotes::install_github("NorwegianVeterinaryInstitute/NVIpretty",
        upgrade = FALSE,
        build = TRUE,
        build_vignettes = TRUE)

# Usage

The `NVIpretty` package needs to be attached.

    library(NVIpretty)

For information on using the colour palettes and the NVI\_theme in
ggplot2, please have look at the vignette ‘Create graphs for NVI’.

NVIpretty can also be used to style an Excel sheet as in the example
below.

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

The full list of all available functions and datasets can be accessed by
typing

    help(package = "NVIpretty")

Please check the NEWS for information on new features, bug fixes and
other changes.

# Copyright and license

Copyright (c) 2020 - 2022 Norwegian Veterinary Institute.  
Licensed under the BSD\_3\_clause License. See
[License](https://github.com/NorwegianVeterinaryInstitute/NVIpretty/blob/main/LICENSE)
for details.

# Contributing

Contributions to develop `NVIpretty` is highly appreciated. There are
several ways you can contribute to this project: ask a question, propose
an idea, report a bug, improve the documentation, or contribute code.
See [Contribute to
NVIpretty](https://github.com/NorwegianVeterinaryInstitute/NVIpretty/blob/main/CONTRIBUTING.md)
for more information.

## <!-- Code of conduct -->

Please note that the NVIpretty project is released with a [Contributor
Code of
Conduct](https://github.com/NorwegianVeterinaryInstitute/NVIpretty/blob/main/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
