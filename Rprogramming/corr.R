source("~/repos/datasciencecoursera/Rprogramming/complete.R")
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  corrs <- c()
  idx <- 1
  
  compData <- complete(directory)
  
  for(i in compData[compData$nobs > threshold,]$id){
    if(i <= 9){
      fileName <- sprintf("%s/00%d.csv", directory,i)
    }else if(i <= 99){
      fileName <- sprintf("%s/0%d.csv", directory,i)
    }else{
      fileName <- sprintf("%s/%d.csv", directory,i)
    }
    data <- read.csv(fileName, header = T)
    data <- data[complete.cases(data),]
    corrs[idx] <- cor(data$sulfate, data$nitrate)
    idx <- idx + 1
  }
  return(corrs)
}