complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  df <- data.frame()
  for(i in id){
    if(i <= 9){
      fileName <- sprintf("%s/00%d.csv", directory,i)
    }else if(i <= 99){
      fileName <- sprintf("%s/0%d.csv", directory,i)
    }else{
      fileName <- sprintf("%s/%d.csv", directory,i)
    }
    data <- read.csv(fileName,header=T)
    nobs = nrow(data[complete.cases(data),])
    df <- rbind(df,data.frame(id=i, nobs = nobs))
  }
  return(df)
  
}