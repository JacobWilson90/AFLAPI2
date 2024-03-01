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
#'    \item \code{winner.id} The squad ID of the winning team.
#'    \item \code{result} A text description of the match result.
#'    \item \code{result.code} A short text description of the match result.
#'}
#'@examples
#'getMatch(216085122)
#'@export
getMatch <- function(matchId,...){
    temp <- fromJSON(cdAPI(paste('matches',matchId,sep='/'),...,df=FALSE) %>% content(as='text'),flatten=TRUE)
    temp <- data.frame(temp[!names(temp)%in%c('time','periods')])
    if(!'winningSquadId'%in%names(temp)) temp <- temp %>% mutate(winningSquadId=NA_integer_,,
                                                                 result='',
                                                                 resultCode='')
    if(!'home.score.goals'%in%names(temp)) temp <- temp %>% mutate(home.score.goals=NA_integer_,
                                                                   home.score.behinds=NA_integer_,
                                                                   home.score.points=NA_integer_,
                                                                   away.score.goals=NA_integer_,
                                                                   away.score.behinds=NA_integer_,
                                                                   away.score.points=NA_integer_)
                                                                   
    temp %>%
        select(competition.name='competitionName',
               season.id='seasonId',
               type.id,type.name,type.code,
               round.number='roundNumber',
               round.phaseNumber='phaseRoundNumber',
               match.id='id',
               match.name='name',
               match.code='code',
               match.start='date.utcMatchStart',
               match.date='date.startDate',
               match.time='date.startTime',
               home.id,home.name,home.code,away.id,away.name,away.code,
               venue.id,venue.name,venue.code,venue.timezone='venue.timeZone',
               status.id,status.name,status.type.id='status.typeId',status.type.id.name='status.typeName',
               home.goals='home.score.goals',
               home.behinds='home.score.behinds',
               home.points='home.score.points',
               away.goals='away.score.goals',
               away.behinds='away.score.behinds',
               away.points='away.score.points',
               winner.id='winningSquadId',
               result,result.code='resultCode'
        ) %>% unique()
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
#'    \item \code{jumper} The number worn on the person's uniform.
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
    r <- cdAPI(paste('matches',matchId,'persons',sep='/'),df=FALSE,...) %>%
        content()
    if(length(r$squads$home$players)==0 | length(r$squads$away$players)==0) return(NULL)
    homePlayers <- do.call(rbind,lapply(r$squads$home$players,unlist))
    awayPlayers <- do.call(rbind,lapply(r$squads$away$players,unlist))
    home <- with(r$squads$home,data.frame(match.id=matchId,id,name,code))
    away <- with(r$squads$away,data.frame(match.id=matchId,id,name,code))
    players <- rbind(data.frame(home,homePlayers),data.frame(away,awayPlayers)) %>%
        select(match.id,squad.id='id',squad.name='name',squad.code='code',
               person.id='personId',person.name='fullname',person.firstname='firstname',person.surname='surname',person.display='displayName',
               jumper='jumperNumber',
               selected.id='positions.selected.id',
               selected.name='positions.selected.name',
               selected.code='positions.selected.code',
               position.id='positions.season.id',
               position.name='positions.season.name',
               position.code='positions.season.code',
               height,weight,DOB='dateOfBirth',age='matchAge'

        )
    umpires <- data.frame(match.id=matchId,do.call(rbind,lapply(r$officials,unlist))) %>%
        select(person.id='personId',person.name='fullname',person.display='displayName',
               jumper='jumperNumber',
               selected.id='positions.selected.id',
               selected.name='positions.selected.name',
               selected.code='positions.selected.code'
               )
    if(officials) return(umpires)
    return(players)
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
#'}
#'@examples
#'getVenue(216085122)
#'@export
getVenue <- function(matchId,...){
  
  
  temp <- cdAPI(paste('matches',matchId,'venue',sep='/'),...) 
  
  if(!'location.country.state.id'%in%names(temp)) temp <- temp %>% 
      mutate(location.country.state.id=NA_integer_ , 
             location.country.state.name = NA, 
             location.country.state.code = NA)  
  
        temp %>% select(match.id='matchId',
               id,name,code,
               country.id='location.country.id',
               country.name='location.country.name',
               country.code='location.country.code',
               state.id='location.country.state.id',
               state.name='location.country.state.name',
               state.code='location.country.state.code',
               timezone='location.timezone',
               length='dimensions.length',
               width='dimensions.width'
               )
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