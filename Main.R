#Läser in data från filen som finns i working directoryn. Hela working directoryn synkroniseras till GitHub
sourceData <- read.csv2(file = "dataVT19.csv", header=T, sep = ";")
inputData <- sourceData

#Här tar vi varannan frågas resultat (positiv fråga) minus ett och
#varannan fråga (negativ fråga) fem minus resultat. Enligt specifikationerna för SUS.

inputData$quest1 <- inputData$quest1 -1
inputData$quest2 <- 5 - inputData$quest2
inputData$quest3 <- inputData$quest3 -1
inputData$quest4 <- 5 - inputData$quest4
inputData$quest5 <- inputData$quest5 -1
inputData$quest6 <- 5 - inputData$quest6
inputData$quest7 <- inputData$quest7 -1
inputData$quest8 <- 5 - inputData$quest8
inputData$quest9 <- inputData$quest9 -1
inputData$quest10 <- 5 - inputData$quest10

resultVector <- NULL

#Loopar samtliga rader
for (i in 1:nrow(inputData)) {
  #Adderar ihop alla i-radens kolumers värden * 2.5 (enligt SUS specifikationerna)
  resultVector[i] <- sum(unlist(inputData[i,])) *2.5
}

#Räknar med hjälp av inbyggda funktioner relevant data.
resultMean <- mean(resultVector)
resultMedian <- median(resultVector)
resultSd <- sd(resultVector)
resultMin <- min(resultVector)
resultMax <- max(resultVector)

message("Medeltal: ", resultMean)
message("Median: ", resultMedian)
message("Standardavvikelse: ", resultSd)
message("Minimum: ", resultMin)
message("Maximum: ", resultMax)

#Som bonus: Histogram över resultaten :)
hist(resultVector)