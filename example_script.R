# Example script ####

library(synonymise)

# Get codon table ####
codon_table <- loadcodontable()

# Get rare codon tables (E coli B) ####
very_rare_codons <- loadveryrarecodons()
rare_codons <- loadrarecodons()

# Take CDS as string, select alternative codons for each, and paste as string: ####
# Note that results may vary due to sampling

# Replace every codon:
new1 <- synonymise(cds = "GGGAAACCCTAG", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 1, displacement = 0)
new1
# example output: ggcaaaccgtag

# Replace every 2nd codon:
new2 <- synonymise(cds = "GGGAAACCCTAG", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 2, displacement = 0)
new2
# example output: GGGaaaCCCtag

# Replace every 3rd codon, starting at codon3:
new3 <- synonymise(cds = "GGGAAACCCTAG", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 3, displacement = 0)
new3
# example output: GGGAAAccaTAG

# Replace every 3rd codon, starting at codon1:
new4 <- synonymise(cds = "GGGAAACCCTAG", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 3, displacement = 1)
new4
# example output: ggtAAACCCtag
