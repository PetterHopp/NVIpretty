# Generate help for palettes in accord with NVI's profile
#
#' @md
#' @title Palette with NVI's profile colours for 2024 - today's date
#'
#' @description A vector with the hex values for NVI's profile colours.
#'
#' @details The colour codes are based on the hex values in the official colour profile.
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @format A vector with named colours:
#' \describe{
#'   \item{Jord}{The green colour that signifies NVI's core area "Terestrial animals".}
#'   \item{Luft}{A light blue colour".}
#'   \item{Vann}{The blue colour that signifies NVI's core area "Aquatic animals".}
#'   \item{Hvit}{Whitish. It is used in headings with a coloured or black background.}
#'   \item{Svart}{Blackish for use in body text in reports etc. It can also be used in headings.}
#'   \item{Lys jord}{Used in graphs.}
#'   \item{Mørk luft}{Used in graphs.}
#'   \item{Lyst vann}{Used in graphs.}
#'   \item{Mat}{The red colour that signifies NVI's core area "Food and feed safety".}
#'   \item{Lys mat}{Used in graphs.}
#' }
#'
#' @source Grafisk profil for Veterinærinstituttet versjon 2024 (available on
#' NVI intranet).
"palette_NVI_profile"
#'
#' @title Old palette with colours for graphs for 2020-2024
#'
#' @description A vector with the hex values for colours to be used in graphs.
#'
#' @details The colour codes are based on the hex values in the Graphical profile
#'     handbook except for the body text where the cmyk value is used. There is
#'     not agreement between the hex and cmyk values, but hex seem to give the
#'     most correct colour.
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes_2020.R".
#'
#' @format A vector with named colours:
#' \describe{
#'   \item{colours}{13 different colours}
#' }
#'
#' @source Grafisk profil for Veterinærinstituttet versjon 2020.
#'
"palette_graph_2020"
