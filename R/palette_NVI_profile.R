# Generate help for palettes in accord with NVI's profile
#
#' @md
#' @title Palette with NVI's profile colours for 2025 - today's date
#' @description A vector with the hex values for NVI's profile colours.
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
#' @source Grafisk profil for Veterinærinstituttet version 2024 (available on
#' NVI's intranet).
"palette_NVI"
#'
#' @title Palette with colours for graphs for 2025 - today's date
#' @description A vector with the hex values for colours to be used in graphs. The
#'     order of the colours are as they should be used in the graphs.
#' @details The colour codes are based on the hex values in the Graphical profile
#'     handbook (available at NVI's intranet).
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @format A vector with 15 named colours:
#' \describe{
#'   \item{Jord}{#59CD8B}
#'   \item{Luft}{#D7F4FF}
#'   \item{Vann}{#1C4FB9}
#'   \item{Svart}{#091A3E}
#'   \item{Lys jord}{#BCEED1}
#'   \item{Mørk luft}{#95D9F3}
#'   \item{Lyst vann}{#C7D9FF}
#'   \item{Mat}{#FF5447}
#'   \item{Lys mat}{#FFDAD4}
#'   \item{Gul}{#F5D34A}
#'   \item{Lys gul}{#FBECB2}
#'   \item{Lilla}{#9A55D2}
#'   \item{Lys lilla}{#DEC2F5}
#'   \item{Orange}{#FCA446}
#'   \item{Lys orange}{#F9D3A9}
#' }
#'
#' @source Grafisk profil for Veterinærinstituttet version 2024 (available on
#' NVI's intranet).
#'
"palette_graph"
#' 
#' @title Palettes with colour gradients for NVI for 2025 - today's date
#' @description Colour gradients with six levels for six different base colours.
#'     The colours in the NVI profile are used as base colours and the gradients
#'     are developed from these. 
#' @details The colour gradients are intended for choropleth maps, graphs and 
#'     other figures where different gradients of one colour is wanted.
#'     
#' There are six different gradients, each with six colours. Each palette is 
#'     given a name of the form "palette_gradient_xxxxxx" where xxxxxx is the 
#'     name of the base colour. To make it easier to remember the gradient name,
#'     each gradient is represented by several palettes, for example the green 
#'     gradient based on the NVI colour "Jord" is represented by the palettes:
#'     palette_gradient_jord, palette_gradient_earth, and palette_gradient_green. 
#'
#' @format A vector with named colours:
#' \describe{
#'   \item{palette_gradient_green}{Green colour gradient based on the NVI colour "Jord".}
#'   \item{palette_gradient_jord}{Alternative name for the green colour gradient based on the NVI colour "Jord".}
#'   \item{palette_gradient_earth}{Alternative name for the green colour gradient based on the NVI colour "Jord".}
#'   \item{palette_gradient_darkblue}{Blue colour gradient based on the NVI colour "Vann".}
#'   \item{palette_gradient_vann}{Alternative name for the blue colour gradient based on the NVI colour "Vann".}
#'   \item{palette_gradient_water}{Alternative name for the blue colour gradient based on the NVI colour "Vann".}
#'   \item{palette_gradient_lightblue}{Blue colour gradient based on the NVI colour "Luft".}
#'   \item{palette_gradient_luft}{Alternative name for the blue colour gradient based on the NVI colour "Luft".}
#'   \item{palette_gradient_air}{Alternative name for the blue colour gradient based on the NVI colour "Luft".}
#'   \item{palette_gradient_red}{Red colour gradient based on the NVI colour "Mat".}
#'   \item{palette_gradient_mat}{Alternative name for the red colour gradient based on the NVI colour "Mat".}
#'   \item{palette_gradient_food}{Alternative name for the red colour gradient based on the NVI colour "Mat".}
#'   \item{palette_gradient_yellow}{Yellow colour gradient based on the NVI colour "Gul".}
#'   \item{palette_gradient_gul}{Alternative name for the yellow colour gradient based on the NVI colour "Gul".}
#'   \item{palette_gradient_grey}{Grey colour gradient based on the NVI colour "Svart".}
#'   \item{palette_gradient_graa}{Alternative name for the grey colour gradient based on the NVI colour "Svart".}
#' }
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @source Grafisk profil for Veterinærinstituttet version 2024 (available on
#' NVI's intranet).
"palette_gradient"
