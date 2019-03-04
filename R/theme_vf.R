#' Theme for 24-2 visual fields plots
#'
#' @return NULL
#' @import ggplot2
#' @export
#'
#' @examples
#' p + theme_vf()
theme_vf <- function () {
    theme_classic(base_family = "Roboto", base_size = 14) +
        theme(
            plot.title = element_text(size = 18, face = "bold"),
            plot.subtitle = element_text(size = 12),
            axis.line.y = element_blank(),
            axis.ticks.y = element_blank(),
            panel.grid.major.y = element_line(size = 0.1, linetype = 3),
            panel.border = element_rect(linetype = "solid",
                                        fill = NA,
                                        color = colorscale_columbia[8]),
            strip.background = element_blank(),
            strip.text.x = element_blank())
}
