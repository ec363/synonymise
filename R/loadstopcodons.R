#' loadstopcodons
#'
#' Loads a list of stop codons.
#'
#' @export
#' @examples
#' stop_codons <- loadstopcodons()

loadstopcodons <- function(){
  stop_codons <- c("TAA", "TAG", "TAG")
  return(stop_codons)
}