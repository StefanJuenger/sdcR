#' Create R Script File from R Log File
#'
#' After running \code{produce_log_file()} this function creates an R Script
#' from the resulting log file. Accordingly, it deletes all information on
#' results, errors and other other messages.
#'
#' @param log_file character string. Path and name of the log file produced with
#'   \code{produce_log_file()}
#'
#' @param code_file character string. Path and name of the resulting R Script
#'   file
#'
#' @importFrom magrittr %>%
#'
#' @export
#'


code_from_log <- function (log_file, code_file) {

  log_file <-

    # read in log file line by line, because it's easier to manipulate
    readr::read_lines(log_file) %>%

    # delete every line that was not typed in the command prompt
    grep("> .*", ., value = TRUE) %>%

    # delete preceding R command prompt signs (>)
    gsub("> ", "", .) %>%

    # collapse to one large character string
    paste(., collapse = "\n")

  # save
  readr::write_file(log_file, code_file)

}
