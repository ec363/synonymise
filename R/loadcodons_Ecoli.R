#' loadveryrarecodons_Ecoli
#'
#' Loads a list of very rare codons (in either E. coli K12/B strain). Doesn't include stop
#' codons.
#'
#' @export
#' @examples
#' very_rare_codons_Ecoli <- loadveryrarecodons_Ecoli()

loadveryrarecodons_Ecoli <- function(){
  # very rare = less than 5/1000 (ignored stops).
  # loadveryrarecodons_Ecoli is equivalent to loadveryrarecodons_B.
  very_rare_codons <- c("CTA", # Leu
                        "ATA", # Ile
                        "CCC", # Pro
                        "TGT", # Cys
                        "CGA", "CGG", "AGA", "AGG" # the Args
  )

  # Note to self: 
  # Codons that are Very Rare in B but not K12:
  # "CTA", # Leu (Rare in K12)
  # "CCC", # Pro (Rare in K12)
  # "TGT", # Cys (Rare in K12)
  # Codons that are Very Rare in K12 but not B:
  # None.
  
  return(very_rare_codons)
}

#' loadrarecodons_Ecoli
#'
#' Loads a list of rare codons (in E. coli K12/B strain).
#'
#' @export
#' @examples
#' rare_codons_Ecoli <- loadrarecodons_Ecoli()

loadrarecodons_Ecoli <- function(){
  # rare = 5-10 / 1000 codons
  
  rare_codons <- c("TCT", "TCC", "TCA", "AGT", # Ser # both
                   "TCG", # Ser # K12 only
                   # "CTA", # Leu # missing out bc it's in loadveryrarecodons_Ecoli
                   "CCT", "CCA", # Pro # both
                   # "CCC", # Pro # missing out bc it's in loadveryrarecodons_Ecoli
                   "ACT", "ACA", # Thr # both
                   
                   "TAC", # Tyr # B only
                   "CAT", "CAC", # His # B only
                   "AAG", # Lys # B only
                   
                   "TGC", # Cys # both
                   # "TGT", # Cys # missing out bc it's in loadveryrarecodons_Ecoli
                   "GGA", # Gly # both
                   "GGG" # Gly # K12 only
  )

  # Note to self: 
  # Codons that are Rare in B but not K12:
  # "TAC", # Tyr (common in K12)
  # "CAT", "CAC", # His (common in K12)
  # "AAG", # Lys (common in K12)
  # Codons that are Rare in K12 but not B:
  # "TCG", # Ser (common in B)
  # "CTA", # Leu (Very Rare in B)
  # "CCC" # Pro (Very Rare in B)
  # "TGT" # Cys (Very Rare in B)
  # "GGG" # Gly (common in B)
  
  return(rare_codons)
}