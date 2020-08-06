#' loadveryrarecodons_K12
#'
#' Loads a list of very rare codons (in E. coli K12 strain). Doesn't include stop
#' codons. From
#' https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=83333
#'
#' @export
#' @examples
#' very_rare_codons_K12 <- loadveryrarecodons_K12()

loadveryrarecodons_K12 <- function(){
  # very rare = less than 5/1000 (ignored stops).
  very_rare_codons <- c("ATA", # Ile
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

#' loadrarecodons_K12
#'
#' Loads a list of rare codons (in E. coli K12 strain). From
#' https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=83333
#'
#' @export
#' @examples
#' rare_codons_K12 <- loadrarecodons_K12()

loadrarecodons_K12 <- function(){
  # rare = 5-10 / 1000 codons
  rare_codons <- c("TCT", "TCC", "TCA", "TCG", "AGT", # Ser
                   "CTA", # Leu
                   "CCT", "CCC", "CCA", # Pro
                   "ACT", "ACA", # Thr
                   "TGT", "TGC", # Cys
                   "GGA", "GGG" # Gly
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