#' Merge castles locations, names and visits
#'
#' @param df1  a dataframe with locations
#' @param df2  a dataframe with visit status
#' @param img1 Icon for non visited castles
#' @param img2 Icon for visited castles
#' @param img3 Icon for closed castles
#' @param img4 Icon when using fill function in ggplot
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
merge_castles<-function(df1,df2,img1,img2,img3,img4,shapefile){

    castles<- df1 %>%
        left_join(df2,by = "Name",all.y=T) %>%
        mutate(Visited = as.factor(replace_na(Visited,0))) %>%
        mutate(County = replace_na(County,"unknown")) %>%
        dplyr::filter(County != "Shetlands") %>%
        mutate(Image_color = case_when(Visited=="0" ~ img1,
                                       Visited=="1" ~ img2,
                                       Visited=="2" ~ img3,
                                       TRUE ~ "NA"),
               Image_solo = img4) %>%
        st_transform(., crs = st_crs(shapefile)) %>%
        mutate(Visited = revalue(Visited, c( "0" = "Not visited",
                                             "1" = "Visited",
                                             "2" = "Closed")))
    return(castles)
}
