### code to prepare `Scottish_castles_locations` dataset goes here
####################################################################
## DATA 1
# retrieve paths to klm file with castle coordinates
library(stringr)
library(stringi)

klm.file <- system.file(
    "extdata",
    "ScottishCastles_2022-08-22.kml",
    package = "ScottishCastles")

locations<-st_read(klm.file)
usethis::use_data(locations, overwrite = TRUE)

##########################################################
# DATA 2
# retrieve paths to csv file with castle visit status
visited <- system.file(
    "extdata",
    "visited_castles_2022-05-30.xlsx",
    package = "ScottishCastles")

Col.Names<-c("Name","City","County","Visited")
visits<-read_excel(visited, col_names=Col.Names)
usethis::use_data(visits, overwrite = TRUE)


##########################################################
# DATA 3
#load polygon shapfile with Scotland coastline

reg <- system.file(
    "extdata",
    "Scots_shapefiles", "Scotland_Shetlands.shp",
    package = "ScottishCastles")

reg<-read_sf(reg)
crs_bad<-st_crs(reg)$wkt

st_crs(reg)$wkt<-stringi::stri_enc_toascii(crs_bad)
#textclean::replace_non_ascii(crs_bad)

#save the wine_data dataframe as an .rda file in WineReviews/data/
usethis::use_data(reg, overwrite = TRUE)

##########################################################
# DATA 4
#load topography raster for Scotland and project it
topo <- raster::raster(system.file(
    "extdata",
    "ETOPO.tiff",
    package = "ScottishCastles"
))

topo_proj<-raster::projectRaster(topo,
                                 crs=sp::CRS("+init=epsg:27700"))

topo<-raster::mask(topo_proj,reg)

topo_df <-as.data.frame(as(topo, "SpatialPixelsDataFrame"))
colnames(topo_df) <- c("value", "x", "y")
usethis::use_data(topo_df, overwrite = TRUE)


resaveRdaFiles("data/locations.rda",compress="xz")
resaveRdaFiles("data/reg.rda",compress=xz")
resaveRdaFiles("data/topo_df.rda",compress="xz")
resaveRdaFiles("data/visits.rda",compress="xz")

