#' Evaluate R Source File and Write It to Log File
#'
#' Mimics Stata's log file function. The function expects to be placed at the
#' bottom (last 3 lines) of the R script that should be logged.
#'
#' @param source_file character string. Location and name of R source file that
#'   should be evaluated and logged. Note that the 3 last lines of this source
#'   file are reserved for this function. Accordingly, this function should be
#'   placed there. They get deleted on the fly after execution. Therefore, they
#'   won't appear in the log file.
#'
#' @param log_file character string. Location and name of log file to which logs
#'   are written
#'
#' @importFrom magrittr %>%
#'


produce_log_file <- function (source_file, log_file) {

  source_file <-

    # read source file line by line
    readr::read_file(source_file) %>%

    # delete line for function itself is called
    gsub("produce_log_file(.*)", "", .) %>%

    # remove \r escape sequences
    gsub("\r", "", .)

  # evaluate results
  results <- evaluate::evaluate(source_file)

  # open file connection
  file_connection <- file(log_file)

  # open results sink for file connection
  sink(file_connection)

  # open messages sink for file connection
  sink(file_connection, type = "message")

  # replay results
  evaluate::replay(results)

  # close messages sink for file connection
  sink(type = "message")

  # close results sink for file connection
  sink()

  # re-read log file to remove admin stuff
  log_file_to_manipulate <-

    readr::read_file(log_file) %>%

    gsub(".*# PLACE CODE HERE ---*\r\n",
         "", .) %>%

    gsub("# STOP ADDING CODE BELOW.*", "", .) %>%

    # remove \r escape sequences
    gsub("\r", "", .)

  # write back to hard drive
  readr::write_file(log_file_to_manipulate, log_file)


}
