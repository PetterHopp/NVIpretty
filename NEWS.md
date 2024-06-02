# NVIpretty 0.4.0.9001 - (2024-##-##)

## New features:

-


## Bug fixes:

-


## Other changes:

- Updated README including installation guide.


## BREAKING CHANGES:

-


# NVIpretty 0.4.0 - (2022-12-02)

## New features:

- Created `append_text_line` for appending a line with explanatory text to a data frame before writing it to Excel.

- Created `style_text_line` to style a line in an Excel sheet based on text content in one cell.


## Other changes:

- Updated documentation (help, README and CONTRIBUTING).

- Improved argument checking of functions formatting Excel workbooks.


# NVIpretty 0.3.2 - (2021-11-05)

## Bug fixes:

- `theme_NVI` colour for axis text is corrected to grey65.


# NVIpretty 0.3.1 - (2021-11-01)

## Bug fixes:

- `theme_NVI` has got a thinner horizontal line.


## Other changes:

- Vignette: "Create graphs for NVI".


# NVIpretty 0.3.0 - (2021-10-12)

## New features:

- `theme_NVI` for use with `ggplot2` is included. The theme is in accord with NVI's graphical profile.


# NVIpretty 0.2.2- (2021-10-01)

## Other changes:

- Corrected installation instruction in README.


# NVIpretty 0.2.1- (2021-09-28)

## Bug fixes:

- Solved problems with installation.


# NVIpretty 0.2.0- (2021-09-25)

## New features:

- `add_formatted_worksheet` includes the argument `FUN`.

- style_background_per_column styles cell background in Excel sheet based on column name. The rule decide which columns to style.

- added palettes with colours in accord with the graphical profile, i.e. palette_NVI_profile, palette_table_blue, palette_table_grey and palette_graph.


## Other changes:

- Vignette: "Contribute to NVIpretty".


# NVIpretty 0.1.6 - (2021-05-11)

## Bug fixes:

- fixed error if `colwidths` = `FALSE`.

## Other changes:
- Standard column width changed to 10.71


# NVIpretty 0.1.5 - (2021-04-08)

## Bug fixes:

- corrected difficulties installing NVIpretty due to missing information on imported package NVIdb.

## Other changes:
- Corrected copyright holder to Norwegian Veterinary Institute.


# NVIpretty 0.1.4 - (2021-03-10)

## Bug fixes:

- `add_formatted_worksheet`: if `colwidths` = `TRUE` and no `colwidths` were defined in column_standard table, the column widths is set to 10.78. The column width is also set to 10.78 if `colwidths` = `FALSE`.


# NVIpretty 0.1.3 - (2021-01-21)

## New features:

- `add_formatted_worksheet`: the parameter `colwidths` accepts the parameter "auto" for automatic sizing of column width.


# NVIpretty 0.1.2 - (2021-01-19)

## Bug fixes:

- In `add_formatted_worksheet` the parameters `collabels` and `colwidths` now accepts the parameter `FALSE`.


# NVIpretty 0.1.1 - (2021-01-01)

## Bug fixes:

- corrected column width and `dbsource` in `add_formatted_worksheet`.


# NVIpretty 0.1.0 - (2020-12-21)

## First release:

- `add_formatted_worksheet` is a wrapper around `openxslx::addWorksheet` that adds a worksheet header with bold text, changes column names to standard labels and includes standard column widths according to colnames. Standardization is based on `NVIdb::standardize_columns`.
