#' find_synonymous_codons
#'
#' Takes as input a codon and a codon lookup table, find its encoded amino acid,
#' and finds alternative codons for that amino acid and returns them as
#' dataframe (default) or list. Verbose option helps to follow the function as
#' it is working. Is called by synonymise function, but can also be used
#' independently.
#'
#' @param selectedcodon codon as string, eg "AAA", to be used as the starting
#'   codon to find synonyms for.
#' @param codon_table dataframe object to be used as lookup table. Defaults to
#'   object named codon_table.
#' @param returndf logical. Should returned object be a dataframe (or if not,
#'   then list)? Defaults to TRUE.
#' @param verbose logical. Defaults to TRUE.
#' @export
#' @examples
#' synonymous_codons <- find_synonymous_codons(selectedcodon = "CGC", codon_table = codon_table, returndf = TRUE, verbose = FALSE)

# library(magrittr)

find_synonymous_codons <- function(selectedcodon = NULL, codon_table = codon_table,
                                   returndf = TRUE, verbose = TRUE){

  if(verbose == TRUE){cat(paste0("\nSelected codon: ", selectedcodon, ".\n"))}
  if(is.null(selectedcodon)){
    if(verbose == TRUE){cat("Error, please select a codon. \n")}
    return()
  }

  codon_table %>%
    dplyr::filter(codons == selectedcodon) %>%
    dplyr::select(amino_acid_3) %>%
    unlist() %>% # dataframe -> factor
    as.character() -> encodedAA # factor -> character
  encodedAA
  if(verbose == TRUE){cat(paste0("Encoded amino acid is: ", encodedAA, ". \n"))}

  if(encodedAA == "STOP"){
    if(verbose == TRUE){cat(paste0("Error, input codon is a stop codon. \nReturning original stop codon: ", selectedcodon, ".\n"))}
    # Export codon as df to allow select_alternatives to work:
    codon_table %>%
      dplyr::filter(codons == selectedcodon) %>%
      dplyr::select(codons) -> synonyms
    return(synonyms)
  }
  if(encodedAA == "Met" | encodedAA == "Trp"){
    if(verbose == TRUE){cat(paste0("Error, amino acid has no alternative codons (Met/Trp). \nReturning original codon: ", selectedcodon, ".\n"))}
    # Export codon as df to allow select_alternatives to work:
    codon_table %>%
      dplyr::filter(codons == selectedcodon) %>%
      dplyr::select(codons) -> synonyms
    return(synonyms)
  }

  codon_table %>%
    dplyr::filter(amino_acid_3 == encodedAA & codons != selectedcodon) %>%
    dplyr::select(codons) -> synonyms
  synonyms
  if(returndf == TRUE){
    if(verbose == TRUE){
      if(verbose == TRUE){cat(paste0("Alternative codons for ", encodedAA, " (", selectedcodon, "): \n"))}
    }

    return(synonyms)
  } else {
    # return codons as separate char objects:
    synonymlist <- c()
    for(i in 1:nrow(synonyms)){
      synonymlist <- c(synonymlist, as.character(unlist(synonyms[i,]))) # rbind gives matrix, c gives list
    }
    if(verbose == TRUE){
      if(verbose == TRUE){cat(paste0("Alternative codons for ", encodedAA, " (", selectedcodon, "): \n"))}
    }
    return(synonymlist)
  }
}

