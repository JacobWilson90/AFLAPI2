#'League ID
#'
#'Get the ID of a known league.
#'@param leagueCode A short code for a league. Defaults to AFL Men's Premiership.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A numerical value for league ID.
#'@examples
#'getLeagueId('AFL')
#'getLeagueId()
#'@export
getLeagueId <- function(leagueCode='AFL',...){
    cdAPI('leagues',...) %>%
    subset(code==leagueCode) %>%
    select(id) %>%
    pull()
}

#'League Details
#'
#'Get details about a league.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with details about a league and level.
#'\itemize{
#'    \item \code{league.id} A unique numerical identifier of the league.
#'    \item \code{league.name} The name of the league.
#'    \item \code{league.code} A short code representing the name of the league.
#'    \item \code{league.gender} A short code representing The gender of a league. "M" for Men's, "W" for Women's.
#'}
#'@examples
#'getLeague(1)
#'getLeague()
#'@export
getLeague <- function(leagueId=1,...){
    cdAPI(paste('leagues',leagueId,sep='/'),...)
}

#'League Level ID
#'
#'Get the ID of a known level for a league.
#'@param leagueCode A short code for a league. Defaults to AFL Men's Premiership.
#'@param levelCode A short code for a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with a league ID and level ID.
#'\itemize{
#'    \item \code{league.id} A unique numerical identifier of the league.
#'    \item \code{level.id} A unique numerical identifier of the level.
#'}
#'@examples
#'getLeagueLevelId('AFL','SEN')
#'getLeagueLevelId()
#'@export
getLeagueLevelId <- function(leagueCode='AFL',levelCode='SEN',...){
    cdAPI(paste('leagues',getLeagueId(leagueCode),'levels',sep='/'),...) %>%
    subset(levels.code==levelCode) %>%
    select(league.id,levels.id)
}

#'League Level Details
#'
#'Get details about a league and level.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with details about a league and level.
#'\itemize{
#'    \item \code{league.id} A unique numerical identifier of the league.
#'    \item \code{league.name} The name of the league.
#'    \item \code{league.code} A short code representing the name of the league.
#'    \item \code{league.gender} A short code representing The gender of a league. "M" for Men's, "W" for Women's.
#'    \item \code{level.id} A unique numerical identifier of the level.
#'    \item \code{level.name} The name of the level.
#'    \item \code{level.code} A short code representing the name of the level.
#'    \item \code{currentSeason.id} The current season ID.
#'}
#'@examples
#'getLeagueLevel(1,1)
#'getLeagueLevel()
#'@export
getLeagueLevel <- function(leagueId=1,levelId=1,...){
    cdAPI(paste('leagues',leagueId,'levels',levelId,sep='/'),...) %>%
        rename(currentSeason.id = 'currentSeason.seasonId',
               level.id='id',
               level.name='name',
               level.code='code') %>%
        select(league.id,league.name,league.code,league.gender,level.id,level.name,level.code,currentSeason.id)
}

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
    cdAPI(paste('leagues',leagueId,'levels',levelId,sep='/'),...) %>%
    select(currentSeason.seasonId) %>%
    rename(season.id=currentSeason.seasonId) %>%
    select(season.id) %>%
    pull()
}
