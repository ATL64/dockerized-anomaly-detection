#load('exampleSpace.RData')
library(dplyr)
library(plotly)
library(ggplot2)
library(googleCharts)
# library(rJava)
library(shiny)
library(shinythemes)
# docker run -d centos tail -f /dev/null
# test<-read.csv("./myapp/test.csv")
# predictions<-read.csv("./myapp/predictions.csv")
# meta_frame<-read.csv("./myapp/meta_frame.csv")
#sudo ssh docker-ATL-app

test<-read.csv("test.csv")
predictions<-read.csv("predictions.csv")
meta_frame<-read.csv("meta_frame.csv")
test_factors_names<-names(test)[93:ncol(test)]
factor_names<-test_factors_names

meta_frame$volume<-100000000
meta_frame$volume[1:54]<-apply(test[1:54,3:92],1,mean)


if(substr(names(test)[3],1,1)=='X'){
  for(na in 3:92){
    names(test)[na]<-gsub("\\.","-",substr(names(test)[na],2,nchar(names(test)[na])))
  }
}


if(substr(names(predictions)[3],1,1)=='X'){
  for(na in 1:30){
    names(predictions)[na]<-gsub("\\.","-",substr(names(predictions)[na],2,nchar(names(predictions)[na])))
  }
}


####dropdown checkboxes function

dropdownButton <- function(label = "", status = c("default", "primary", "success", "info", "warning", "danger"), ..., width = NULL) {
  
  status <- match.arg(status)
  # dropdown button content
  html_ul <- list(
    class = "dropdown-menu",
    style = if (!is.null(width)) 
      paste0("width: ", validateCssUnit(width), ";"),
    lapply(X = list(...), FUN = tags$li, style = "margin-left: 10px; margin-right: 10px;")
  )
  # dropdown button apparence
  html_button <- list(
    class = paste0("btn btn-", status," dropdown-toggle"),
    type = "button", 
    `data-toggle` = "dropdown"
  )
  html_button <- c(html_button, list(label))
  html_button <- c(html_button, list(tags$span(class = "caret")))
  # final result
  tags$div(
    class = "dropdown",
    do.call(tags$button, html_button),
    do.call(tags$ul, html_ul),
    tags$script(
      "$('.dropdown-menu').click(function(e) {
      e.stopPropagation();
});")
  )
}