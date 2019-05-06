#' Strip intentionally-placed empty grobs from facet plot
#'
#' @param p
#'
#' @export
#'
#' @examples
#'
#' # Strip empty facets
#' g <- strip_empty(p)
#'
#' # Next, plot grob object
#' grid::grid.newpage()
#' grid:: grid.draw(g)
strip_empty <- function(p, type = "24-2") {
    stopifnot(type %in% c("10-2", "24-2", "30-2"))

    g <- ggplotGrob(p)

    if (type == "24-2") {
        # panels <- unique(g$layout$name)[grepl("panel", unique(g$layout$name))]
        to_remove <- c("panel-1-1", "panel-1-2", "panel-1-8",
                       "panel-2-1", "panel-2-8",
                       "panel-3-1", "panel-3-7", "panel-3-8",
                       "panel-6-1", "panel-6-2", "panel-6-3","panel-6-7",
                       "panel-7-1", "panel-7-2", "panel-7-7",
                       "panel-8-1", "panel-8-2", "panel-8-8",
                       "panel-9-1", "panel-9-8")
        # used this and c(to_remove, remaining_options[i]) to find arbitrary panel locations to remove
        # remaining_options <- setdiff(panels, to_remove)
        # Also may be helpful:
        # g$layout
        # gtable::gtable_show_layout(g)
    } else if (type == "10-2") {
        to_remove <- c("panel-1-1", "panel-1-2", "panel-1-3", "panel-1-4",
                       "panel-1-7", "panel-1-8", "panel-1-9", "panel-1-10",
                       "panel-2-1", "panel-2-2", "panel-2-9", "panel-2-10",
                       "panel-3-1", "panel-3-10",
                       "panel-4-1", "panel-4-10",
                       "panel-7-1", "panel-7-10",
                       "panel-8-1", "panel-8-10",
                       "panel-9-1", "panel-9-2", "panel-9-9", "panel-9-10",
                       "panel-10-1", "panel-10-2", "panel-10-3", "panel-10-4",
                       "panel-10-7", "panel-10-8", "panel-10-9", "panel-10-10")
    } else if (type == "30-2") {
        to_remove <- c("panel-1-1", "panel-1-2", "panel-1-3",
                       "panel-1-8", "panel-1-9", "panel-1-10",
                       "panel-2-1", "panel-2-2", "panel-2-9", "panel-2-10",
                       "panel-3-1", "panel-3-10",
                       "panel-8-1", "panel-8-10",
                       "panel-9-1", "panel-9-2", "panel-9-9", "panel-9-10",
                       "panel-10-1", "panel-10-2", "panel-10-3",
                       "panel-10-8", "panel-10-9", "panel-10-10")
    }

    # get the grobs that must be removed
    rm_grobs <- g$layout$name %in% to_remove
    # remove grobs
    g$grobs[rm_grobs] <- NULL
    g$layout <- g$layout[!rm_grobs, ]
    g
}

# https://stackoverflow.com/questions/40807252/ggplot2-deleting-facets-of-unused-factor-level-combinations-from-a-plot-facet
