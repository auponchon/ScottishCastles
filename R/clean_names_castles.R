#' Title
#'
#' @param dataframe a dataframe with castles name
#'
#' @return return a dataframe with clean castle names
#' @import dplyr
#' @import stringr
#' @export
#'
#' @examples
#'
#' df<-data.frame(Name = "Dunnottar", County="Aberdeenshire")
#' clean_names_castles(df)
#'
clean_names_castles<-function(dataframe) {
    dataframe %>%
        dplyr::mutate(Name=stringr::str_to_title(Name)) %>%
        dplyr:: mutate(Name = case_when(str_detect(Name, "Castle")==F &
                                            stringr::str_detect(Name, "House")==F &
                                            stringr::str_detect(Name, "Palace")==F &
                                            stringr::str_detect(Name, "Chapel")==F &
                                            stringr::str_detect(Name, "Tower")==F~paste(Name,"Castle",sep=" "),
                                TRUE ~ as.character(Name))) -> output

    return(output)
}
