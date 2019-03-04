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
add_vf_locations <- function(data) {
    # Note that there will be missing values.
    # This is intentional - these regions will be removed
    return(merge(data, vf_map, by = c("x", "y"), all.y = TRUE))

}
