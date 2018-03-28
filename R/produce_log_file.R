#' Evaluate R Source File and Write It to Log File
#'
#' Mimics Stata's log file function. The function expects to be placed at the
#' bottom of the R script that should be logged.
#'
#' @param source_file character string. Location and name of R source file that
#'   should be evaluated and logged. Note that the last lines of this source
#'   file is reserved for this function. Accordingly, this function should be
#'   placed there. The line gets deleted on the fly after execution. Therefore,
#'   it won't appear in the log file.
#'
#' @param log_file character string. Location and name of log file to which logs
#'   are written
#'
#' @param start_code_marker character string. Regular expression siginaling
#'   where the user can start to write some code
#'
#' @param stop_code_marker character string. Regular expression signaling where
#'   the user has to stop to write some code
#'
#' @importFrom magrittr %>%
#'
#' @export
#'


produce_log_file <- function (source_file, log_file,
                              start_code_marker = ".*# PLACE CODE HERE ---*\r\n",
                              stop_code_marker = "# STOP ADDING CODE BELOW.*") {

  # load source file -----------------------------------------------------------
  source_file <-

    # read source file line by line
    readr::read_file(source_file) %>%

    # delete everything that's not within the code place holders
    gsub(start_code_marker, "", .) %>%

    gsub(stop_code_marker, "", .) %>%

    # # delete line for function itself is called
    # gsub("produce_log_file(.*)", "", .) %>%

    # remove \r escape sequences
    gsub("\r", "", .)

  # evaluate results -----------------------------------------------------------
  results <- evaluate::evaluate(source_file)

  # write results in sink ------------------------------------------------------

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

  # # re-read log file to remove admin stuff -------------------------------------
  # log_file_to_manipulate <-
  #
  #   readr::read_file(log_file) %>%
  #
  #   # remove start_* and stop_code_marker
  #   gsub(start_code_marker,
  #        "", .) %>%
  #
  #   gsub(stop_code_marker, "", .) %>%
  #
  #   # remove \r escape sequences
  #   gsub("\r", "", .)

  # # write back to hard drive
  # readr::write_file(log_file_to_manipulate, log_file)


}
