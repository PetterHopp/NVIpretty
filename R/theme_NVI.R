#' @title NVI theme for ggplot2
#' @description A complete ggplot2 theme in accord with NVI's graphical profile.
#'     The theme control all non-data display.
#'
#' @details The NVI theme without background for plot and legend, light grey horizontal support
#'     lines and dark grey axis' marks.
#'
#' @param base_size base font size, given in pts.
#' @param base_family base font family.
#' @param base_line_size base size for line elements.
#' @param base_rect_size base size for rectangular elements.
#'
#' @importFrom ggplot2 %+replace%
#'
#' @examples
#' mtcars2 <- within(mtcars, {
#'   vs <- factor(vs, labels = c("V-shaped", "Straight"))
#'   am <- factor(am, labels = c("Automatic", "Manual"))
#'   cyl  <- factor(cyl)
#'   gear <- factor(gear)
#' })
#'
#' p1 <- ggplot2::ggplot(mtcars2) +
#'   ggplot2::geom_point(ggplot2::aes(x = wt, y = mpg, colour = gear)) +
#'   ggplot2::labs(
#'     title = "Fuel economy declines as weight increases",
#'     subtitle = "(1973-74)",
#'     caption = "Data from the 1974 Motor Trend US magazine.",
#'     tag = "Figure 1",
#'     x = "Weight (1000 lbs)",
#'     y = "Fuel economy (mpg)",
#'     colour = "Gears"
#'   )
#'
#'   p1 + theme_NVI()
#'
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
    ggplot2::theme(line = ggplot2::element_line(colour = "grey15",
                                                size = base_line_size,
                                                linetype = 1,
                                                lineend = "butt"),

                   rect = ggplot2::element_rect(fill = "white",
                                                colour = "grey15",
                                                size = base_rect_size,
                                                linetype = 1),

                   text = ggplot2::element_text(family = base_family,
                                                face = "plain",
                                                colour = "grey15",
                                                size = base_size,
                                                lineheight = 0.9, hjust = 0.5, vjust = 0.5, angle = 0,
                                                margin = ggplot2::margin(),
                                                debug = FALSE),

                   axis.ticks         = ggplot2::element_blank(),
                   legend.background  = ggplot2::element_blank(),
                   legend.key         = ggplot2::element_blank(),
                   panel.background   = ggplot2::element_blank(),
                   panel.border       = ggplot2::element_blank(),
                   strip.background   = ggplot2::element_blank(),
                   plot.background    = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_line(color = "gray85", size = 0.2),
                   panel.grid.major.x = ggplot2::element_blank(),
                   panel.grid.minor   = ggplot2::element_blank(),

                   complete = TRUE
    )
}
