require(stringr)

CTdata <- read.csv("Caltech_2D_Pixelated_designs_Static.csv")

CTdata <- CTdata[,1:7]

colnames(CTdata) <- c("Geometry","C11","C12","C22","C16","C26","C66")

CTdata$n1 <- str_count(CTdata[,1],"1")

CTdata$norm_density <- (15-CTdata$n1)/15

for(i in 1:nrow(CTdata)) {
  if(CTdata$norm_density[i] >= 0.8) CTdata$Label[i] <- "A"
  else if(CTdata$norm_density[i] >= 0.6) CTdata$Label[i] <- "B"
  else if(CTdata$norm_density[i] >= 0.4) CTdata$Label[i] <- "C"
  else if(CTdata$norm_density[i] >= 0.2) CTdata$Label[i] <- "D"
  else CTdata$Label[i] <- "E"
}

finalData <- CTdata[,c(2:7,9:10)]

write.csv(finalData, file = "CTdata_tidied.csv")

