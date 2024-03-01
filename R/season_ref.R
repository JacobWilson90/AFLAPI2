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
    if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
    temp <- cdAPI(paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,sep='/'),...) %>%
        select(-c(phases.id,phases.name,phases.code)) %>%
        unique()
    if(!'rounds.lastCompleted.number'%in%names(temp)) temp <- temp %>% mutate(rounds.lastCompleted.number=NA_integer_,rounds.lastCompleted.end=NA_character_)
    temp %>%
        select(season.id='id',
               competition.id=competitionId,
               competition.code=competitionCode,
               competition.name=competitionName,
               startDate,startYear,endDate,endYear,
               complete='matches.complete',
               incomplete='matches.incomplete',
               nextRound='rounds.nextScheduled.number',
               nextRoundStart='rounds.nextScheduled.start',
               lastRound='rounds.lastCompleted.number',
               lastRoundEnd='rounds.lastCompleted.end',
               firstMatchStart)
}

#'Fixture
#'
#'Get the fixture for a given season.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
#'@return A data frame with the fixture for a given season, with one row per match.
#'\itemize{
#'    \item \code{competition.code} A short code describing the competition.
#'    \item \code{season.id} A numerical identifier of a season.
#'    \item \code{phase.code} A short code describing the phase of the season.
#'    \item \code{type.id} A numerical indicator of the match type.
#'    \item \code{type.name} A description of the match type.
#'    \item \code{round.number} The round number of the match. Continues to count up during finals.
#'    \item \code{round.phaseNumber} The round number of the match within the phase. Starts again from one for finals.
#'    \item \code{round.code} A short code representing the name of the round.
#'    \item \code{match.id} A unique numerical identifier of a match.
#'    \item \code{match.order} The order of a match within a round, sorted by start date and time.
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
#'    \item \code{status.id} A numerical identifier of the match's current status.
#'    \item \code{status.name} The match's current status.
#'    \item \code{status.type.id} A numerical identifier of the match status type.
#'    \item \code{status.type.name} The match's current status type.
#'    \item \code{home.goals} The number of goals kicked by the home squad.
#'    \item \code{home.behinds} The number of behinds kicked by the home squad.
#'    \item \code{home.points} The number of points scored by the home squad.
#'    \item \code{away.goals} The number of goals kicked by the away squad.
#'    \item \code{away.behinds} The number of behinds kicked by the away squad.
#'    \item \code{away.points} The number of points scored by the away squad.
#'}
#'@examples
#'getFixture(2022)
#'getFixture()
#'@export
getFixture <- function(seasonId,leagueId=1,levelId=1,...){
    if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
    temp <- cdAPI(paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'fixture',sep='/'),...) %>%
        unnest(cols='phases.rounds') %>%
        rename(round.id = 'id',
               round.name = 'name',
               round.code = 'code',
               round.number = 'number',
               round.phaseNumber = 'phaseNumber',
               season.startDate = 'startDate',
               season.startYear = 'startYear',
               season.endDate = 'endDate',
               season.endYear = 'endYear',
               phase.code='phases.code') %>%
        unnest(cols='matches')
    if(!'squads.home.score.goals'%in%names(temp)) temp <- temp %>% 
        mutate(squads.home.score.goals=NA_integer_,
               squads.home.score.behinds=NA_integer_,
               squads.home.score.points=NA_integer_,
               squads.away.score.goals=NA_integer_,
               squads.away.score.behinds=NA_integer_,
               squads.away.score.points=NA_integer_
        )
    temp %>%
        rename(match.id = 'id',
               match.order = 'roundOrder',
               match.start='date.utcMatchStart',
               match.date='date.startDate',
               match.time='date.startTime',
               home.id='squads.home.id',
               home.name='squads.home.name',
               home.code='squads.home.code',
               away.id='squads.away.id',
               away.name='squads.away.name',
               away.code='squads.away.code',
               home.goals='squads.home.score.goals',
               home.behinds='squads.home.score.behinds',
               home.points='squads.home.score.points',
               away.goals='squads.away.score.goals',
               away.behinds='squads.away.score.behinds',
               away.points='squads.away.score.points'
        ) %>%
        select(competition.code='competitionCode',season.id='seasonId',
               phase.code,type.id,type.name,
               round.number,round.phaseNumber,round.code,
               match.id,match.order,match.start,match.date,match.time,
               home.id,home.name,home.code,away.id,away.name,away.code,
               venue.id,venue.name,venue.code,
               status.id,status.name,status.type.id='status.typeId',status.type.name='status.typeName',
               home.goals,home.behinds,home.points,
               away.goals,away.behinds,away.points
        )
}

#'Ladder
#'
#'Get the ladder for a given season.
#'@param seasonId A numerical identifier of a season. If missing, defaults to the current season of the League Level defined by 'leagueId' and 'levelId'.
#'@param roundNumber An integer indicating the round number you are interested in. Returns the ladder as it stood after that round had completed. Defaults to the current ladder, or end of Home & Away for past seasons.
#'@param leagueId A unique numerical identifier of a league. Defaults to AFL Men's Premiership.
#'@param levelId A unique numerical identifier of a level. Defaults to Seniors.
#'@return A data frame with the requested ladder, with one row per squad.
#'@param ... Arguments to be passed to internal functions, such as \code{envir} or \code{version}.
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
  
  # Handling the default for not passing in a roundNo
  if(missing(roundNumber)) roundNumber <- NULL else roundNumber 
  
  # Endpoint string going into cdAFLAPI
  endpoint = paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'ladder',roundNumber,sep = "/")
  
  cdAPI(endpoint = endpoint) %>% 
    select(season.id='seasonId',
           round.number='roundNumber',
           position='squads.position',
           squad.id='squads.id',
           squad.name='squads.name',
           squad.code='squads.code',
           ladder.points='squads.ladderPoints',
           ladder.percentage='squads.ladderPoints',
           played='squads.matches.played',
           win='squads.matches.win',
           win.pct='squads.matches.winPct',
           draw='squads.matches.draw',
           loss='squads.matches.loss',
           total.for='squads.scores.for',
           total.against='squads.scores.against',
           total.margin='squads.scores.margin',
           average.for='squads.scores.forAverage',
           average.against='squads.scores.againstAverage',
           average.margin='squads.scores.marginAverage'
    )
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
#'    \item \code{id} A unique numerical identifier of the squad.
#'    \item \code{name} The name of the squad.
#'    \item \code{code} A short code to represent the squad.
#'}
#'@examples
#'getSquads(2022)
#'getSquads()
#'@export
getSquads <- function(seasonId,leagueId=1,levelId=1,...){
    if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
    cdAPI(paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'squads',sep='/'),...) %>%
        select(season.id='seasonId',
               id='squads.id',
               name='squads.name',
               code='squads.code')
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
getSquad <- function(squadId,seasonId,leagueId=1,levelId=1,...){
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
#'getSquadPersons(10,2022)
#'getSquadPersons('Carlton')
#'@export
getSquadPersons <- function(squad,seasonId,leagueId=1,levelId=1,...){
  
  # If seasonId not supplied get/set current season as seasonId
  if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
  
  if(is.numeric(squad)){
    squadId <- squad
  }else{
    squadId <- getSquads(seasonId,leagueId,levelId,...) %>% subset(name==squad) %>% select(id) %>% pull()
  }
  
  cdAPI(paste('leagues',leagueId,'levels',levelId,'seasons',seasonId,'squads',squadId,'persons',sep='/'),...) %>%
    mutate(weight = NA) %>% 
    select(seasonId,
           squad.name='name',
           squad.id='id',
           id='players.personId',
           firstname='players.firstname',
           surname='players.surname',
           name='players.fullname',
           display='players.displayName',
           position='players.position.name',
           DOB='players.dateOfBirth',
           age.season='players.ageSeason',
           age.year='players.ageYear',
           height='players.height',
           weight
    )
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
#'getSquadPersons(10,2022)
#'getSquadPersons('Carlton')
#'@export
getSquadLists <- function(seasonId,leagueId=1,levelId=1,...){
  
  # If seasonId not supplied get/set current season as seasonId
  if(missing(seasonId)) seasonId <- getCurrentSeason(leagueId,levelId,...)
  
  # Hit squads endpoint for list of all squadId's
  squads <- getSquads(seasonId,leagueId,levelId,...) %>% select(id) %>% pull()
  
  # Empty object to bind to
  return <- NULL
  
  # Loop through each squad & bind
  for(squad in squads) return <- return %>% bind_rows(getSquadPersons(squad,...))
  
  # output
  return(return %>% arrange(squad.name,name))
  
}
