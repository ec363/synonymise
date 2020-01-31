# synonymise

**What this package does**

Taking an input DNA coding sequence (CDS), make synonymous replacements of the codons in the CDS at a selected frequency and excluding certain sets of codons. This package includes a codon table and a list of very rare (frequency of <5/1000) and rare codons (5-10 /1000). Note that codon usage is species specific though and the provided lists are currently specific to E. coli B strains. Codon usage data is from https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=413997 where data for other species can be found.

**Why would you want to do this?**

Synthetic DNA designs frequently necessitate the use of recurrent sequence motifs, including protein elements such linkers, tags, localisation sequences and reporters. Automated checks by DNA synthesis companies frequently flags initial designs as being too "complex", and such complexity usually results from direct DNA level repeats. While altering DNA and RNA motifs are harder, protein elements may be varied on the DNA level without affecting function. The aim of this package is to provide functions that automate this process to avoid having to do it manually. While similar tools do exist, they are often simplistic or not fit for purpose.

Unlike similar tools, the function in this package:

(a) doesn't replace stop codons or treat them as rare, 
(b) rare codons can be excluded but this is optional and can be specified manually, 
(c) the replacement codon is randomised so that you don't just end up using same codon for each (eg.) Alanine, 
(d) the frequency of changes can be specified such that not every codon is changed. 

Codons requiring replacement but that do not have a synonymous alternative, or any non-forbidden alternatives will return the original codon silently. All changed codons are returned in lower case, allowing inspection. A verbose option helps to follow the function as it is working. 

**Some more specifics:**

The frequency parameter allows you to specify how often to edit a codon: every codon = 1, every 3 codons = 3. It is specified by the term index%%frequency == 0, ie. for frequency of 3, it will start editing on codon 3 (then every 3rd codon after).

The displacement parameter allows you to start editing on a codon other than the one provided by the frequency value alone, that is, when frequency = 3 and displacement = 0, the first edited codon will be the third codon. To start at codon 1 instead, then codon 4, etc, use frequency = 3, displacement = 1, which gets the index of the first codon to 0 (so index%%frequency will be 0).

---

**Example script**

```
# Example script ####

# Codon table ####
codon_table <- loadcodontable()

# Rare codon tables ####
very_rare_codons <- loadveryrarecodons()
rare_codons <- loadrarecodons()

# Take CDS as string, select alternative codons for each, and paste as string ####

new1 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 1, displacement = 0) # every codon
new1
new2 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 2, displacement = 0) # every 2nd codon
new2
new3 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 3, displacement = 0) # starts at 1
new3
new4 <- synonymise(cds = "gggaaaccctag", codon_table = codon_table, forbidden_codons = c(very_rare_codons, rare_codons), frequency = 3, displacement = 1) # starts at 2
new4
```

---
