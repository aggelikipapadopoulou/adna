#ADMIXTURE run & visualization
mycmd <- function(cmd){
  path="/home/aggeliki/bin/"
  system(paste("/bin/bash -c", shQuote(paste(path, cmd, sep=""))))
}

inputFile <- "new225pruned.bed"
K <- 4
adm <- paste("admixture32", inputFile, K)

mycmd(adm)

#visualize admixture .Q output

admout <- "new225pruned.4.Q"  #.Q output file of admixture 
indfile <- "new225.ind"  #populations in the 3rd column
K <- 4
adm <- read.table(admout)
inds <- read.table(indfile)  

admdf <- as.data.frame(adm, inds$V3) #populations as row names

library(RColorBrewer)
colvec <- brewer.pal(K,"Accent")
barplot(t(admdf), ylab = "Ancestry", main = paste("ADMIXTURE K=",K, sep = ""), border = NA, names.arg = row.names(admdf), las=2, cex.names = 0.4, col = colvec)


