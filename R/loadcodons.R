#' loadveryrarecodons
#'
#' Loads a list of very rare codons (in E. coli K12). Doesn't include stop
#' codons. From
#' http://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=83333.
#'
#' @export
#' @examples
#' very_rare_codons <- loadveryrarecodons()

loadveryrarecodons <- function(){
  # very rare = less than 5/1000 (ignored stops).
  very_rare_codons <- c("CTA", # Leu
                        "ATA", # Ile
                        "CCC", # Pro
                        "TGT", # Cys
                        "CGA", "CGG", "AGA", "AGG" # the Args
  )
  return(very_rare_codons)
}

#' loadrarecodons
#'
#' Loads a list of rare codons (in E. coli K12). Doesn't
#' include stop codons. From
#' http://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=83333.
#'
#' @export
#' @examples
#' rare_codons <- loadrarecodons()

loadrarecodons <- function(){
  # rare = 5-10 / 1000 codons
  rare_codons <- c("TCT", "TCC", "TCA", "AGT", # Ser
                   "CCT", # Pro
                   "ACT", "ACA", # Thr
                   "TAC", # Tyr
                   "CAT", "CAC", # His
                   "AAG", # Lys
                   "TGC", # Cys
                   "GGA" # Gly
  )
  return(rare_codons)
}

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

