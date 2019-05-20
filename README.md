**For any questions regarding your visit to the GESIS Secure Data Center (SDC), please contact us personally and always pay attention to the [guidelines for your visit](https://www.gesis.org/fileadmin/upload/dienstleistung/daten/secure_data_center/Guidelines_for_the_Secure_Data_Center_Safe_Room.pdf)**

People who work with R also want access to sensitive data which are provided in the [GESIS Secure Data Center]( https://www.gesis.org/en/services/data-analysis/more-data-to-analyze/secure-data-center-sdc/). Yet, R often does not have the same feature set as other software packages, such as Stata. This `R`-package aims to imitate some of these functions:
  - Creating a log file from an R script
  - Extracting an R script from a log file
  - ...

The package can be installed with the R command:

```{r}
devtools::install_github("stefmue/sdcR")
```

## Creating a log file file from an R script
Currently, you can create a logfile from an R script by placing a footer to your script (see below) and running the command `produce_log_file()` as follows:

```{r}
# STOP ADDING CODE BELOW -------------------------------------------------------

# DO NOT CHANGE OR EDIT THE FOLLOWING LINES. MUST REMAIN AT THE END OF THIS FILE
sdcR::produce_log_file(source_file = current_file(),
                       log_file = paste0(current_file(), ".log"))
```

Alternatively, you can simply use the command `produce_log_file()` to create a log file from an external session. For example:

```{r}
sdcR::produce_log_file(source_file = "/path/to/your/fancy_R_script.R",
                       log_file = "/path/to/your/fancy_R_script.R.log")
```

What we will ask you to do in the SDC, however, is to use this first appraoch as it is more error-prone and holds everything in one place.

## Creating a log file file from an R script
After a logfile was produced (and checked by us for sensitivity) you may want to extract the `R` code from the it. This can be done using again two approaches. The footer approach would be:

```{r}
# STOP ADDING CODE BELOW -------------------------------------------------------

# DO NOT CHANGE OR EDIT THE FOLLOWING LINES. MUST REMAIN AT THE END OF THIS FILE
sdcR::produce_log_file(source_file = current_file(),
                       log_file = paste0(current_file(), ".log"))
                       
sdcR::code_from_log(paste0(current_file(), ".log"), "./test/OUTPUTCODE.R")
```

And the external approach:

```{r}
sdcR::produce_log_file(source_file = "/path/to/your/fancy_R_script.R",
                       log_file = "/path/to/your/fancy_R_script.R.log")
                       
                       
sdcR::code_from_log("/path/to/your/fancy_R_script.R.log", 
                    "/path/to/your/fancy_R_script.R.log.R")                       
```

As you might already imagine, what we will ask you to do in the SDC is again to use the first approach.
