#' @title NVI theme for ggplot2 to be used for official reports
#' @description A complete ggplot2 theme in accord with NVI's graphical profile.
#'     The theme control all non-data display. The theme should be used together
#'     with the palette palette_graph_report.
#'
#' @details theme_NVI_report is a modification of theme_NVI where additional
#'     specifications are given. In short the theme defines the font, legend
#'     position, axis's, grid lines with colours for lines and background.
#'
#' The background colour is white and the foreground is black.
#'
#' The font is Calibri and Calibri light. These are fonts that first be added
#'     to the font families available for R. On Windows, run:
#' \preformatted{
#' sysfonts::font_add(
#'       family = "calibri",
#'       regular = file.path(sysfonts::font_paths(), "Calibri", "Calibri.ttf"),
#'       bold = file.path(sysfonts::font_paths(), "Calibri", "Calibrib.ttf"),
#'       italic = file.path(sysfonts::font_paths(), "Calibri", "Calibrii.ttf"),
#'       bolditalic = file.path(sysfonts::font_paths(), "Calibri", "Calibriz.ttf")
#'       )
#' sysfonts::font_add(
#'       family = "calibri-light",
#'       regular = file.path(sysfonts::font_paths(), "Calibri", "Calibril.ttf"),
#'       italic = file.path(sysfonts::font_paths(), "Calibri", "Calibrili.ttf")
#'       )
#' showtext::showtext_auto()
#' }
#'
#' The axis tick mark text uses calibri-light with font size 6. The axis
#'     title on the y-axis uses calibri with font size 8. As default, there are
#'     no axis title for the x-axis.
#'
#' Legend position is "bottom". The label text uses calibri-light with font
#'     size 6.
#'
#' @param base_size \\[\code{numeric(1)}\\]\cr
#'     Base font size, given in pts. Defaults to 8.
#' @param base_family [\code{character(1)}]\cr
#'     Base font family. Defaults to "calibri" in agreement with standards for
#'     the official reports.
#' @param base_line_size [\code{numeric(1)}]\cr
#'     Base size for line elements. Defaults to 0.5  in agreement with standards
#'     for the official reports.
#' @param base_rect_size [\code{numeric(1)}]\cr
#'     Base size for rectangular elements. Defaults to 0.5 in agreement with
#'     standards for the official reports.
#' @param ink [\code{character(1)}]\cr
#'     Foreground colour. Defaults to "black". in agreement with standards for
#'     the official reports.
#' @param paper [\code{character(1)}]\cr
#'     Background colour. Defaults to "white". in agreement with standards for
#'     the official reports.
#' @param axis_text_x
#'     Defaults to element_text(family = "calibri-light", face = "plain", size = 6, angle = 0)
#'     in agreement with standards for the official reports.
#' @param axis_text_y
#'     Defaults to element_text(family = "calibri-light", face = "plain", size = 6)
#'     in agreement with standards for the official reports.
#' @param axis_title_x_family
#'     Defaults to element_blank(),
#' @param axis_title_y
#'     Defaults to element_text(family = "calibri", face = "plain", size = 8),
#' @param legend_position [\code{character(1)}]\cr
#'     Position of legend. Must be one of c("none", "left", "right", "bottom",
#'     "top", "inside"). Defaults to "bottom" in agreement with standards for
#'     the official reports.
#' @param legend_text
#'     Defaults to element_text(family = "calibri-light", face = "plain", size = 6)
#'     in agreement with standards for the official reports.
#'
#' @importFrom ggplot2 %+replace%
#'
#' @examples
#' library(ggplot2)
#' library(NVIpretty)
#'
#' # Scatter plot
#' ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
#'   geom_point(aes(color = Species)) +
#'   theme(legend.position = "right") +
#'   theme_NVI() +
#'   scale_colour_manual(values = palette_graph)
#'
#' # Changing default theme for the whole session
#' theme_set(theme_NVI())
#'
#' # The default them is now "theme_NVI" and there is no need to specify the theme within "ggplot".
#' # Box plot in accord with NVI's graphical profile
#' ggplot(iris, aes(Species, Sepal.Length)) +
#'   geom_boxplot(aes(fill = Species)) +
#'   theme(legend.position = "right") +
#'   scale_fill_manual(values = palette_graph)
#' @export
#'

theme_NVI_report <- function(
    base_size = 8,
    base_family = "calibri",
    base_line_size = 0.5,
    base_rect_size = 0.5,
    ink = "black",
    paper = "white",
    axis_text_x = element_text(family = "calibri-light", face = "plain", size = 6, angle = 0),
    axis_text_y = element_text(family = "calibri-light", face = "plain", size = 6),
    axis_title_x_family = element_blank(),
    axis_title_y = element_text(family = "calibri", face = "plain", size = 8),
    legend_position = 'bottom',
    legend_text = element_text(family = "calibri-light", face = "plain", size = 6)
) {
  # Starts with theme_NVI and then modify some parts
  theme_NVI(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,
    ink = ink,
    paper = paper
  ) %+replace%
    ggplot2::theme(text = ggplot2::element_text(family = base_family,
                                                face = "plain",
                                                colour = ink,
                                                size = base_size,
                                                lineheight = 0.9, hjust = 0.5, vjust = 0.5, angle = 0,
                                                margin = ggplot2::margin(),
                                                debug = FALSE),

                   # axis.ticks = ggplot2::element_blank(),
                   legend.background = ggplot2::element_blank(),
                   legend.key = ggplot2::element_blank(),
                   legend.position = legend_position,
                   legend.title = element_blank(),
                   # panel.background = ggplot2::element_blank(),
                   panel.border = ggplot2::element_rect(fill = NA),
                   strip.background = ggplot2::element_blank(),
                   # plot.background = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_line(color = "#d9d9d9", linewidth = 0.25),
                   panel.grid.major.x = ggplot2::element_blank(),
                   panel.grid.minor = ggplot2::element_blank(),

                   complete = TRUE
    )
}
