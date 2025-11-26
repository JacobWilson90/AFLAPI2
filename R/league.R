#'Current Season
#'
#'Get current season for a league and level.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A numerical value for season ID.
#'@examples
#'getCurrentSeason(1,1)
#'getCurrentSeason()
#'@export
getCurrentSeason <- function(leagueId=1,levelId=1,...){
  # Get response from API
  rawResponse <- cdAPIresponse(endpoint = paste('leagues',leagueId,'levels',levelId,sep='/'),...)
  
  # If null, return whats returned by rawResponse
  if(is.null(rawResponse)){
    return(rawResponse)
  } else {
    # Convert response to flat list
    listResponse <- rawResponse %>% resp_body_json(simplifyVector = TRUE)
    # Return
    return(listResponse$currentSeason$seasonId)
  }
}

#'League/Level Metadata
#'
#'Get details about all leagues and levels exposed in the Champion Data AFL API.
#'@param leagueId A unique numerical identifier of a league. (ie. \code{leagueId = 3})
#'@param levelId A unique numerical identifier of a level. (ie. \code{level = 1})
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with details about a league and level.
#'\itemize{
#'    \item \code{current.season.id} The season ID of the current season for a particular league.
#'    \item \code{league.name} The name of the league.
#'    \item \code{league.code} A short code representing the name of the league.
#'    \item \code{league.id} A unique numerical identifier of the league.
#'    \item \code{level.name} The name of the level.
#'    \item \code{level.code} A short code representing the name of the level.
#'    \item \code{level.id} A unique numerical identifier of the level.
#'    \item \code{level.classification.id} A unique numerical identifier of the given levels' classification.
#'    \item \code{level.classification.code} A short code representing thegiven levels' classification \code{ie. 'AFLTIER1'}
#'    \item \code{league.gender} A short code representing The gender of a league. "M" for Men's, "W" for Women's.
#'    \item \code{competition.id} The competition ID for the particular league/level.
#'    \item \code{championship.id} The championship ID for the particular league/level.
#'}
#'@examples
#'getLeagueInfo(leagueId = 12)
#'@export
getLeaguesLevelsInfo <- function(leagueId, levelId,...){
  
  # Only leagueId is passed in with no levelId, gather all levels under that league
  if(!missing(leagueId) && missing(levelId)){
    # Fetch all levels for the given leagueId passed in
    levels <- fetchLevels(leagueId)
    
    # Collect all the league-level combo's to iterate over from the leagueId passed in
    iter <- levels[,c("league.id","levels.id")]
    
    # Either: NO leagueId or levelId passed in, gather all league-level combos  
    #         NO leagueId passed in, but there is a levelId - filter down all leagues to just the levels we want    
  } else if(missing(leagueId)){
    # Get all leagues
    leagues <- fetchAllLeagues()
    
    # Get all levels within each league
    levels <- purrr::map_dfr(leagues$id, fetchLevels)
    
    # Filter down for the leagues requested if leagueId passed in
    if(!missing(levelId)){
      levels <- levels[levels$levels.id %in% levelId,,drop = F]
    }
    
    # League-level combos to iterate over
    iter <- levels[,c("league.id","levels.id")]
    
    # League & level specifically passed in, iterate over only that combo  
  } else {
    iter <- data.frame("league.id" = leagueId, "levels.id" = levelId)
  }
  
  # Get all combinations of league and level as per 'iter' defined above
  returnData <- purrr::map2_dfr(iter$league.id, iter$levels.id, fetchLeagueLevelCombos)
  
  # Handle if no rows are present at the time of the call based on inputs
  if(nrow(returnData) == 0) {
    message(paste0("\nWarning:\n--> 0 rows of data for the parameters supplied.")) 
    
    # Get vector of the missing fields (IF ANY) in the call info
    missing <- setdiff(getLeagueLevelsInfoWhitelist,names(returnData))
    
    # Add on any of the missing columns in the response 
    returnData[missing] <- lapply(missing, function(x) rep(NA, nrow(returnData)))
  } 
  
  # Select exposed fields (getShotsExposedFields) & rename columns
  returnData        <- returnData[, getLeaguesLevelsInfoExposedFields]
  names(returnData) <- names(getLeaguesLevelsInfoExposedFields)
  
  return(returnData)
  
}

