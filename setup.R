data_dir <- "UCI HAR Dataset"

setup_project <- function (){
  install_dependencies()
  fetch_data()
}

install_dependencies <- function(){
  require("tidyverse")
  library(tidyverse)
  require("data.table")
  library(data.table)
}

fetch_data <- function(){
  filename <- "source.zip"
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if(!(file.exists(filename) || file.exists(data_dir))){
    download.file(url, filename, mode = "wb")
    unzip(filename)
    file.remove(filename)
  }
}