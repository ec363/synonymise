#' synonymise
#'
#' Using an input coding sequence (cds), make synonymous replacements codons in
#' the CDS at a selected frequency and excluding certain sets of codons. Unlike
#' other tools, this function (a) doesn't replace stop codons or treat them as
#' rare, (b) rare codons can be excluded but this is optional and can be
#' specified manually, (c) the replacement codon is randomised so that you don't
#' just end up using same codon for each (eg.) Alanine, (d) the frequency of
#' changes can be specified such that not every codon is changed. Codons
#' requiring replacement but that do not have a synonymous alternative, or any
#' non-forbidden alternatives will return the original codon silently. All
#' changed codons are returned in lower case, allowing inspection. Verbose
#' option helps to follow the function as it is working. Some more specifics:
#' The frequency parameter allows you to specify how often to edit a codon:
#' every codon = 1, every 3 codons = 3. It is specified by the term
#' index%%frequency == 0, ie. for frequency of 3, it will start editing on codon
#' 3 (then every 3rd codon after). The displacement parameter allows you to
#' start editing on a codon other than the one provided by the frequency value
#' alone, that is, when frequency = 3 and displacement = 0, the first edited
#' codon will be the third codon. To start at codon 1 instead, then codon 4,
#' etc, use frequency = 3, displacement = 1, which gets the index of the first
#' codon to 0 (so index%%frequency will be 0).
#'
#' @param cds input coding sequence as a string. Must be in frame!
#' @param codon_table dataframe object to be used as lookup table. Defaults to
#'   object named codon_table.
#' @param forbidden_codons dataframe of codons to exclude, such as rare codons. Defaults to very_rare_codons + rare_codons.
#' @param frequency integer. How often to make a replacement? Defaults to 1, meaning every codon is replaced.
#' @param displacement integer. Which codon to be the first to be replaced? Defaults to 0, meaning the first codon.
#' @param verbose_synonymise logical. Defaults to TRUE.
#' @export
#' @examples
#' myCDS <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 2, displacement = 1)

# library(magrittr)

synonymise <- function(cds, codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), 
                       frequency = 1, displacement = 0, verbose_synonymise = TRUE){
  
  # break into codons
  triplets <- regmatches(cds, gregexpr(".{3}", cds))[[1]]
  triplets
  ### nb. there are many other methods! https://stackoverflow.com/questions/11619616/how-to-split-a-string-into-substrings-of-a-given-length

  # capitalise
  TRIPLETS <- toupper(triplets)
  TRIPLETS

  # create object for adding new codons into
  newcds_parts <- c()

  # for every nth codon, make a replacement (n = frequency):
  # ( calculate index, then use if index %%(frequency)=0 (when divided by (frequency) it gives 0 remainder) )
  for(currentcodon in TRIPLETS){

    # Find index: which nth element is this?
    index <- which(TRIPLETS == currentcodon)[[1]] - displacement

    if (index%%frequency == 0) {

      # edit codons:
      synonymous_codons <- find_synonymous_codons(selectedcodon = currentcodon,
                                                   codon_table = codon_table,
                                                   returndf = TRUE,
                                                   verbose = verbose_synonymise)
      if(verbose_synonymise==TRUE){ print(synonymous_codons) }
      selectedcodon <- select_alternative(input = currentcodon,
                                          possible_codons = synonymous_codons, forbidden_codons = forbidden_codons,
                                          verbose = verbose_synonymise)
      # if(verbose_synonymise==TRUE){ print(selectedcodon) } # This is redundant under all conditions!

      newcds_parts <- c(newcds_parts, selectedcodon)

    } else {

      # don't edit codons
      if(verbose_synonymise==TRUE){cat(paste0("\nSelected codon: ", currentcodon, ".\n"))}
      if(verbose_synonymise==TRUE){cat(paste0("Not to be altered. \n"))}

      unchangedcodon <- currentcodon
      newcds_parts <- c(newcds_parts, unchangedcodon)
    }
  }

  # paste together
  newcds <- ""
  for(i in 1:length(newcds_parts)){
    newcds <- paste0(newcds, newcds_parts[i])
  }
  # newcds

  return(newcds)

}
