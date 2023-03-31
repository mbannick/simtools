
#' Is the current script being run in parallel
#' @export
is.parallel <- function() length(commandArgs(trailingOnly=TRUE)) > 0
