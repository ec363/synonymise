#' select_alternative
#'
#' Select a codon from a provided list that has a decent codon usage. Works by
#' selecting a codon at random from the possible_codons list until it isn't also
#' on the excluded forbidden_codons list. Codon lists with only one variant, or
#' with no non-forbidden options will return original codon. Returned codon is
#' provided as lower case string. Verbose option helps to follow the function as
#' it is working. Is called by synonymise function, but can also be used
#' independently.
#'
#' @param possible_codons dataframe of codons to choose from (eg. output from
#'   find_synonymous_codons function).
#' @param forbidden_codons dataframe of codons to exclude, such as rare codons.
#' @param verbose logical. Defaults to FALSE.
#' @param input optional. string used to specify input codon, only required for
#'   verbosity. Defaults to "".
#' @export
#' @examples
#' select_alternative(possible_codons = synonymous_codons, forbidden_codons = c(very_rare_codons, rare_codons), verbose=TRUE, input="CGC")

select_alternative <- function(input = "", possible_codons, forbidden_codons, verbose = FALSE){

  # input codon
  if(exists("input")){
    if(verbose==TRUE){cat(paste0("input codon: ", input, "\n"))}
  }

  # No alternatives? eg. ATG
  if(is.null(possible_codons)){
    if(verbose==TRUE){cat("Error: no possible codons provided.\n")}
    return()
  }
  # All alternatives are rare? eg only AAA alt is rare AAG.
  if(all(as.character(unlist(possible_codons)) %in% forbidden_codons)){
    cat("Error: all possible alternative codons are forbidden.\nReturning original codon: ", input, ".\n")
    unchanged <- tolower(input)
    return(unchanged)
  }
  # Is it a Met/Trp/stop? If so, previous step will have returned identical codon, and that essentially just needs to be returned here
  test <- as.character(unlist(possible_codons))
  unchangedlist <- c("ATG", "TTG", "TAA", "TAG", "TGA")
  if(any(test %in% unchangedlist)){ # added any to counter warning: In if (test %in% unchangedlist) { : the condition has length > 1 and only the first element will be used
    unchanged <- tolower(input)
    return(unchanged)
  }

  # find new codon
  new_codon <- as.character(unlist(dplyr::sample_n(possible_codons, 1)))
  if(verbose==TRUE){cat(paste0("first try: ", new_codon, "\n"))}

  # repeat until you find a common enough codon
  while(new_codon %in% forbidden_codons){
    new_codon <- as.character(unlist(dplyr::sample_n(possible_codons, 1)))
    # print(new_codon) # checking if while loop is working
    if(verbose==TRUE){cat(paste0("next try: ", new_codon, "\n"))}
  }

  # change selected codon to lower case for clarity
  new_codon <- tolower(new_codon)

  return(new_codon)
}
