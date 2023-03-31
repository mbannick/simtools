
#' Submit jobs to SLURM cluster
#' @param njobs Number of jobs in array
#' @param shellname Shell script name
#' @param scriptname Name of script to run
#' @param outdir Output directory
#' @param ... Additional arguments to pass to scriptname
#'
#' @export
submit.jobs <- function(njobs, shellname, scriptname, outdir, ...){

  command1 <- sprintf("sbatch --array=1-%s", njobs)
  command2 <- paste0("-e ", outdir, "/output/s-%A_%a.out -o ", outdir, "/output/s-%A_%a.out")
  command3 <- sprintf("%s %s %s", shellname, scriptname, outdir)
  command4 <- paste(...)

  command <- paste(command1, command2, command3, command4)

  print(command)
  system(command)
}
