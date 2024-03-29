#' Generate a Validation Report
#'
#' @param x a data object.
#' @param output_dir a file path were the rendered report will be stored.
#' @param filename a character string to include in file name.
#' @param ... additional arguments.
#'
#' @return
#' @export
gen_val_report <- function(x, output_dir, filename, ...) {
  UseMethod("gen_val_report", x)
}

#' @export
gen_val_report.ALS_val <- function(x, output_dir, filename) {

  # Render a single report.
  rmarkdown::render(input = system.file("rmarkdown",
                                        "templates",
                                        "ALS",
                                        "als_template.Rmd",
                                        package = "Sentry"),
                    output_dir = output_dir,
                    output_file = paste0(filename,
                                         "_validation-report"),
                    params = list(
                      validated = x
                    ))
}

#' Import HTML Report
#'
#' @inheritParams gen_val_report
#'
#' @return a character string representing an html document.
#' @export

get_html_report <- function(output_dir, filename) {

    htmltools::includeHTML(file.path(output_dir,
                                   filename))

}
