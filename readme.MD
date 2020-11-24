# setup.R
This file contains the loading and extracting of the source files.
Call `setup_project()` to install dependencies and download the files

# run_analysis.R
This files contains the logic for tidying and summarizing the data.
It will merge the test and learn data and select all columns related to the mean or the standard deviation
Call: `create_raw_dataset()` to get the raw data.
Call: `create_grouped_dataset()` to get the data grouped by subject & activity