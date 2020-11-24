source("setup.R")

create_raw_dataset <- function(){
  test <- load_data("test")
  train <- load_data("train")
  test %>% 
    add_row(train) %>%
    select(1:2, contains("mean"), contains("std"))
}

create_grouped_dataset <- function(){
   create_raw_dataset() %>% 
    group_by(subject, activity) %>%
    summarise_all(mean)
}

load_data <- function(suffix){
  data_source_dir <- file.path(data_dir, suffix)
  raw_data <- as_tibble(
    fread(
      file.path(data_source_dir, paste("X_", suffix, ".txt", sep = ""))
    )
  )
  
  data_labels <- fread(file.path(data_dir, "features.txt"))[[2]]
  data_labels <- make.unique(data_labels)
  names(raw_data) <- data_labels
  
  
  subject <- fread(
    file.path(data_source_dir, paste("subject_", suffix, ".txt", sep = "")),
    col.names = "subject"
  )
  
  training_type <- fread(
    file.path(data_source_dir, paste("y_", suffix, ".txt", sep = "")), 
    col.names = "ID"
  )
  
  activity_labels <- fread(
    file.path(data_dir, "activity_labels.txt"),
    col.names = c("ID", "activity"),
    colClasses = c("numeric", "factor")
    )
  
  training_type <- training_type %>% left_join(activity_labels)
  
  raw_data %>% 
    add_column(training_type[,2], .before = 1 ) %>%
    add_column(subject, .before = 1 )
}
