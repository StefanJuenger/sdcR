
# load package
library(magrittr)

# fancy comment
x <- 1
x
y # produces an error

# shoot, doesn't work
bla <- "bla"

plot(1:100)

source("./test/test_source_source.R", echo = TRUE)


y <-
  x %>%
  sum(c(., 2))
y


# STOP ADDING CODE BELOW -------------------------------------------------------

# DO NOT CHANGE OR EDIT THE FOLLOWING LINES. MUST REMAIN AT THE END OF THIS FILE
sdcR::produce_log_file(source_file = current_file(),
                       log_file = paste0(current_file(), ".log"))

sdcR::code_from_log(paste0(current_file(), ".log"), "./test/OUTPUTCODE.R")
