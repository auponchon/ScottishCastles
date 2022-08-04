#' Merge castles locations, names and visits
#'
#' @param df1  a dataframe with locations
#' @param df2  a dataframe with visit status
#' @param img1 Icon for non visited castles
#' @param img2 Icon for visited castles
#' @param img3 Icon for closed castles
#' @param img4 Icon when using fill function in ggplot (same for all factors)
#' @param shapefile a polygon shapefile with Scotland coastline
#'
#' @return return a clean dataframe with coordinates, names and visits of castles
#' @importFrom plyr revalue
#' @import dplyr
#' @import tidyr
#' @import stringr
#' @import sf
#' @import here
#' @export
#'
#' @examples
#' data(visits)
#' data(locations)
#' data(reg)
#'
#' merge_castles(visits,locations,"im1","im2","im3","im4",reg)
#'
merge_castles<-function(df1,df2,img1,img2,img3,img4,shapefile){

    castles<- df1 %>%
        left_join(df2,by = "Name",all.y=T) %>%
        dplyr::filter(!sf::st_is_empty(.data$geometry)) %>%
        mutate(Visited = as.factor(replace_na(.data$Visited,0))) %>%
        mutate(County = replace_na(.data$County,"unknown")) %>%
        dplyr::filter(.data$County != "Shetlands") %>%
        mutate(Image_color = case_when(.data$Visited=="0" ~ img1,
                                       .data$Visited=="1" ~ img2,
                                       .data$Visited=="2" ~ img3,
                                       TRUE ~ "NA"),
               Image_solo = img4) %>%
        st_as_sf(.) %>%
        st_transform(., crs = st_crs(shapefile)) %>%
        mutate(Visited = revalue(.data$Visited, c( "0" = "Not visited",
                                             "1" = "Visited",
                                             "2" = "Closed")))
    return(castles)
}
