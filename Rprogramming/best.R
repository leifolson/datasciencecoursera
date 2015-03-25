best <- function(state, outcome) {
    ## Read outcome data
    outcomeData <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
    ## Check that state and outcome are valid
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    # get minimums
    minVal = min(as.numeric(outcomes[,2]), na.rm = TRUE)  
    mins = outcomes[which(as.numeric(outcomes[,2]) == minVal),1]
    mins = mins[order(mins)]
    return(mins[1])
}