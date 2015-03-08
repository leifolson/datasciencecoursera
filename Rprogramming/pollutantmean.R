# returns the mean value of a pollutant across a series of monitors
pollutantmean <- function(directory, pollutant, id = 1:332){
  # directory => directory location of monitor csv files
  # pollutant => "sulfate" or "nitrate"
  # id        => monitor ids to examine
  nSamps <- 0
  total <- 0
  for(i in id){
    if(i <= 9){
      fileName <- sprintf("%s/00%d.csv", directory,i)
    }else if(i <= 99){
      fileName <- sprintf("%s/0%d.csv", directory,i)
    }else{
      fileName <- sprintf("%s/%d.csv", directory,i)
    }
    data <- read.csv(fileName,header=T)
    nSamps <- nSamps + sum(!is.na(data[[pollutant]]))
    total <- total + sum(data[[pollutant]],na.rm = TRUE)
  }
  return(total/ nSamps)
}