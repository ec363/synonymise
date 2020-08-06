#' loadveryrarecodons_B
#'
#' Loads a list of very rare codons (in E. coli B strain). Doesn't include stop
#' codons. From
#' https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=413997.
#'
#' @export
#' @examples
#' very_rare_codons_B <- loadveryrarecodons_B()

loadveryrarecodons_B <- function(){
  # very rare = less than 5/1000 (ignored stops).
  very_rare_codons <- c("CTA", # Leu
                        "ATA", # Ile
                        "CCC", # Pro
                        "TGT", # Cys
                        "CGA", "CGG", "AGA", "AGG" # the Args
  )
  
  # Note to self: 
  # Codons that are Very Rare in B but not K12:
  # "CTA", # Leu
  # "CCC", # Pro
  # "TGT", # Cys
  # Codons that are Very Rare in K12 but not B:
  # None.
  
  return(very_rare_codons)
}

#' loadrarecodons_B
#'
#' Loads a list of rare codons (in E. coli B strain). From
#' https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=413997.
#'
#' @export
#' @examples
#' rare_codons_B <- loadrarecodons_B()

loadrarecodons_B <- function(){
  # rare = 5-10 / 1000 codons
  rare_codons <- c("TCT", "TCC", "TCA", "AGT", # Ser
                   "CCT", "CCA", # Pro
                   "ACT", "ACA", # Thr
                   "TAC", # Tyr
                   "CAT", "CAC", # His
                   "AAG", # Lys
                   "TGC", # Cys
                   "GGA" # Gly
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

