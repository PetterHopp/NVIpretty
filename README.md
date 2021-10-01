NVIpretty: Tools to make R-output pretty in accord with NVI’s graphical profile
===============================================================================

<!-- README.md is generated from README.Rmd. Please edit that file -->

-   [Overview](#overview)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Copyright and license](#copyright-and-license)
-   [Contributing](#contributing)

Overview
========

`NVIpretty` provide tools to make R-output pretty in accord with
Norwegian Veterinary Institute’s (NVI) graphical profile. For products
that are not described in the graphical profile, the tools should help
standardizing the output and aid in increasing readability and use.

The package is under development. Currently the package comprises
functions that standardizes output to Excel and palettes with colour
codes for the NVI colours. [Contributions](#contributing) to enhance the
package is highly appreciated.

`NVIpretty` is part of `NVIverse`, a collection of R-packages with tools
to facilitate data management and data reporting at the Norwegian
Veterinary Institute (NVI).

#### Table 1. NVIverse packages

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 8%" />
<col style="width: 78%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Package</th>
<th style="text-align: left;">Status</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">NVIconfig</td>
<td style="text-align: left;">Private</td>
<td style="text-align: left;">Configuration information necessary for some NVIverse functions</td>
</tr>
<tr class="even">
<td style="text-align: left;">NVIdb</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate the use of NVI’s databases</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NVIpretty</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to make R-output pretty in accord with NVI’s graphical profile</td>
</tr>
<tr class="even">
<td style="text-align: left;">NVIbatch</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate the running of R-scripts in batch mode at NVI</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NVIcheckmate</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Extension of checkmate with argument checking adapted for NVIverse</td>
</tr>
<tr class="even">
<td style="text-align: left;">OKplan</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate the planning of surveillance programmes for the NFSA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">OKcheck</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate checking of data from national surveillance programmes</td>
</tr>
</tbody>
</table>

Installation
============

`NVIpretty` is available at
[GitHub](https://github.com/NorwegianVeterinaryInstitute). To install
`NVIpretty` you will need:

-   R version &gt; 4.0.0
-   R package `devtools`
-   Rtools 4.0

First install and attach the `devtools` package.

    install.packages("devtools")
    library(devtools)

To install (or update) the `NVIpretty` package, run the following code:

    remotes::install_github("NorwegianVeterinaryInstitute/NVIpretty")
        upgrade = FALSE,
        build = TRUE,
        build_manual = TRUE)

Usage
=====

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

Copyright and license
=====================

Copyright (c) 2021 Norwegian Veterinary Institute.  
Licensed under the BSD 3-Clause
[License](https://github.com/NorwegianVeterinaryInstitute/NVIpretty/blob/main/LICENSE).

Contributing
============

Contributions to develop `NVIpretty` is highly appreciated. There are
several ways you can contribute to this project: ask a question, propose
an idea, report a bug, improve the documentation, or contribute code.
The vignette “Contribute to NVIpretty” gives more information.

------------------------------------------------------------------------

Please note that the NVIpretty project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
