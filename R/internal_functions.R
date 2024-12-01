
# Internal functions used by client-facing cdAFLAPI functions - unecessary to be exposed via documentation. 

#'payloadDefaults (POST Functions Only)
#'
#'This function takes a POST payload as input and will print to the console any parameters of the payload that are missing & signal that defaults for these parameters are being used. For use inside of \code{getPlayerStatsPOST()} & \code{getSquadStatsPOST()} only visable when \code{verbose = TRUE}.
#'@param payload A nested list containing the parcels of data to be returned by the API. See: \code{createPayload()} as a method of simplifying this step.
#'@return A response object from the API call.
#'@examples
#'payloadDefaults(payload = payload)
#'@keywords internal
payloadDefaults <- function(payload) {
  
  payloadList <- payload[[1]]
  
  if(sub("MetricRequests", "", names(payload)) == "player"){
    fieldsToCheck <- c("metricCodes", "team", "periods", "zones")
  } else { 
    fieldsToCheck <- c("metricCodes", "team", "periods", "zones", "context")
  } 
  
  # Check if there are any missing parameters in any of the lists
  anyMissing <- any(sapply(payloadList, function(metricRequest) {
    any(sapply(fieldsToCheck, function(field) {
      isMissing <- !field %in% names(metricRequest) ||
        (is.character(metricRequest[[field]]) && (grepl("^#", metricRequest[[field]]) || metricRequest[[field]] == "")) ||
        (is.list(metricRequest[[field]]) && length(metricRequest[[field]]) == 0)
      return(isMissing)
    }))
  }))
  
  if (!anyMissing) {
    return(message("All payload parameters supplied\n--> No defaults required."))
  }
  
  message("Incomplete Payload\n--> Using defaults for parameters not supplied in the following")
  
  for (i in seq_along(payloadList)) {
    
    metricRequest <- payloadList[[i]]
    missingFields <- character(0)
    
    for (field in fieldsToCheck) {
      if (!field %in% names(metricRequest)) {
        missingFields <- c(missingFields, field)
      } else if (is.character(metricRequest[[field]]) && (grepl("^#", metricRequest[[field]]) || metricRequest[[field]] == "")) {
        missingFields <- c(missingFields, field)
      } else if (is.list(metricRequest[[field]]) && length(metricRequest[[field]]) == 0) {
        missingFields <- c(missingFields, field)
      }
    }
    
    # Print the result with ID in brackets if available
    if (length(missingFields) > 0) {
      message(paste0("payload id: '", metricRequest$id, "' [", paste(sQuote(missingFields), collapse = ", ")," using defaults]"))
    }
  }
}

#'zoneMapping 
#'
#'This function is used inside of getAFLClubTrxFeed() to correctly assign zones for transactions based on which way a teams kicking for a given quarter (among other inputs).
#'@return A zone string ie. 'D50', 'DM','F50' etc.
#'@keywords internal
zoneMapping <- function(coinTossWinner,direction,squadId,period,zonePhysical) {
  
  isTossWinner       = ifelse(coinTossWinner == squadId,1,0)
  squadOddDirection  = ifelse(isTossWinner == 1, direction, ifelse(direction == 'Left','Right','Left'))
  squadEvenDirection = ifelse(squadOddDirection == 'Left','Right','Left')
  periodDirection    = ifelse(period %in% c(1,3,5), squadOddDirection, squadEvenDirection)
  
  zone_logical = case_when(zonePhysical == 'LM'  & periodDirection == 'Left'  ~ 'AM' ,
                           zonePhysical == 'L50' & periodDirection == 'Left'  ~ 'F50',
                           zonePhysical == 'R50' & periodDirection == 'Left'  ~ 'D50',
                           zonePhysical == 'RM'  & periodDirection == 'Left'  ~ 'DM' ,
                           zonePhysical == 'LM'  & periodDirection == 'Right' ~ 'DM' ,
                           zonePhysical == 'L50' & periodDirection == 'Right' ~ 'D50',
                           zonePhysical == 'R50' & periodDirection == 'Right' ~ 'F50',
                           zonePhysical == 'RM'  & periodDirection == 'Right' ~ 'AM' ,
                           TRUE ~ zonePhysical)
  
  return(zone_logical)
}

#'catchErrorMessage 
#'
#'This function is used inside of getAFLClubTrxFeed() to either return a dataframe if the call passed to it is successful, or capture the error message thrown by the function call if unsuccessful. 
#'@return a dataframe (of class "data.frame") or text string (of class "character")
#'@keywords internal
catchErrorMessage <- function(name, functionCall, matchId, ...){
  tryCatch(
    {do.call(functionCall, c(list(matchId), list(...)))}, # Done like this so we can still pass in '...' params like 'envir'
    
    message = function(m) {
      # Message printout
      msg <- conditionMessage(m)
      # Cut it down to core info
      msg = paste0("Error fetching ",name," ",gsub("Error\\(s\\) \\[Status: ([0-9]+)\\]:\\s*\n-->\\s*(.*)\n", "[Status: \\1 - \\2]", msg))
      return(msg)
    }
  )
}

#'isAFL 
#'
#'This function is used inside of getSquadSummaryFile() & getPlayerSummaryFile() to run a check on if the matchId passed in is an AFL mens match
#'@return a dataframe (of class "data.frame") or text string (of class "character")
#'@keywords internal
isAFL <- function(leagueId){
  if(leagueId != 1){
    return(FALSE)
  }
  return(TRUE)
}