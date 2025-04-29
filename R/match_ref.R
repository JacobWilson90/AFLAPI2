#'Match Details
#'
#'Get details about a match.
#'@param matchId An unique numerical identifier of a match.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@param periods Logical \code{TRUE / FALSE}. Return period-level information? Defaults to FALSE.
#'@return A data frame with details about a match.
#'\itemize{
#'    \item \code{competition.name} The full name of the competition.
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{type.id} A numerical indicator of the match type.
#'    \item \code{type.name} A description of the match type.
#'    \item \code{type.code} A short code describing the match type.
#'    \item \code{round.number} The round number of the match. Continues to count up during finals.
#'    \item \code{round.phaseNumber} The round number of the match within the phase. Starts again from one for finals.
#'    \item \code{match.id} A unique numerical identifier of a match.
#'    \item \code{match.name} The name of the match. Concatenates home and away squad names.
#'    \item \code{match.code} A short code for the name of the match. Concatenates home and away squad codes.
#'    \item \code{match.start} The start time of a match in UTC time.
#'    \item \code{match.date} The calendar date of a match in local time.
#'    \item \code{match.time} The local start time of a match.
#'    \item \code{home.id} A unique numerical identifier of the home squad.
#'    \item \code{home.name} The name of the home squad.
#'    \item \code{home.code} A short code to represent the home squad.
#'    \item \code{away.id} A unique numerical identifier of the away squad.
#'    \item \code{away.name} The name of the away squad.
#'    \item \code{away.code} A short code to represent the away squad.
#'    \item \code{venue.id} A unique numerical identifier of the match venue.
#'    \item \code{venue.name} The name of the match venue.
#'    \item \code{venue.code} A short code to represent the match venue.
#'    \item \code{venue.timezone} The timezone of the venue.
#'    \item \code{match.status.period} The current period of the match (or last period of the match if match complete).
#'    \item \code{match.status.period.secs} The elapsed seconds within the current period.
#'    \item \code{match.status.period.display} A display format of the current period & period seconds (Eg.\code{"Q3 01:28"}).
#'    \item \code{countdown.remaining.secs} The number of remaining seconds in the current period, counting down from 1200.
#'    \item \code{countdown.remaining.time} The remaining time in the current period, formatted as minutes and seconds (Eg.\code{"04:24"})
#'    \item \code{countdown.remaining.display} A display format of current period & remaining time (Eg.\code{"Q3 04:24"})
#'    \item \code{match.status.code} A short code to represent the match's current status.
#'    \item \code{match.status.name} The match's current status.
#'    \item \code{match.status.id} A numerical identifier of the match's current status.
#'    \item \code{match.status.type.id} A numerical identifier of the match status type.
#'    \item \code{match.status.type.name} The match's current status type.
#'    \item \code{home.goals} The number of goals kicked by the home squad.
#'    \item \code{home.behinds} The number of behinds kicked by the home squad.
#'    \item \code{home.points} The number of points scored by the home squad.
#'    \item \code{away.goals} The number of goals kicked by the away squad.
#'    \item \code{away.behinds} The number of behinds kicked by the away squad.
#'    \item \code{away.points} The number of points scored by the away squad.
#'    \item \code{winner.id} The squad ID of the winning team.
#'    \item \code{result} A text description of the match result.
#'    \item \code{result.code} A short text description of the match result.
#'    \item \code{coin.toss.winning.squad.id} The squad id of the squad who won the coin toss.
#'    \item \code{coin.toss.direction.decision} The direction the squad who won the coin toss decided to kick to.
#'    \item \code{attendance} The crowd attendance for the given match.
#'    \item \code{match.start.scheduled} The scheduled start time for the match in UTC.
#'    \item \code{match.start.actual} The actual start time for the match in UTC.
#'    \item \code{match.end.actual} The actual end time for the match in UTC.
#'    \item \code{match.total.period.secs} The total duration of the match in seconds (Eg.\code{7149})
#'    \item \code{match.total.duration} The total duration of the match in display format (Eg.\code{119:09})
#'    \item \code{statistic.update} The last UTC time that a statistic was last updated for a match.
#'}
#'@examples
#'getMatch(216085122)
#'@export
getMatch <- function(matchId, periods = FALSE, ...){
  
  # Hit endpoint for response
  rawResponse <- cdAPIresponse(endpoint = paste('matches',matchId,sep='/'),...)
  
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    
    # Check if any of the elements of listResponse are empty ($periods & $time may be if match not yet started)
    emptyIndexes <- which(lapply(names(listResponse), function(x) purrr::is_empty(listResponse[[x]]))==TRUE)
    
    #################################
    # PERIODS INFO (periods = TRUE) #
    #################################
    
    # If periods element is not empty and periods == TRUE
    if(periods && "periods" %in% names(listResponse)[emptyIndexes]){
      
      returnData        <- data.frame(matrix(ncol = length(getMatch_PeriodsExposedFields), nrow = 0))
      names(returnData) <- names(getMatch_PeriodsExposedFields)
      message(paste0("\nWarning:\n--> 0 rows of data in response."))
      
      return(returnData)
      
    } else if(periods & !"periods" %in% names(listResponse)[emptyIndexes]){
      
      # extract periods list element
      returnData <- listResponse$periods %>% as.data.frame() %>% jsonlite::flatten() 
      
      # Get vector of the missing fields (IF ANY) in the periods call info
      missing <- setdiff(getMatch_PeriodsWhitelist,names(returnData))
      
      # Add on any of the missing columns in the response 
      returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
      
      # Add match.id
      returnData$match.id <- listResponse$id
      
      # Select exposed fields (getMatch_PeriodsExposedFields) & rename columns
      returnData        <- returnData[, getMatch_PeriodsExposedFields]
      names(returnData) <- names(getMatch_PeriodsExposedFields)
      
      return(returnData)
      
    }
    
    ################################
    # MATCH INFO (periods = FALSE) #
    ################################
    
    # If there are some empty indexes, use bridging logic (turning listResponse into DF will ERROR if there are empty elements present)
    if(length(emptyIndexes)>0){
      # Find names of empty elements
      emptyNames <- names(listResponse)[emptyIndexes]
      
      # Build returnData not including empty names
      returnData <- data.frame(listResponse[!names(listResponse) %in% emptyNames])
    } else {
      # Construct as normal & convert list into DF (in getMatch we only return 1 row, so filter down to that here)
      returnData <- listResponse %>% as.data.frame() %>% jsonlite::flatten() %>% slice(1)
    }
  }
  
  # Get vector of the missing fields (IF ANY) in the call info
  # AND combine them with any of the emptyNames from above (where the fields exist but they are empty)
  missing <- c(setdiff(getMatchWhitelist,names(returnData)), base::get0("emptyNames", ifnotfound = NULL))
  
  # Add on any of the missing columns in the response 
  returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
  
  # Select exposed fields (getMatchExposedFields) & rename columns
  returnData   <- returnData[, getMatchExposedFields]
  names(returnData) <- names(getMatchExposedFields)
  
  return(returnData)
}

#'Match Persons
#'
#'Get a list of persons involved in a match. Currently limited to the players or field umpires.
#'@param matchId An unique numerical identifier of a match.
#'@param officials Logical. Return match officials? Defaults to FALSE = Return players.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with a list of persons for a match, with one row per person.
#'\itemize{
#'    \item \code{match.id} A unique numerical identifier of the match.
#'    \item \code{squad.id} A unique numerical identifier of the squad. (Players only)
#'    \item \code{squad.name} The name of the squad. (Players only)
#'    \item \code{squad.code} A short code to represent the squad. (Players only)
#'    \item \code{person.id} A unique numerical identifier of a player.
#'    \item \code{person.name} The player's full name.
#'    \item \code{person.firstname} The player's first name.
#'    \item \code{person.surname} The player's surname.
#'    \item \code{person.display} The player's display name, represented as first initial and surname.
#'    \item \code{jumper} The jumper number worn on the players's uniform.
#'    \item \code{selected.id} A numerical identifier of the player's selected position.
#'    \item \code{selected.name} The player's selected position.
#'    \item \code{selected.code} A short code representing the player's selected position.
#'    \item \code{position.id} A numerical identifier of the player's primary position in that season. (Players only)
#'    \item \code{position.name} The player's primary position in that season. (Players only)
#'    \item \code{position.code} A short code representing the peron's primary position in that season. (Players only)
#'    \item \code{height} The player's height in centimetres. (Players only)
#'    \item \code{weight} The player's weight in kilograms. (Players only)
#'    \item \code{DOB} The player's date of birth (YYYY-MM-DD). (Players only)
#'    \item \code{age} The player's age at the start of the match, to one decimal place. (Players only)
#'}
#'@examples
#'getMatchPersons(216085122)
#'getMatchPersons(216085122,officials=TRUE)
#'@export
getMatchPersons <- function(matchId,officials=FALSE,...){
  
  # Hit endpoint for response
  rawResponse <- cdAPIresponse(endpoint = paste('matches',matchId,'persons',sep='/'),...)
  
  # If null, return whats returned by rawResponse
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    
    # If user sets officials = TRUE
    if(officials){
      # Check if officials list is empty (will be for AFLW)
      if(is_empty(listResponse$officials)){
        message("\nWarning:\n--> No officials information for matchId supplied.")
        returnData <- getMatchPersons_officialsDF
      } else {
        # Convert officials element to DF
        returnData <- listResponse$officials %>% as.data.frame() %>% jsonlite::flatten()
        
        # Add match.id
        returnData$match.id <- listResponse$matchId
        
        # Get vector of the missing fields (IF ANY) in the call info
        missing <- c(setdiff(getMatchPersons_officialsWhitelist,names(returnData)))
        
        # Add on any of the missing columns in the response 
        returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
        
        # Select exposed fields (getMatchExposedFields) & rename columns
        returnData        <- returnData[, getMatchPersons_officialsExposedFields]
        names(returnData) <- names(getMatchPersons_officialsExposedFields)
      }
      return(returnData)
      
    } else {
      
      # Extract home/away squads separately then bind
      homeSquadPersons <- jsonlite::flatten(data.frame(listResponse$squads$home))
      awaySquadPersons <- jsonlite::flatten(data.frame(listResponse$squads$away))
      returnData       <- bind_rows(homeSquadPersons, awaySquadPersons)
      
      # Get vector of the missing fields (IF ANY) in the call info
      missing <- setdiff(getMatchPersons_Whitelist,names(returnData))
      
      # Add on any of the missing columns in the response 
      returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
      
      # Add match.id
      returnData$match.id <- listResponse$matchId
      
      # Add empty weight field
      returnData$weight <- NA
      
      # Select exposed fields (getMatchExposedFields) & rename columns
      returnData        <- returnData[, getMatchPersonsExposedFields]
      names(returnData) <- names(getMatchPersonsExposedFields)
    }
    return(returnData)
  }
}

#'Match Metrics
#'
#'Get a dataframe of available metrics for each match
#'@param matchId A unique numerical identifier of a match.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with all of the rotations for a given match. 
#' \itemize{
#'    \item \code{match.id} A unique numerical identifier of a match.
#'    \item \code{metric.level} A numerical identifier of the metric level.
#'    \item \code{metric.level.id} A unique numerical identifier of the metric level.
#'    \item \code{metric.code} A short code representing the metric.
#'    \item \code{metric.name} The metric name (singular).
#'    \item \code{metric.id} A unique numerical identifier of a metric.
#'    \item \code{metric.name.short} An abbreviated metric name (max 25 characters).
#'    \item \code{metric.name.short.code} An abbreviated, capitalised code for the metric name.
#'    \item \code{metric.name.plural} The metric name (plural).
#'    \item \code{metric.name.display} The display version of the metric name in camel case format.
#'    \item \code{metric.description} The text description of the metric definition.
#'    \item \code{metric.format} The format in which the metric is recorded (Eg.\code{'Integer'},\code{'Percentage One Decimal'}
#'    \item \code{metric.format.id} A numerical identifier of the metric format.
#'    \item \code{metric.format.avg} The average format applied to the metric, if applicable.
#'    \item \code{metric.format.avg.id} A numerical identifier of the averages metric format.
#'    \item \code{metric.isTransactional} Indicates whether the metric is recorded at a transactional level \code{TRUE/FALSE}.
#'}
#'@examples
#'getMetrics(216085122)
#'@export
getMetrics <- function(matchId,...){
  
  # Hit endpoint for response
  rawResponse <- cdAPIresponse(matchId, paste('matches',matchId,'metrics',sep='/'), ...) 
  
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    
    if(is_empty(listResponse[[1]])) {
      returnData        <- data.frame(matrix(ncol = length(getMetricsWhitelist), nrow = 0))
      names(returnData) <- getMetricsWhitelist
      message(paste0("\nWarning:\n--> 0 rows of data in response.")) 
    } else {
      # Convert list into DF
      returnData <- listResponse$metrics %>% as.data.frame()
      
      # add in match id
      returnData$match.id <- listResponse$matchId
      
      # Get vector of the missing fields (IF ANY) in the call info
      missing <- setdiff(getMetricsWhitelist,names(returnData))
      
      # Add on any of the missing columns in the response 
      returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
    }
    
    # Select exposed fields (getShotsExposedFields) & rename columns
    returnData        <- returnData[, getMetricsExposedFields]
    names(returnData) <- names(getMetricsExposedFields)
    
    return(returnData)
  }
}

#'Match Venue
#'
#'Get details about the venue for a match.
#'@param matchId An unique numerical identifier of a match.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with details about the match venue.
#'\itemize{
#'    \item \code{match.id} A unique numerical identifier of a match.
#'    \item \code{id} A unique numerical identifier of the match venue.
#'    \item \code{name} The name of the match venue.
#'    \item \code{code} A short code to represent the match venue.
#'    \item \code{country.id} A unique numerical identifier of the country of the venue.
#'    \item \code{country.name} The country of the venue.
#'    \item \code{country.code} A short code representing the country of the venue.
#'    \item \code{state.id} A numerical identifier of a country's state.
#'    \item \code{state.name} The venue's state.
#'    \item \code{state.code} A short code representing the venue's state.
#'    \item \code{timezone} The timezone of the venue.
#'    \item \code{length} The length of the venue in metres.
#'    \item \code{width} The width of the venue in metres.
#'}
#'@examples
#'getVenue(216085122)
#'@export
getVenue <- function(matchId,...){
  # Hit endpoint for response
  rawResponse <- cdAPIresponse(endpoint = paste('matches',matchId,'venue',sep='/'),...)
  
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    
    # Convert list into DF
    returnData <- listResponse %>% as.data.frame() %>% jsonlite::flatten()
    
    # Get vector of the missing fields (IF ANY) in the call info
    missing <- setdiff(getVenueWhitelist,names(returnData))
    
    # Add on any of the missing columns in the response 
    returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
  }
  # Select exposed fields (getVenueExposedFields) & rename columns
  returnData        <- returnData[, getVenueExposedFields]
  names(returnData) <- names(getVenueExposedFields)
  
  return(returnData)
}

#'Match Periods
#'
#'Get details about the periods of a match.
#'@param matchId A unique numerical identifier of a match.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with details about each match period. Only contains periods that have started.
#'\itemize{
#'    \item \code{match.id} A unique numerical identifier of a match.
#'    \item \code{period} The period of the match.
#'    \item \code{secs} The elapsed time in seconds for live periods, or the period length for completed periods.
#'    \item \code{utcPeriodStart} The start time of the period in UTC time.
#'    \item \code{utcPeriodEnd} The end time of the period in UTC time.
#'}
#'@examples
#'getMatchPeriods(216085122)
#'@export
getMatchPeriods <- function(matchId, silenceWarning = FALSE, ...){
  
  if(silenceWarning == F) message(paste0("\nWarning Message:\n--> This function has been superseded (will recieve no further development) as of cdAFLAPI v1.5.0\n--> It will be deprecated from all package releases post the end of the 2025 mens AFL season.\n--> Please use getMatch(periods = TRUE) instead.\n\nTo silence this message, pass silenceWarning = TRUE to this function.")); 
  
  period_list <- (cdAPI(paste('matches/',matchId,sep=''),df=FALSE,...) %>% content())$periods
  period_df <- do.call(bind_rows,lapply(period_list,function(x) data.frame(x)))
  if(!'utcPeriodEnd'%in%names(period_df)) period_df <- period_df %>%
    mutate(utcPeriodEnd=NA)
  period_df %>%
    mutate(match.id=matchId) %>%
    select(match.id,period,secs='periodSecs',utcPeriodStart,utcPeriodEnd)
}