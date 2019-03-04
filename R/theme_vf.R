#' Theme for 24-2 visual fields plots
#'
#' @return NULL
#' @import ggplot2
#' @export
#'
#' @examples
#' p + theme_vf()
theme_vf <- function (base_family = "Helvetica", base_size = 14,
                      base_line_size = base_size / 22,
                      base_rect_size = base_size / 22) {
    theme_classic(
        base_family = base_family,
        base_size = base_size,
        base_line_size = base_line_size,
        base_rect_size = base_rect_size
    ) %+replace%
        theme(
            # Large title and smaller subtitle
            plot.title = element_text(size = 18, face = "bold", hjust = 0),
            plot.subtitle = element_text(size = 12, hjust = 0),


            # Hide y axis line and ticks
            axis.line.y = element_blank(),
            axis.ticks.y = element_blank(),

            # Add dashed y-axis line
            panel.grid.major.y = element_line(size = 0.3,
                                              linetype = 3,
                                              color = colorscale_columbia["lightgray"]),

            # Outline facetted plots
            panel.border = element_rect(linetype = "solid",
                                        fill = NA,
                                        color = colorscale_columbia[8]),

            # Remove facet labels
            strip.background = element_blank(),
            strip.text.x = element_blank())
}

