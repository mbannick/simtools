
#' Setup output directories and write file description
#'
#' @param basedir Base directory to create the file in
#' @param desc Description to tag to the version of simulations
#' @export
setup.directories <- function(basedir, desc){

  theday <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S")
  OUT_DIR <- paste0(basedir, theday)

  if(dir.exists(OUT_DIR)) stop("Output directory already exists.")
  dir.create(OUT_DIR, recursive=TRUE)

  ERROR <- sprintf("%s/output", OUT_DIR)
  dir.create(ERROR, recursive=TRUE)

  RESULTS <- sprintf("%s/results", OUT_DIR)
  dir.create(RESULTS, recursive=TRUE)

  # Get the current git hash
  hash <- system("git rev-parse HEAD", intern=TRUE)

  # Write description to a text file
  fileConn <- file(sprintf("%s/DESCRIPTION.txt", basedir), "a")
  write(paste0(theday, ": ", desc) , fileConn, append=TRUE)
  write(paste0("Git Hash:", hash, "\n"), fileConn, append=TRUE)
  close(fileConn)

  return(OUT_DIR)
}
