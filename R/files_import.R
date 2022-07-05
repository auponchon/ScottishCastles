#' Import the different files
#'
#' @param coastline a polygon shapefile
#' @param out.regions names of regions to exclude
#' @param klm.file  klm files containing visited castles
#' @param colnames  Column names to add in the new dataframe
#'
#' @return different dataframes
#' @importFrom magrittr %>%
#' @import dplyr
#' @import stringr
#' @import sf
#' @import here
#' @export

#'
#' @examples
#'
#'
read_shp_file <-function (coastline, out1,out2,shetland = FALSE){



          region<- coastline %>%
          sf::read_sf() %>%
          dplyr::filter(NAME !=  out1 & NAME !=  out2 )

          return(region)

#create a specific object for the Shetlands
if (shetland==TRUE){
shetland_poly<- here::here("inst","extdata","Scots_shapefiles",
                           "Boundary-line-historic-counties_region.shp") %>%
          read_sf() %>%
          dplyr::filter(NAME == "Shetland")
}
}
