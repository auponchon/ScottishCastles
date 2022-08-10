#' Castles which have been visited or not visited (closed)
#'
#' A dataset containing the name, county and visit status of some castles in Scotland
#'
#' \itemize{
#'   \item Name. Name of the castle (not edited)
#'   \item City. City in which castle is
#'   \item County. County in which castle is
#'   \item Visited. Whether the castle was visited (1), not visited yet (0) or closed
#' }
#'
#' @docType data
#' @keywords datasets
#' @name visits
#' @usage data(visits)
#' @format A data frame with 157 rows and 4 variables
"visits"


#' Locations of castles extracted from google earth
#'
#' A dataset containing the name and coordinates of castles in Scotland
#'
#' \itemize{
#'   \item Name. Name of the castle (not edited)
#'   \item Description. Geographic features (points)
#'   \item geometry. Geographic coordinates of the castles
#' }
#'
#' @docType data
#' @keywords datasets
#' @name locations
#' @usage data(locations)
#' @format A sf object with 219 rows and 3 variables
"locations"


#' Vector shapefile reprsenting the county borders in Scotland
#'
#' A shapefile with poygons representing the different counties of Scotland
#'
#' \itemize{
#'   \item NAME. Name of the castle (not edited)
#'   \item DESCRIPTIO. County (polygons)
#'   \item geometry. Geographic coordinates of the castles
#' }
#'
#' @docType data
#' @keywords datasets
#' @name reg
#' @usage data(reg)
#' @format A sf object with 35 rows and 3 variables
"locations"


#' A dataframe representing the topography of Scotland
#'
#' Dataframe extracted from a raster layer
#'
#' \itemize{
#'   \item value. Altitude (m)
#'   \item x. Longitude (projected in m)
#'   \item y. Latitude (pojected in m)
#' }
#'
#' @docType data
#' @keywords datasets
#' @name topo_df
#' @usage data(topo_df)
#' @format A datafrme with 42314 rows and 3 variables
"topo_df"

