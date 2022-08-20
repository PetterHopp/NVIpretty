# Generate help for palettes in accord with NVI's profile
#
#' @md
#' @title Palette with NVI's profile colours
#'
#' @description A vector with the hex values for NVI's profile colours.
#'
#' @details The colour codes are based on the hex values except for the body text
#'     where the cmyk value is used. There is not agreement between the hex and
#'     cmyk values, but hex seem to give the most correct colour.
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @format A vector with named colours:
#' \describe{
#'   \item{blue}{The blue colour that signifies NVI's core area "Aquatic animals".}
#'   \item{green}{The green colour that signifies NVI's core area "Terestrial animals".}
#'   \item{red}{The red colour that signifies NVI's core area "Food and feed safety".}
#'   \item{bodytext}{Black 80% for use in body text in reports etc. It can also be used in headings.}
#'   \item{headingblue}{Blue alternative for use in headings.}
#'   \item{background}{Background colour for large areas as on stands.}
#' }
#'
#' @source Grafisk profil for Veterinærinstituttet versjon 2020.
#'
"palette_NVI_profile"
#'
#'
#' @md
#' @title Palette with colours for table with blue background
#'
#' @description A vector with the hex values for a table with blue background.
#'
#' @details The colour codes are based on the hex values in the Graphical profile handbook except for the body text where the cmyk value is used.
#'     There is not agreement between the hex and cmyk values, but hex seem to give the most correct colour.
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @format A vector with named colours:
#' \describe{
#'   \item{blue1}{Background colour for heading.}
#'   \item{blue2}{Background colour for sub-heading.}
#'   \item{blue3}{Background colour for sub-heading.}
#'   \item{blue4}{Background colour for table text.}
#'   \item{blue5}{Preferred background colour for table text.}
#'   \item{bodytext}{Black 70% font colour for use in body text.}
#'   \item{heading}{White font colour for headings.}
#' }
#'
#' @source Grafisk profil for Veterinærinstituttet versjon 2020.
#'
"palette_table_blue"
#'
#'
#' @md
#' @title Palette with colours for table with grey background
#'
#' @description A vector with the hex values for a table with grey background.
#'
#' @details The colour codes are based on the cmyk values in the Graphical profile handbook.
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @format A vector with named colours:
#' \describe{
#'   \item{black1}{Background colour for heading.}
#'   \item{black2}{Background colour for sub-heading.}
#'   \item{black3}{Background colour for sub-heading.}
#'   \item{black4}{Background colour for table text.}
#'   \item{black5}{Preferred background colour for table text.}
#'   \item{bodytext}{Black 85% font colour for use in body text.}
#'   \item{heading}{White font colour for headings.}
#' }
#'
#' @source Grafisk profil for Veterinærinstituttet versjon 2020.
#'
"palette_table_grey"
#'
#'
#' @title Palette with colours for graphs
#'
#' @description A vector with the hex values for colours to be used in graphs.
#'
#' @details The colour codes are based on the hex values in the Graphical profile
#'     handbook except for the body text where the cmyk value is used. There is
#'     not agreement between the hex and cmyk values, but hex seem to give the
#'     most correct colour.
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @format A vector with named colours:
#' \describe{
#'   \item{colours}{13 different colours}
#' }
#'
#' @source Grafisk profil for Veterinærinstituttet versjon 2020.
#'
"palette_graph"
