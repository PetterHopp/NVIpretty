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
#'   \item{#59CD8B: Jord}{The green colour that signifies NVI's core area "Terestrial animals".}
#'   \item{#D7F4FF: Luft}{A light blue colour".}
#'   \item{#1C4FB9: Vann}{The blue colour that signifies NVI's core area "Aquatic animals".}
#'   \item{#F7FDFF: Hvit}{Whitish. It is used in headings with a coloured or black background.}
#'   \item{#091A3E: Svart}{Blackish for use in body text in reports etc. It can also be used in headings.}
#'   \item{#BCEED1: Lys jord}{Used in graphs.}
#'   \item{#95D9F3: M&#U00F8rk luft}{Used in graphs.}
#'   \item{#C7D9FF: Lyst vann}{Used in graphs.}
#'   \item{#FF5447: Mat}{The red colour that signifies NVI's core area "Food and feed safety".}
#'   \item{#FFDAD4: Lys mat}{Used in graphs.}
#' }
#'
#' @source Grafisk profil for Veterin<U+00E6>rinstituttet version 2024 (available on
#' NVI's intranet).
"palette_NVI"
#'
#' @title Palette with colours for graphs for 2025 - today's date
#' @description A vector with the hex values for colours to be used in graphs. The
#'     order of the colours are as they should be used in the graphs.
#' @details The colour codes are based on the hex values in the Graphical profile
#'     handbook (available at NVI's intranet). The colours are displayed in the
#'     vignette "NVI colour palettes".
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' A vector with 15 unnamed colours:
#'   #59CD8B (Jord), #D7F4FF (Luft), #1C4FB9 (Vann), #091A3E (Svart),
#'   #BCEED1 (Lys jord), #95D9F3 (Mørk luft), #C7D9FF (Lyst vann),
#'   #FF5447 (Mat), #FFDAD4 (Lys mat), #F5D34A (Gul), #FBECB2 (Lys gul),
#'   #9A55D2 (Lilla), #DEC2F5 (Lys lilla), #FCA446 (Orange), #F9D3A9 (Lys orange).
#'
#' @source Grafisk profil for Veterinærinstituttet version 2024 (available on
#' NVI's intranet).
#'
"palette_graph"
#'
#' @title Palette with colours for graphs in reports for 2025 - today's date
#' @description A vector with the hex values for colours to be used in graphs.
#'     The order of the colours are as they should be used in the graphs.
#' @details The colours are displayed in the vignette "NVI colour palettes".
#'     Remark that the colours #F2C512 and #C0ECD3 should not be used for line
#'     graphs.
#'
#' A vector with 12 unnamed colours:
#'    c(#143985, #9EB8F0, #CC0E00, #FF8D85, #836A00, #F2C512, #1A5634,
#'     #36B46C, #C0ECD3, #5CD1FF, #737F97, #B9BFCB).
#'
#' The script for preparing the palette is given in "./data-raw/generate_NVI_palettes.R".
#'
#' @source Grafisk profil for Veterin<U+00E6>rinstituttet version 2024 (available on
#' NVI's intranet).
#'
"palette_graph_report"
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
#' The colours are displayed in the vignette "NVI colour palettes".
#'
#' @format A vector with unnamed colours:
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
#' @source Grafisk profil for Veterin<U+00E6>rinstituttet version 2024 (available on
#'   NVI's intranet).
#'
"palette_gradient_green"
#'

#' @name palette_gradient_green
"palette_gradient_red"

#' @name palette_gradient_green
"palette_gradient_air"

#' @name palette_gradient_green
"palette_gradient_darkblue"

#' @name palette_gradient_green
"palette_gradient_earth"

#' @name palette_gradient_green
"palette_gradient_food"

#' @name palette_gradient_green
"palette_gradient_graa"

#' @name palette_gradient_green
"palette_gradient_grey"

#' @name palette_gradient_green
"palette_gradient_gul"

#' @name palette_gradient_green
"palette_gradient_jord"

#' @name palette_gradient_green
"palette_gradient_lightblue"

#' @name palette_gradient_green
"palette_gradient_luft"

#' @name palette_gradient_green
"palette_gradient_mat"

#' @name palette_gradient_green
"palette_gradient_red"

#' @name palette_gradient_green
"palette_gradient_vann"

#' @name palette_gradient_green
"palette_gradient_water"

#' @name palette_gradient_green
"palette_gradient_yellow"
