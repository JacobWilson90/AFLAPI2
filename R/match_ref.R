#'Match Details
#'
#'Get details about a match.
#'@param matchId An unique numerical identifier of a match.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
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
#'    \item \code{statistic.update} The last UTC time that a statistic was last updated for a match.
#'}
#'@examples
#'getMatch(216085122)
#'@export
getMatch <- function(matchId,...){
  
  rawResponse <- cdAPIresponse(endpoint = paste('matches',matchId,sep='/'),...)
  
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    
    # Convert response to flat list
    listResponse <- fromJSON(content(rawResponse,'text'),flatten=TRUE)
    
    # Check if any of the elements of listResponse are empty ($periods & $time may be if match not yet started)
    emptyIndexes <- which(lapply(names(listResponse), function(x) purrr::is_empty(listResponse[[x]]))==TRUE)
    
    # If there are some empty indexes, use bridging logic (turning listResponse into DF will ERROR if there are empty elements present)
    if(length(emptyIndexes)>0){
      # Find names of empty elements
      emptyNames <- names(listResponse)[emptyIndexes]
      
      # Build returnData not including empty names
      returnData <- data.frame(listResponse[!names(listResponse) %in% emptyNames])
    } else {
      # Construct as normal & convert list into DF (in getMatch we only return 1 row, so filter down to that here)
      returnData <- data.frame(listResponse)[1,]
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
#'    \item \code{person.id} A unique numerical identifier of a person.
#'    \item \code{person.name} The person's full name.
#'    \item \code{person.firstname} The person's first name.
#'    \item \code{person.surname} The person's surname.
#'    \item \code{person.display} The person's display name, represented as first initial and surname.
#'    \item \code{jumper} The jumper number worn on the players's uniform.
#'    \item \code{selected.id} A numerical identifier of the person's selected position.
#'    \item \code{selected.name} The person's selected position.
#'    \item \code{selected.code} A short code representing the peron's selected position.
#'    \item \code{position.id} A numerical identifier of the person's primary position in that season. (Players only)
#'    \item \code{position.name} The person's primary position in that season. (Players only)
#'    \item \code{position.code} A short code representing the peron's primary position in that season. (Players only)
#'    \item \code{height} The person's height in centimetres. (Players only)
#'    \item \code{weight} The person's weight in kilograms. (Players only)
#'    \item \code{DOB} The person's date of birth (YYYY-MM-DD). (Players only)
#'    \item \code{age} The person's age at the start of the match, to one decimal place. (Players only)
#'}
#'@examples
#'getMatchPersons(216085122)
#'getMatchPersons(216085122,officials=TRUE)
#'@export
getMatchPersons <- function(matchId,officials=FALSE,...){
  
  # Hit API
  rawResponse <- cdAPIresponse(endpoint = paste('matches',matchId,'persons',sep='/'),...)
  
  # If null, return whats returned by rawResponse
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    
    # Convert response to flat list
    listResponse <- fromJSON(content(rawResponse,'text'),flatten=TRUE)
    
    # If user sets officials = TRUE
    if(officials){
      # Check if officials list is empty (will be for AFLW)
      if(is_empty(listResponse$officials)){
        message("\nWarning\n--> No officials information for matchId supplied.")
        returnData <- getMatchPersons_officialsDF
      } else {
        # Convert officials element to DF
        returnData <- data.frame(listResponse$officials)
        
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
      # Convert squads list into DF
      returnData <- data.frame(listResponse$squads)
      
      # Get vector of the missing fields (IF ANY) in the call info
      missing <- c(setdiff(c(getMatchPersons_awayWhitelist,getMatchPersons_homeWhitelist),names(returnData)))
      
      # Add on any of the missing columns in the response 
      returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
      
      # home
      home        <- returnData[,getMatchPersons_homeWhitelist]
      names(home) <- sub("home\\.players\\.|home\\.", "", names(home))
      # away
      away        <- returnData[,getMatchPersons_awayWhitelist]
      names(away) <- sub("away\\.players\\.|away\\.", "", names(away))
      
      # Bind home & away together
      returnData <- bind_rows(home,away)
      
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
#'Get a list of valid metrics for a match.
#'@param matchId An unique numerical identifier of a match.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with a list of metrics for a match.
#'\itemize{
#'    \item \code{match.id} A unique numerical identifier of a match.
#'    \item \code{id} A unique numerical identifier of a metric.
#'    \item \code{name} The metric name (singular).
#'    \item \code{plural} The metric name (plural).
#'    \item \code{code} The metric code (ALL_CAPS format).
#'    \item \code{short} An abbreviated metric name (max 25 characters).
#'    \item \code{level.id} A numerical identifier of the metric level.
#'    \item \code{level.name} The metric level (Squad, Player, or Both).
#'    \item \code{format.id} A numerical identifier of the metric format.
#'    \item \code{format.id} A numerical identifier of the metric format.
#'    \item \code{description} The text description of the metric definition.
#'}
#'@examples
#'getMetrics(216085122)
#'@export
getMetrics <- function(matchId,...){
    cdAPI(paste('matches',matchId,'metrics',sep='/'),...) %>%
        select(match.id='matchId',
               id='metrics.id',
               name='metrics.name',
               plural='metrics.namePlural',
               code='metrics.code',
               short='metrics.nameShort',
               level.id='metrics.levelId',
               level.name='metrics.level',
               format.id='metrics.formatId',
               format.name='metrics.format',
               description='metrics.description'
               )
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
  
  rawResponse <- cdAPIresponse(endpoint = paste('matches',matchId,'venue',sep='/'),...)
  
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    # Convert response to flat list
    listResponse <- fromJSON(content(rawResponse,'text'),flatten=TRUE)
    
    # Convert list into DF
    returnData <- data.frame(listResponse)
    
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
getMatchPeriods <- function(matchId,...){
  period_list <- (cdAPI(paste('matches/',matchId,sep=''),df=FALSE,...) %>% content())$periods
  period_df <- do.call(bind_rows,lapply(period_list,function(x) data.frame(x)))
  if(!'utcPeriodEnd'%in%names(period_df)) period_df <- period_df %>%
    mutate(utcPeriodEnd=NA)
  period_df %>%
    mutate(match.id=matchId) %>%
    select(match.id,period,secs='periodSecs',utcPeriodStart,utcPeriodEnd)
}