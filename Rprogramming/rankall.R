rankall <- function(outcome, num = "best") {
    ## Read outcome data
    outcomeData <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
    ## Check that state and outcome are valid
    states <- unique(outcomeData[,"State"])
    validOutcomes <- c("heart attack","heart failure","pneumonia")
    
    if(!is.element(outcome, validOutcomes)){
        stop("invalid outcome")
    }
    
    # data frame to store results
    df = data.frame()
    
    for(state in states){
        st = sprintf("%s",state)
        result = rankhospitalPrime(state = state, outcome, num, outcomeData)
        df = rbind(df, data.frame(hospital = result, state = state))
    }
    # returned ranked hostpitals ordered by state
    return(df[order(df$state),])
    
}

# used to read in the data only once instead of many times
# but otherwise functions just like rankhospital
rankhospitalPrime <- function(state, outcome, num = "best", outcomeData) {

    validStates <- unique(outcomeData[,"State"])
    validOutcomes <- c("heart attack","heart failure","pneumonia")
    
    if(!is.element(state, validStates)){
        stop("invalid state")
    }
    
    if(!is.element(outcome, validOutcomes)){
        stop("invalid outcome")
    }
    
    # valid state and outcome so get the data
    if(outcome == "heart attack"){
        outcomes = outcomeData[which(outcomeData$State == state), c(2,11)]
    }else if(outcome == "heart failure"){
        outcomes = outcomeData[which(outcomeData$State == state), c(2,17)]
    }else{
        outcomes = outcomeData[which(outcomeData$State == state), c(2,23)]
    }
    
    outcomes = outcomes[which(outcomes[,2] != "Not Available"),]
    outcomes = outcomes[order(as.numeric(outcomes[,2]), outcomes[,1]),]
    #mins = outcomes[order(outcomes)]
    #return(outcomes)
    
    if(num == "best"){
        return(outcomes[1,1])
    }
    if(num == "worst"){
        return(outcomes[nrow(outcomes),1])
    }
    if(num > nrow(outcomes)){
        return(NA)
    }
    return(outcomes[num,1])
}