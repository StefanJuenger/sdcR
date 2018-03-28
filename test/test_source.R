# PLEASE DEFINE PATH AND NAME OF THIS FILE IN THE FOLLOWING VARIABLE
this_file <- "./test/test_source.R"


# PLACE CODE HERE --------------------------------------------------------------


# fancy comment
x <- 1
x
y # produces an error

# shit, doesn't work
bla <- "bla"

plot(1:100)


# STOP ADDING CODE BELOW -------------------------------------------------------

# DO NOT CHANGE OR EDIT THE FOLLOWING LINES. MUST REMAIN AT THE END OF THIS FILE
sdcR::produce_log_file(source_file = this_file,
                       log_file = paste0(this_file, ".log"))

sdcR::code_from_log(paste0(this_file, ".log"), "./test/OUTPUTCODE.R")
