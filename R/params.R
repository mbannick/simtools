
#' Save parameter grid to output dir
#'
#' @param paramlist Named list of parameters
#' @param outdir Output directory
#' @param exclusions Optional exclusions from the parameter grid
#'
#' @return Number of jobs total
#'
#' @export
save.params <- function(paramgrid, outdir){

  njobs <- nrow(param_grid)
  write.csv(param_grid, file=sprintf("%s/params.csv", outdir))

  return(njobs)
}
