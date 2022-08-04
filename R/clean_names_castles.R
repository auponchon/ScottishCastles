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
        dplyr::mutate(Name=stringr::str_to_title(.data$Name)) %>%
        dplyr:: mutate(Name = case_when(str_detect(.data$Name, "Castle")==F &
                                            stringr::str_detect(.data$Name, "House")==F &
                                            stringr::str_detect(.data$Name, "Palace")==F &
                                            stringr::str_detect(.data$Name, "Chapel")==F &
                                            stringr::str_detect(.data$Name, "Tower")==F~paste(.data$Name,"Castle",sep=" "),
                                TRUE ~ as.character(.data$Name))) -> output

    return(output)
}
