
#' Convert a text as "2/3" to numeric fraction
#'
#' @param x Text like "2/3
#' @export
as.fraction <- function(x){
  sapply(strsplit(x, split = "/"),
         function(u) as.numeric(u[1]) / as.numeric(u[2]))
}

#' Parse arguments from the command line, possibly in vector form
#'
#' @param arg Arguments, comma separated
#' @param type_fun Which type the argument should be
#'
#' @examples
#' parse.args("hello,world", as.character)
#' parse.args("1,2,3", as.integer)
#'
#' @export
parse.args <- function(arg, type_fun){
  vec <- strsplit(arg, ",")[[1]]
  vec <- type_fun(vec)
  return(vec)
}

#' Get parameter by name from a grid
#'
#' @param i Task ID
#' @param grid Parameter grid
#' @export
get.param.closure <- function(i, grid){
  get.param <- function(param=NULL){
    if(is.null(param)){
      return(grid[i, ])
    } else {
      return(grid[i, param][1])
    }
  }
  return(get.param)
}
