#'Season Details
#'
#'Get details about a given season.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with details about the given season.
#'\itemize{
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{competition.id} A unique numerical identifier of a competition, combining League, Level and Season.
#'    \item \code{competition.code} A short code describing the competition.
#'    \item \code{competition.name} The full name of the competition.
#'    \item \code{startDate} The date of the first match of the season 'YYYY-MM-DD'.
#'    \item \code{startYear} The year of the first match of the season.
#'    \item \code{endDate} The date of the final scheduled game of the season 'YYYY-MM-DD'.
#'    \item \code{endYear} The year of the final scheduled game of the season.
#'    \item \code{complete} A count of the complete matches in the season.
#'    \item \code{incomplete} A count of incomplete matches remaining in the season.
#'    \item \code{nextRound} The round number of the next round to start.
#'    \item \code{nextRoundStart} The datetime of the first match of the next round to start, in UTC time.
#'    \item \code{lastRound} The round number of the last round to finish.
#'    \item \code{lastRoundEnd} The datetime of the end of the last match of the last round to finish, in UTC time.
#'    \item \code{firstMatchStart} The datetime of the first match of the season.
#'}
#'@examples
#'getSeason(2022)
#'getSeason()
#'@export
getSeason <- function(seasonId,leagueId=1,levelId=1,...){
  
  # Handle season not being provided
  if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
  
  # Hit API for response
  rawResponse <- cdAPIresponse(endpoint = paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,sep='/'))
  
  # If response from cdAPIresponse is NULKL object, return
  if(is.null(rawResponse)){
    return(NULL)  
  } else {
    
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    
    # Convert list into DF
    returnData <- listResponse %>% as.data.frame() %>% jsonlite::flatten()
    
    # Get vector of the missing fields (IF ANY) in the call info
    missing <- setdiff(getSeasonWhitelist,names(returnData))
    
    # Add on any of the missing columns in the response 
    returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
    
    # Remove Phases Info (H&A / Finals) - Do we want to do this?
    returnData <- returnData[, !(names(returnData) %in% c("phases.id", "phases.name", "phases.code"))]
    
    # Return a single row
    returnData <- unique(returnData)
    
    # Select exposed fields & rename columns
    returnData        <- returnData[, names(getSeasonExposedFields)]
    names(returnData) <- getSeasonExposedFields[names(returnData)]
    
    return(returnData)
    
  }
}

#'Fixture
#'
#'Get the fixture for a given season.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with the fixture for a given season, with one row per match.
#' \itemize{
#'   \item \code{competition.name} The name of the competition.
#'   \item \code{competition.code} A short code describing the competition.
#'   \item \code{competition.id} A unique numerical identifier of the competition.
#'   \item \code{season.id} A numerical identifier of a season.
#'   \item \code{season.start.date} The start date of the season.
#'   \item \code{season.end.date} The end date of the season.
#'   \item \code{round.phaseNumber} The round number of the match within the phase. Starts again from one for finals.
#'   \item \code{phase.name} The name of the phase of the season.
#'   \item \code{phase.code} A short code describing the phase of the season.
#'   \item \code{phase.id} A unique numerical identifier of the phase.
#'   \item \code{round.number} The round number of the match. Continues to count up during finals.
#'   \item \code{round.name} The name of the round.
#'   \item \code{round.code} A short code representing the name of the round.
#'   \item \code{round.id} A unique numerical identifier of the round.
#'   \item \code{venue.name} The name of the match venue.
#'   \item \code{venue.code} A short code to represent the match venue.
#'   \item \code{venue.id} A unique numerical identifier of the match venue.
#'   \item \code{venue.timezone} The time zone of the match venue.
#'   \item \code{match.id} A unique numerical identifier of a match.
#'   \item \code{type.name} A description of the match type.
#'   \item \code{match.type.code} A short code representing the match type.
#'   \item \code{match.type.id} A numerical indicator of the match type.
#'   \item \code{match.order} The order of a match within a round, sorted by start date and time.
#'   \item \code{match.date} The calendar date of the match in local time.
#'   \item \code{match.time} The local start time of the match.
#'   \item \code{match.start} The start time of the match in UTC time.
#'   \item \code{status.name} The match's current status.
#'   \item \code{match.status.code} A short code representing the match's current status.
#'   \item \code{status.id} A numerical identifier of the match's current status.
#'   \item \code{match.status.period} The current period of the match.
#'   \item \code{match.status.period.secs} The number of seconds elapsed in the current period.
#'   \item \code{match.status.period.display} A display string of the current period.
#'   \item \code{match.status.match.display} The match's current status type.
#'   \item \code{home.name} The name of the home squad.
#'   \item \code{home.code} A short code to represent the home squad.
#'   \item \code{home.id} A unique numerical identifier of the home squad.
#'   \item \code{home.goals} The number of goals kicked by the home squad.
#'   \item \code{home.behinds} The number of behinds kicked by the home squad.
#'   \item \code{home.points} The number of points scored by the home squad.
#'   \item \code{away.name} The name of the away squad.
#'   \item \code{away.code} A short code to represent the away squad.
#'   \item \code{away.id} A unique numerical identifier of the away squad.
#'   \item \code{away.goals} The number of goals kicked by the away squad.
#'   \item \code{away.behinds} The number of behinds kicked by the away squad.
#'   \item \code{away.points} The number of points scored by the away squad.
#'   \item \code{winning.squad.id.match} The unique numerical identifier of the winning squad for the match.
#'}
#'@examples
#'getFixture(2022)
#'getFixture()
#'@export
getFixture <- function(seasonId, squadId, leagueId=1, levelId=1,...){
  
  # Handle input params incl. squadId
  seasonId <- if(missing(seasonId)) getCurrentSeason(...) else seasonId
  squadId  <- if(missing(squadId)) NULL else paste("?squadId=", squadId, sep='')             
  
  # Hit API
  rawResponse <- cdAPIresponse(endpoint = paste0(paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'fixture',sep='/'),squadId), ...)
  
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    
    # Convert list into DF
    returnData <- listResponse %>% as.data.frame() %>% jsonlite::flatten()
    
    # Continue to unnest/flatten out fixture fields
    returnData <- returnData %>% 
      tidyr::unnest("phases.rounds") %>% 
      mutate_if(is.list, ~ map(.x, as.data.frame)) %>% 
      tidyr::unnest("matches", names_sep = "." ) %>% 
      jsonlite::flatten()
    
    # Get vector of the missing fields (IF ANY) in the call info
    missing <- setdiff(getFixtureWhitelist,names(returnData))
    
    # Add on any of the missing columns in the response 
    returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
    
    # Select exposed fields (getFixtureExposedFields) & rename columns
    returnData        <- returnData[, getFixtureExposedFields ]
    names(returnData) <- names(getFixtureExposedFields)
    
    return(returnData)
  }
}

#'Ladder
#'
#'Get the ladder for a given season.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param roundNumber An integer indicating the round number you are interested in. Returns the ladder as it stood after that round had completed. Defaults to the current ladder, or end of Home & Away for past seasons.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with the requested ladder, with one row per squad.
#'\itemize{
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{round.number} The round number of the match. Continues to count up during finals.
#'    \item \code{position} The squads ladder position.
#'    \item \code{squad.id} A unique numerical identifier of the squad.
#'    \item \code{squad.name} The name of the squad.
#'    \item \code{squad.code} A short code to represent the squad.
#'    \item \code{ladder.points} The number of ladder points accumulated by the squad.
#'    \item \code{ladder.percentage} The squad's ladder percentage, calculated by points scored divided by points conceded.
#'    \item \code{played} The number of matches played by the squad.
#'    \item \code{win} The number of matches the squad has won.
#'    \item \code{win.pct} The percentage of completed matches the squad has won.
#'    \item \code{draw} The number of matches the squad has drawn.
#'    \item \code{loss} The number of matches the squad has lost.
#'    \item \code{total.for} The total number of points scored by the squad.
#'    \item \code{total.against} The total number of points conceded by the squad.
#'    \item \code{total.margin} The total points differential for the squad.
#'    \item \code{average.for} The average number of points scored by the squad per match.
#'    \item \code{average.against} The average number of points conceded by the squad per match.
#'    \item \code{average.margin} The average points differential for the squad per match.
#'}
#'@examples
#'getLadder(2022)
#'getLadder(2022,4)
#'getLadder()
#'@export
getLadder <- function(seasonId,roundNumber,leagueId=1,levelId=1,...){
  # Handling the default for not passing in a seasonId
  if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
  
  if(is.null(seasonId)){
    return(NULL)
  } else {
    # Handling the default for not passing in a roundNo
    if(missing(roundNumber)) roundNumber <- NULL else roundNumber 
    
    # Hit endpoint
    rawResponse  <- cdAPIresponse(endpoint = paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'ladder',roundNumber,sep = "/"), ...)
    
    if(is.null(rawResponse)){
      return(rawResponse)
    } else {
      
      # Convert response to flat list
      listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
      
      # Convert list into DF
      returnData <- listResponse %>% as.data.frame() %>% jsonlite::flatten()
      
      # Select exposed fields (getLadderExposedFields) & rename columns
      returnData        <- returnData[, getLadderExposedFields]
      names(returnData) <- names(getLadderExposedFields)
      
      return(returnData)
    }
  }
}

#'Squad List
#'
#'Get a list of squads participating in a season.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with a list of squads, with one row per squad.
#'\itemize{
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{squad.name} The name of the squad.
#'    \item \code{squad.code} A short code to represent the squad.
#'    \item \code{squad.id} A unique numerical identifier of the squad.
#'    \item \code{state.name} (when \code{squadId} is provided) The name of the state that the given squad is based.
#'    \item \code{state.code} (when \code{squadId} is provided) A short code representing the state that the given squad is based.
#'    \item \code{state.id} (when \code{squadId} is provided) A unique numerical identifier representing the state that the given squad is based.
#'}
#'@examples
#'getSquads(2022)
#'getSquads()
#'@export
getSquads <- function(seasonId,leagueId=1,levelId=1,squadId,...){
  
  seasonId <- if(missing(seasonId)) getCurrentSeason(...) else seasonId
  squadId  <- if(missing(squadId)) NULL else squadId            
  
  # Hit API
  # rawResponse <- cdAPIresponse(endpoint = paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'squads',squadId,sep='/'), ...)
  rawResponse <- cdAPIresponse(endpoint = paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'squads',squadId,sep='/'))
  
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    
    # Convert list into DF
    returnData <- listResponse %>% as.data.frame() %>% jsonlite::flatten()
    
    # If squadId is passed in, select the _squad exposed fields (which contain state. info) otherwise select the _all exposed fields
    # NOTE: this is API behaviour, state info is in response if calling single squad, but otherwise not
    squadExposedFields <- if(is.null(squadId)) getSquadsExposedFields_all else getSquadsExposedFields_squad
    
    # Select exposed fields (getFixtureExposedFields) & rename columns
    returnData        <- returnData[, squadExposedFields ]
    names(returnData) <- names(squadExposedFields)
    
    return(returnData)
  }
}

#'Squad Details
#'
#'Get details about a squad in a season.
#'@param squadId A unique numerical identifier of a squad.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with details about a squads.
#'\itemize{
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{id} A unique numerical identifier of the squad.
#'    \item \code{name} The name of the squad.
#'    \item \code{code} A short code to represent the squad.
#'    \item \code{state.id} A numerical identifier of a country's state.
#'    \item \code{state.name} The squad's home state.
#'    \item \code{state.code} A short code representing the squad's home state.
#'}
#'@examples
#'getSquad(10,2022)
#'getSquad(20)
#'@export
getSquad <- function(squadId,seasonId,leagueId=1,levelId=1,silenceWarning = FALSE,...){
  
  if(silenceWarning == F) message(paste0("\nWarning Message:\n--> This function has been superseded (will recieve no further development) as of cdAFLAPI v1.5.0\n--> It will be deprecated from all package releases post the end of the 2025 mens AFL season.\n--> Please pass a squadId to getSquads(squadId = [squadId] ) instead.\n\nTo silence this message, pass silenceWarning = TRUE to this function.")); 
  
  if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
  cdAPI(paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'squads',squadId,sep='/'),...) %>%
    select(season.id='seasonId',
           id,name,code,
           state.id='homeState.id',
           state.name='homeState.name',
           state.code='homeState.code')
}

#'Squad Person List
#'
#'Get a list of persons involved in a squad in a season. Currently limited to the playing list.
#'@param squad An identifier of the squad. Accepts a numerical squad ID or a text squad name.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with a list of persons for a squad, with one row per person.
#'\itemize{
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{squad.name} The name of the squad.
#'    \item \code{squad.code} A short code to represent the name of the squad.
#'    \item \code{squad.id} A unique numerical identifier of the squad.
#'    \item \code{fullname} The full name of the person.
#'    \item \code{display} The person's display name, represented as first initial and surname.
#'    \item \code{firstname} The person's first name.
#'    \item \code{surname} The person's surname.
#'    \item \code{id} A unique numerical identifier of a person.
#'    \item \code{jumper.number} The jumper number worn on the players's uniform.
#'    \item \code{position} The person's primary position within a season. The position where a player has spent most time.
#'    \item \code{DOB} The person's date of birth (YYYY-MM-DD).
#'    \item \code{age.season} The person's age in years at the start of the first game of the season, to one decimal place.
#'    \item \code{age.year} The person's age at December 31 of the year in which the season ends, rounded down to a whole year.
#'    \item \code{age.today} The person's age as of the current date, to one decimal place.
#'    \item \code{height} The person's height in centimetres.
#'    \item \code{weight} The person's weight in kilograms.
#'    \item \code{position.long} The full text description of a players primary position within a season. (Eg. \code{'General Defender'})
#'    \item \code{position} The person's primary position within a season in short form text. (Eg. \code{'Gen Def'})
#'    \item \code{position.code} A short code to represent the players primary position within a season. (Eg. \code{'GD'})
#'    \item \code{position.id} A unique numerical identifier to represent the players primary position within a season. 
#'    \item \code{matches.season} The person's number of matches played for the given squad in the given season.id.
#'}
#'@examples
#'getSquadPersons(10,2022)
#'getSquadPersons('Carlton')
#'@export
getSquadPersons <- function(squad,seasonId,leagueId=1,levelId=1,...){
  
  # Handling the default for not passing in a seasonId
  if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
  
  # Handling if user has passed in a squad ID or squad NAME (id is required for the API call)
  if(is.numeric(squad)){
    squadId <- squad
  }else{
    squadId <- getSquads(seasonId,leagueId,levelId,...) %>% subset(squad.name==squad) %>% select(squad.id) %>% pull()
  }
  
  rawResponse  <- cdAPIresponse(endpoint = paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'squads',squadId,'persons',sep='/') )
  
  # Convert response to flat list
  listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
  
  # Convert list into DF
  returnData <- listResponse %>% as.data.frame() %>% jsonlite::flatten()
  
  # Add in weight as NA
  returnData$weight <- NA
  
  # Select exposed fields (getSquadPersonsExposedFields) & rename columns
  returnData        <- returnData[, getSquadPersonsExposedFields]
  names(returnData) <- names(getSquadPersonsExposedFields)
  
  return(returnData)
  
}

#'Squad Person Lists
#'
#'Get a list of persons involved in all squads in a season. Currently limited to the playing list.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with a list of persons for all squads, with one row per person.
#'\itemize{
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{squad.id} A unique numerical identifier of the squad.
#'    \item \code{squad.name} The name of the squad.
#'    \item \code{id} A unique numerical identifier of a person.
#'    \item \code{firstname} The person's first name.
#'    \item \code{surname} The person's surname.
#'    \item \code{name} The person's full name.
#'    \item \code{display} The person's display name, represented as first initial and surname.
#'    \item \code{position} The person's primary position within a season. The position where a player has spent most time.
#'    \item \code{DOB} The person's date of birth (YYYY-MM-DD).
#'    \item \code{age.season} The person's age in years at the start of the first game of the season, to one decimal place.
#'    \item \code{age.year} The person's age at December 31 of the year in which the season ends, rounded down to a whole year.
#'    \item \code{height} The person's height in centimetres.
#'    \item \code{weight} The person's weight in kilograms.
#'}
#'@examples
#'getSquadLists(2022)
#'@export
getSquadLists <- function(seasonId,leagueId=1,levelId=1,...){
  
  # If seasonId not supplied get/set current season as seasonId
  if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
  
  # Hit squads endpoint for list of all squadId's
  squads <- getSquads(seasonId,leagueId,levelId,...) %>% select(squad.id) %>% pull()
  
  # Empty object to bind to
  return <- NULL
  
  # Loop through each squad & bind
  return <- do.call(bind_rows, lapply(squads, function(squad) getSquadPersons(squad, seasonId, leagueId, levelId)))
  
  # output
  return(return %>% arrange(squad.name,name))
  
}






