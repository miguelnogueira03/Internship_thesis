#plot PCA in R
#cd /pica/v8/b2016398_nobackup/private/Pilot/PK-1289_170208_PLINK_ICF_PLUS
R
WD<-getwd()
setwd("/Users/miguelnogueira/desktop")
library(calibrate)
##Define these
evec<- read.table("Khwe_Component.tsv", header=TRUE, sep="\t")
eval<- read.table ("pca_results.eigenval")
namer <- "Khwe_Component_PCA2"
nrpc<-10
##Script start
nreval<-nrow(eval)
totalev <-sum(eval)

aa <- array(NA,dim=c(nreval,1))
for (i in 1:nreval) {
  aa[i,1]<-format(round(((eval[i,1]/totalev)*100),3), nsmall = 3)}
pdf (file =paste(namer, "_PCA.pdf", sep=""), width =8, height = 12, pointsize =12)
par(mfrow=c(3,2), oma=c(0,0,4,0), xpd=TRUE)
plot (evec[,6], evec[,7], col = evec$col, pch = evec$Pch, xlab=paste("PC1: ", aa[1,1], "%", sep=""), ylab=paste("PC2: ", aa[2,1], "%", sep=""))
#text(evec[,3], evec[,4], evec[,1], cex = 0.7, col = as.numeric(evec[,1]))
abline(h=0, col="lightgray", lty=5, lwd=0.8); abline(v=0, col="lightgray", lty=5, lwd=0.8)
plot (evec[,8], evec[,9], col = evec$col, pch = evec$Pch, xlab=paste("PC3: ", aa[3,1], "%", sep=""), ylab=paste("PC4: ", aa[4,1], "%", sep=""))
#text(evec[,5], evec[,6], evec[,1], cex = 0.7, col = as.numeric(evec[,1]))
abline(h=0, col="lightgray", lty=5, lwd=0.8); abline(v=0, col="lightgray", lty=5, lwd=0.8)
plot (evec[,10], evec[,11], col = evec$col, pch = evec$Pch, xlab=paste("PC5: ", aa[5,1], "%", sep=""), ylab=paste("PC6: ", aa[6,1], "%", sep=""))
#text(evec[,7], evec[,8], evec[,1], cex = 0.7, col = as.numeric(evec[,1]))
abline(h=0, col="lightgray", lty=5, lwd=0.8); abline(v=0, col="lightgray", lty=5, lwd=0.8)
plot (evec[,12], evec[,13], col = evec$col, pch = evec$Pch, xlab=paste("PC7: ", aa[7,1], "%", sep=""), ylab=paste("PC8: ", aa[8,1], "%", sep=""))
#text(evec[,9], evec[,10], evec[,1], cex = 0.7, col = as.numeric(evec[,1]))
abline(h=0, col="lightgray", lty=5, lwd=0.8); abline(v=0, col="lightgray", lty=5, lwd=0.8)
plot (evec[,14], evec[,15], col = evec$col, pch = evec$Pch, xlab=paste("PC9: ", aa[9,1], "%", sep=""), ylab=paste("PC10: ", aa[10,1], "%", sep=""))
#text(evec[,11], evec[,12], evec[,1], cex = 0.7, col = as.numeric(evec[,1]))
abline(h=0, col="lightgray", lty=5, lwd=0.8); abline(v=0, col="lightgray", lty=5, lwd=0.8)
barplot (as.numeric(aa[,1]), xlab = "PC", ylab = "%Variation explained", axes=TRUE)
title(paste(namer, "PC plot"), outer=TRUE, cex.main = 1)
#legend("topright",inset=c(-0.3, 0),legend=evec[,17],pch=evec[,18], col=evec[,19]) #still need to find a way to plot the legend in separate plot

dev.off()
q()
n

#Legend in separate file (by Berenice)

pdf(file='Africa_Demi_PCA_Legend')
par(xpd=TRUE)
plot(1,1,axes=F,xlab=" ",ylab=" ",col="white")
legend(
  "top",
  c("!XUN","Buga-Khwe","Caprivi-Khwe","Tjwao","/Ani-Khwe","Shua","Kgalagadi","Shambyu","Yeyi","Mbukushu","Tswana","Nguni","Kalanga","Mozambique","Chokwe","Gciriku","Kwangali","Mbunza","Nambya","Nyemba","Shona","Tsixa","?","Nyaneka(A)","Ovimbundu.(A)","!XUN.(A)","BantuKenya","BSA","DAM","Datog","GAN","GUI","HAI","JUN","JUS","KHO","KHW","Masai","NAM","NAR","Oromo","Sandawe","SHU","Somali","TAE","TAN","TAW","TSH"),
  pch=c(2,3,4,19,0,18,8,16,22,10,21,14,7,12,5,6,9,11,13,15,17,20,1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25),
  col=c("black","blue","brown","peru","gold","royalblue","deepskyblue","tomato","red4","orangered","midnightblue","violetred","pink","seagreen","darkgreen","darkmagenta","firebrick","orchid","sienna","steelblue","salmon","orange","red","darkorange","mediumpurple","goldenrod","azure","dodgerblue","aquamarine4","mediumseagreen","slateblue","limegreen","coral","mediumorchid","lightcoral","darkslateblue","cadetblue","chartreuse","lightgoldenrod","maroon4","lightpink","darkkhaki","plum","tomato","deeppink","turquoise","mediumvioletred","springgreen","sienna"),
  cex=0.5)
dev.off()