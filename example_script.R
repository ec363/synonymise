# Example script ####

# Codon table ####
codon_table <- loadcodontable()

# Rare codon tables ####
very_rare_codons <- loadveryrarecodons()
rare_codons <- loadrarecodons()

# Take CDS as string, select alternative codons for each, and paste as string: ####

new1 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 1, displacement = 0) # every codon
new1
new2 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 2, displacement = 0) # every 2nd codon
new2
new3 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 3, displacement = 0) # starts at 1
new3
new4 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 3, displacement = 1) # starts at 2
new4
