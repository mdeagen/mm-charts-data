require(stringr)

CTdata <- read.csv("Caltech_2D_Pixelated_designs_Static.csv")

CTdata <- CTdata[,1:7]

colnames(CTdata) <- c("Geometry","C11","C12","C22","C16","C26","C66")

CTdata$n1 <- str_count(CTdata[,1],"1")

CTdata$norm_density <- (15-CTdata$n1)/15

write.csv(CTdata, file = "CTdata_tidied.csv")
