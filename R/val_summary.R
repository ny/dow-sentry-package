

#' Validation Summary
#'
#' @param kvp_element The name of the json element that will be used to query validation reports.
#' @param kvp_value The unique value that will be stored in `kvp_element` that will be used to query validation report.
#' @param email_address a character vector with at least one email address. The provided emails must be address to "dec.ny.gov" accounts. %>%
#' @param filename a string representing the name of the file under validation.
#' @param error_summary a character vector where each element represents a summary of errors or lack there of.
#' @param report a validation report.
#' @param status a character string indicating if the data deliverable passed ("pass") or failed ("fail") validation.
#'
#' @return a list
#' @export

val_summary <- function(kvp_element, kvp_value, email_address, filename, error_summary, report, status) {
  stopifnot(
    length(kvp_element) == 1,
    is.character(kvp_element),
    length(kvp_value) == 1,
    is.character(kvp_value),
    grepl("@dec.ny.gov", email_address),
    length(filename) == 1,
    is.character(filename),
    status %in% c("pass", "fail")
  )
  summary_list <- list()
  summary_list$key_value_pair_element <- kvp_element
  summary_list$key_value_pair_value <- kvp_value
  summary_list$status <- status
  summary_list$email_address <- email_address
  summary_list$email_subject <- paste0(
    filename,
    ": ",
    tools::toTitleCase(status),
    "ed Validation"
  )
  summary_list$email_body <- ifelse(
    test = status == "pass",
    yes = "<p> No validation issues identified. Data are now available in the WQMA database. </p>",
    no =  paste("<p>",
                paste0(filename, ","),
                "did not pass the automated validation for the following reason(s):",
                "</p>",
                paste0(seq_along(error_summary), ") ",
                       error_summary, collapse = " </br> "))
  )

  summary_list$email_attachment <- list(
    report = report,
    # If data fail validation, then provided staff with raw data to work
    # through the issue. If data passes validation, then data is available
    # in DB and there is no need to email raw data to staff.
    # This will be an indication to ITS of when to provide data in email.
    raw_data = status == "fail"
  )

  return(summary_list)
}




