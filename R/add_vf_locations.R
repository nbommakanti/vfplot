#' Add VF Locations
#'
#' This function right joins the data to vf_map, adding all locations
#'  and introducing NA for areas with no data (which are supposed to be empty)
#' @param data
#'
#' @return data with numbered locations
#' @export
#'
#' @examples
#' add_vf_locations(data)
add_vf_locations <- function(data, type = "24-2") {
    stopifnot(type %in% c("10-2", "24-2", "30-2"))

    # Note that there will be missing values.
    # This is intentional - these regions will be removed
    if (type == "24-2") {
        merged <- merge(data, vf_map_24d2, by = c("x", "y"), all.y = TRUE)
    } else if (type == "10-2") {
        merged <- merge(data, vf_map_10d2, by = c("x", "y"), all.y = TRUE)
    } else if (type == "30-2") {
        merged <- merge(data, vf_map_30d2, by = c("x", "y"), all.y = TRUE)
    }
    return(merged)

}
