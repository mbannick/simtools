
#' Set seed for a task
#'
#' @param overall_seed Seed for entire process
#' @param num_tasks Number of job array tasks
#' @param task_id Task ID for this particular job
#' @export
#'
#' @import rlecuyer
set.stream.seed <- function(overall_seed, num_tasks, task_id){

  # Set overall seed
  rlecuyer::.lec.SetPackageSeed(overall_seed)

  # Create same streams across jobs
  stream.names <- paste0("stream", 1:num_tasks)
  rlecuyer::.lec.CreateStream(stream.names)

  # Set the stream for the current task_id
  rlecuyer::.lec.CurrentStream(stream.names[task_id])

}
