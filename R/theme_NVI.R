#' @title NVI theme for ggplot2
#' @description A complete ggplot2 theme in accord with NVI's graphical profile.
#'     The theme control all non-data display.
#'
#' @details The NVI theme without background for plot and legend, light grey horizontal support
#'     lines and dark grey axis' marks.
#'
#' @param base_size [\code{numeric(1)}]\cr
#'     Base font size, given in pts. Defaults to 11.
#' @param base_family [\code{character(1)}]\cr
#'     Base font family. Defaults to "".
#' @param base_line_size [\code{numeric(1)}]\cr
#'     Base size for line elements. Defaults to `base_size` / 22.
#' @param base_rect_size [\code{numeric(1)}]\cr
#'     Base size for rectangular elements. Defaults to `base_size` / 22.
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


theme_NVI <- function(base_size = 11, base_family = "",
                      base_line_size = base_size / 22,
                      base_rect_size = base_size / 22) {
  # Starts with theme_grey and then modify some parts
  ggplot2::theme_grey(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace%
    ggplot2::theme(line = ggplot2::element_line(colour = "grey35",
                                                size = base_line_size,
                                                linetype = 1,
                                                lineend = "butt"),

                   rect = ggplot2::element_rect(fill = "white",
                                                colour = "grey35",
                                                size = base_rect_size,
                                                linetype = 1),

                   text = ggplot2::element_text(family = base_family,
                                                face = "plain",
                                                colour = "grey35",
                                                size = base_size,
                                                lineheight = 0.9, hjust = 0.5, vjust = 0.5, angle = 0,
                                                margin = ggplot2::margin(),
                                                debug = FALSE),

                   axis.ticks = ggplot2::element_blank(),
                   legend.background = ggplot2::element_blank(),
                   legend.key = ggplot2::element_blank(),
                   panel.background = ggplot2::element_blank(),
                   panel.border = ggplot2::element_blank(),
                   strip.background = ggplot2::element_blank(),
                   plot.background = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_line(color = "gray85", size = 0.2),
                   panel.grid.major.x = ggplot2::element_blank(),
                   panel.grid.minor = ggplot2::element_blank(),

                   complete = TRUE
    )
}
