####################
   # Variables #
####################

#'userAgentHeader 
#'
#' The user-agent header used in API request(s) to ID the call has come from the R package, alongside which version number.
#'@keywords internal
userAgentHeader <- paste0("RPackage/v",read.dcf(system.file("DESCRIPTION", package = "cdAFLAPI"))[1, "Version"])

#' getSeasonWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getSeason function.
#' @keywords internal
getSeasonWhitelist <- c("phases.id", "phases.name", "phases.code", "competitionCode",
                        "competitionId", "competitionName", "competitionType", "endDate",
                        "endYear", "firstMatchStart", "id", "matches.complete",
                        "matches.incomplete", "rounds.lastCompleted.end", "rounds.lastCompleted.id",
                        "rounds.lastCompleted.phaseId", "rounds.lastCompleted.number",
                        "rounds.lastCompleted.phaseNumber", "rounds.lastCompleted.start",
                        "rounds.nextScheduled.end", "rounds.nextScheduled.id", "rounds.nextScheduled.phaseId",
                        "rounds.nextScheduled.number", "rounds.nextScheduled.phaseNumber", "rounds.nextScheduled.start",
                        "startDate", "startYear"
                        )

#' getSeasonExposedFields
#'
#' This vector contains all the fields we're exposing in the getSeason function and their equivalent renames.
#' @keywords internal
getSeasonExposedFields <- c(id                          = "season.id", 
                            competitionId               = "competition.id",
                            competitionCode             = "competition.code",
                            competitionName             = "competition.name",
                            startDate                   = "startDate",
                            startYear                   = "startYear",
                            firstMatchStart             = "firstMatchStart",
                            endDate                     = "endDate",
                            endYear                     = "endYear",
                            matches.complete            = "complete",
                            matches.incomplete          = "incomplete",
                            rounds.nextScheduled.number = "nextRound",
                            rounds.nextScheduled.start  = "nextRoundStart",
                            rounds.lastCompleted.number = "lastRound",
                            rounds.lastCompleted.end    = "lastRoundEnd"
                            )

#' getShotsWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getShots function.
#' @keywords internal
getShotsWhitelist <- c("matchId", "shots.matchTrxId", "shots.period", "shots.periodSecs", "shots.details.angleGroup",
                       "shots.details.distanceGroup", "shots.details.origin", "shots.details.type", "shots.details.location.x",
                       "shots.details.location.xStd", "shots.details.location.y", "shots.details.location.yStd", "shots.details.locationRotated.x",
                       "shots.details.locationRotated.xStd", "shots.details.locationRotated.y", "shots.details.locationRotated.yStd",
                       "shots.player.displayName", "shots.player.fullname", "shots.player.id", "shots.result.name", "shots.result.code",
                       "shots.result.points", "shots.result.pointsExpected", "shots.result.accuracyExpected", "shots.score.homePoints",
                       "shots.score.awayPoints", "shots.squad.code", "shots.squad.id", "shots.squad.name"
                       )

#' getShotsExposedFields
#'
#' This vector contains all the fields we're exposing in the getShots function and their equivalent renames.
#' @keywords internal
getShotsExposedFields <- c(match.id      = 'matchId',
                           id            = 'shots.matchTrxId',
                           period        = 'shots.period',
                           secs          = 'shots.periodSecs',
                           squad.id      = 'shots.squad.id',
                           squad.name    = 'shots.squad.name',
                           squad.code    = 'shots.squad.code',
                           player.id     = 'shots.player.id',
                           player.name   = 'shots.player.fullname',
                           player.display= 'shots.player.displayName',
                           origin        = 'shots.details.origin',
                           type          = 'shots.details.type',
                           distance      = 'shots.details.distanceGroup',
                           angle         = 'shots.details.angleGroup',
                           x             = 'shots.details.locationRotated.x',
                           y             = 'shots.details.locationRotated.y',
                           x.std         = 'shots.details.locationRotated.xStd',
                           y.std         = 'shots.details.locationRotated.yStd',
                           accuracy.exp  = 'shots.result.accuracyExpected',
                           result        = 'shots.result.code',
                           points.exp    = 'shots.result.pointsExpected',
                           points        = 'shots.result.points'
                           )

#' getChainsWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getChains function.
#' @keywords internal
getChainsWhitelist <- c("matchId", "chains.id", "chains.period", "chains.end.matchTrxId", "chains.end.periodSecs", "chains.end.stateCode",
                        "chains.end.stateId", "chains.end.stateName", "chains.end.stateType", "chains.end.stateTypeCode", "chains.end.x",
                        "chains.end.y", "chains.end.zone", "chains.end.zonePhysical", "chains.end.turnover.creation", "chains.end.turnover.state",
                        "chains.end.turnover.type", "chains.end.turnover.player.displayName", "chains.end.turnover.player.fullname",
                        "chains.end.turnover.player.id", "chains.end.score.matchTrxId", "chains.end.score.player.displayName",
                        "chains.end.score.player.fullname", "chains.end.score.player.id", "chains.end.score.result.name",
                        "chains.end.score.result.code", "chains.end.score.result.points", "chains.keyTransactions.nextChain",
                        "chains.keyTransactions.stoppage", "chains.keyTransactions.clearance", "chains.keyTransactions.inside50",
                        "chains.keyTransactions.prevChain", "chains.keyTransactions.rebound50", "chains.squad.code", "chains.squad.id",
                        "chains.squad.name", "chains.start.matchTrxId", "chains.start.periodSecs", "chains.start.stateCode",
                        "chains.start.stateId", "chains.start.stateName", "chains.start.stateType", "chains.start.stateTypeCode",
                        "chains.start.x", "chains.start.y", "chains.start.zone", "chains.start.zonePhysical",
                        "chains.start.launchPlayer.displayName", "chains.start.launchPlayer.fullname", "chains.start.launchPlayer.id",
                        "chains.metrics.chainMetres", "chains.metrics.chainMetresReply", "chains.metrics.chainMetresNet",
                        "chains.end.turnover.turnoverTrxId"
                        )

#' getChainsExposedFields
#'
#' This vector contains all the fields we're exposing in the getChains function and their equivalent renames.
#' @keywords internal
getChainsExposedFields <- c(match.id                  = "matchId",
                            squad.name                = "chains.squad.name",
                            squad.code                = "chains.squad.code",
                            squad.id                  = "chains.squad.id",
                            period                    = "chains.period",
                            start.id                  = "chains.start.matchTrxId",
                            start.secs                = "chains.start.periodSecs",
                            start.name                = "chains.start.stateName",
                            start.code                = "chains.start.stateCode",
                            start.type                = "chains.start.stateType",
                            start.type.code           = "chains.start.stateTypeCode",
                            start.zone                = "chains.start.zone",
                            start.zone.physical       = "chains.start.zonePhysical",
                            start.x                   = "chains.start.x",
                            start.y                   = "chains.start.y",
                            launch.id                 = "chains.start.launchPlayer.id",
                            launch.name               = "chains.start.launchPlayer.fullname",
                            launch.display            = "chains.start.launchPlayer.displayName",
                            end.id                    = "chains.end.matchTrxId",
                            end.secs                  = "chains.end.periodSecs",
                            end.name                  = "chains.end.stateName",
                            end.code                  = "chains.end.stateCode",
                            end.type                  = "chains.end.stateType",
                            end.type.code             = "chains.end.stateTypeCode",
                            end.zone                  = "chains.end.zone",
                            end.zone.physical         = "chains.end.zonePhysical",
                            end.x                     = "chains.end.x",
                            end.y                     = "chains.end.y",
                            score.id                  = "chains.end.score.matchTrxId",
                            score.result              = "chains.end.score.result.code",
                            score.result.name         = "chains.end.score.result.name",
                            score.points              = "chains.end.score.result.points",
                            score.player.id           = "chains.end.score.player.id",
                            score.player.name         = "chains.end.score.player.fullname",
                            score.player.display      = "chains.end.score.player.displayName",
                            turnover.player.id        = "chains.end.turnover.player.id",
                            turnover.player.name      = "chains.end.turnover.player.fullname",
                            turnover.player.display   = "chains.end.turnover.player.displayName",
                            turnover.type             = "chains.end.turnover.type",
                            turnover.state            = "chains.end.turnover.state",
                            turnover.creation         = "chains.end.turnover.creation",
                            turnover.id               = "chains.end.turnover.turnoverTrxId",
                            clearance.id              = "chains.keyTransactions.clearance",
                            inside50.id               = "chains.keyTransactions.inside50",
                            rebound50.id              = "chains.keyTransactions.rebound50",
                            stoppage.id               = "chains.keyTransactions.stoppage",
                            next.id                   = "chains.keyTransactions.nextChain",
                            previous.id               = "chains.keyTransactions.prevChain",
                            chain.metres.gained       = "chains.metrics.chainMetres",
                            chain.metres.gained.reply = "chains.metrics.chainMetresReply",
                            chain.metres.gained.net   = "chains.metrics.chainMetresNet"
)

#' getEntriesWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getEntries function.
#' @keywords internal
getEntriesWhitelist <- c("matchId", "entries.id", "entries.period", "entries.periodSecs",
                         "entries.player.id", "entries.player.fullname", "entries.player.displayName",
                         "entries.squad.id", "entries.squad.name", "entries.squad.code",
                         "entries.details.type", "entries.details.result.outcome",
                         "entries.details.source.name", "entries.details.source.type",
                         "entries.details.kick.isGround", "entries.details.kick.foot",
                         "entries.details.kick.intent", "entries.details.kick.distance",
                         "entries.details.kick.direction", "entries.details.kick.launchDistanceToGoal",
                         "entries.details.kick.resultDistanceToGoal", "entries.details.kick.pressure.name",
                         "entries.details.kick.pressure.code", "entries.details.kick.pressure.points",
                         "entries.details.kick.launchLocation.x", "entries.details.kick.launchLocation.y",
                         "entries.details.kick.launchLocation.xStd", "entries.details.kick.launchLocation.yStd",
                         "entries.details.kick.launchLocationRotated.x", "entries.details.kick.launchLocationRotated.y",
                         "entries.details.kick.launchLocationRotated.xStd", "entries.details.kick.launchLocationRotated.yStd",
                         "entries.details.kick.resultLocation.x", "entries.details.kick.resultLocation.y",
                         "entries.details.kick.resultLocation.xStd", "entries.details.kick.resultLocation.yStd",
                         "entries.details.kick.resultLocationRotated.x", "entries.details.kick.resultLocationRotated.y",
                         "entries.details.kick.resultLocationRotated.xStd", "entries.details.kick.resultLocationRotated.yStd"
                         )

#' getEntriesExposedFields
#'
#' This vector contains all the fields we're exposing in the getChains function and their equivalent renames.
#' @keywords internal
getEntriesExposedFields <- c(match.id                                 = "matchId",
                             entry.trx.id                             = "entries.id", 
                             entry.period                             = "entries.period", 
                             entry.period.secs                        = "entries.periodSecs",
                             entry.player.id                          = "entries.player.id", 
                             entry.player.fullname                    = "entries.player.fullname", 
                             entry.player.display.name                = "entries.player.displayName",
                             entry.squad.id                           = "entries.squad.id", 
                             entry.squad.name                         = "entries.squad.name", 
                             entry.squad.code                         = "entries.squad.code", 
                             entry.type                               = "entries.details.type", 
                             entry.result.outcome                     = "entries.details.result.outcome",
                             entry.source.name                        = "entries.details.source.name", 
                             entry.source.type                        = "entries.details.source.type", 
                             entry.kick.is.ground                     = "entries.details.kick.isGround", 
                             entry.kick.foot                          = "entries.details.kick.foot",
                             entry.kick.intent                        = "entries.details.kick.intent", 
                             entry.kick.distance                      = "entries.details.kick.distance", 
                             entry.kick.direction                     = "entries.details.kick.direction",
                             entry.kick.launch.distance.to.goal       = "entries.details.kick.launchDistanceToGoal", 
                             entry.kick.result.distance.to.goal       = "entries.details.kick.resultDistanceToGoal",
                             entry.kick.pressure.name                 = "entries.details.kick.pressure.name", 
                             entry.kick.pressure.code                 = "entries.details.kick.pressure.code", 
                             entry.kick.pressure.points               = "entries.details.kick.pressure.points",
                             entry.kick.launch.location.x             = "entries.details.kick.launchLocation.x", 
                             entry.kick.launch.location.y             = "entries.details.kick.launchLocation.y",
                             entry.kick.launch.location.x.std         = "entries.details.kick.launchLocation.xStd", 
                             entry.kick.launch.location.y.std         = "entries.details.kick.launchLocation.yStd",
                             entry.kick.launch.location.rotated.x     = "entries.details.kick.launchLocationRotated.x", 
                             entry.kick.launch.location.rotated.y     = "entries.details.kick.launchLocationRotated.y",
                             entry.kick.launch.location.rotated.x.std = "entries.details.kick.launchLocationRotated.xStd", 
                             entry.kick.launch.location.rotated.y.std = "entries.details.kick.launchLocationRotated.yStd",
                             entry.kick.result.location.x             = "entries.details.kick.resultLocation.x", 
                             entry.kick.result.location.y             = "entries.details.kick.resultLocation.y",
                             entry.kick.result.location.x.std         = "entries.details.kick.resultLocation.xStd", 
                             entry.kick.result.location.y.std         = "entries.details.kick.resultLocation.yStd",
                             entry.kick.result.location.rotated.x     = "entries.details.kick.resultLocationRotated.x", 
                             entry.kick.result.location.rotated.y     = "entries.details.kick.resultLocationRotated.y",
                             entry.kick.result.location.rotated.x.std = "entries.details.kick.resultLocationRotated.xStd", 
                             entry.kick.result.location.rotated.y.std = "entries.details.kick.resultLocationRotated.yStd"
                             )

#' getMatchTransactionsWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getMatchTransactions function.
#' @keywords internal
getMatchTransactionsWhitelist <- c("matchId", "id", "code", "name",
                                  "period","periodSecs", 
                                  "homeScore", "awayScore",
                                  "squad.name", "squad.code", "squad.id",
                                  "person.fullname", "person.displayName", "person.id",
                                  "pressure.squad.name", "pressure.squad.id", "pressure.squad.code", "pressure.name", "pressure.code",
                                  "pressure.points", "pressure.fullname1", "pressure.displayname1", "pressure.personid1", "pressure.role1",
                                  "pressure.fullname2", "pressure.displayname2", "pressure.personid2", "pressure.role2",
                                  "zonePhysical","zoneLogical",
                                  "location.x", "location.y", "location.xStd", "location.yStd", "locationRotated.x",
                                  "locationRotated.y", "locationRotated.xStd", "locationRotated.yStd", "kicking.foot", "kicking.intent",
                                  "kicking.distance", "kicking.direction", "details.inside50Direction", "details.inside50Intent",
                                  "details.shotAngle", "details.shotDistance", "details.shotResult", "details.shotSource", "details.shotType",
                                  "details.freeKickContext", "details.freeKickReason", "details.kickinDirection"
                                  )

#' getMatchTransactionsExposedFields
#'
#' This vector contains all the fields we're exposing in the getMatchTransactions function and their equivalent renames.
#' @keywords internal
getMatchTransactionsExposedFields <- c(match.id            = "matchId",
                                       trx.id              = "id",
                                       stat.code           = "code",
                                       stat.desc           = "name",
                                       period              = "period",
                                       period.secs         = "periodSecs",
                                       score.home          = "homeScore",
                                       score.away          = "awayScore",
                                       squad.name          = "squad.name",
                                       squad.code          = "squad.code",
                                       squad.id            = "squad.id",
                                       person.fullname     = "person.fullname",
                                       person.displayName  = "person.displayName",
                                       person.id           = "person.id",
                                       pressure.squad.name = "pressure.squad.name", 
                                       pressure.squad.id   = "pressure.squad.id",
                                       pressure.squad.code = "pressure.squad.code",
                                       pressure.name       = "pressure.name",
                                       pressure.code       = "pressure.code",
                                       pressure.points     = "pressure.points",
                                       pressure.fullname1  = "pressure.fullname1",
                                       pressure.displayname1 = "pressure.displayname1",
                                       pressure.personid1 = "pressure.personid1",
                                       pressure.role1      = "pressure.role1",
                                       pressure.fullname2  = "pressure.fullname2",
                                       pressure.displayname2 = "pressure.displayname2",
                                       pressure.personid2  = "pressure.personid2",
                                       pressure.role2      = "pressure.role2",
                                       zone.physical       = "zonePhysical",
                                       zone.logical        = "zoneLogical",
                                       location.x          = "location.x",
                                       location.y          = "location.y",
                                       location.x.std      = "location.xStd",
                                       location.y.std      = "location.yStd",
                                       location.rotated.x  = "locationRotated.x",
                                       location.rotated.y  = "locationRotated.y",
                                       location.rotated.x.std = "locationRotated.xStd",
                                       location.rotated.y.std = "locationRotated.yStd",
                                       kicking.foot        = "kicking.foot",
                                       kicking.intent      = "kicking.intent",
                                       kicking.distance    = "kicking.distance",
                                       kicking.direction   = "kicking.direction",
                                       inside50.direction  = "details.inside50Direction",
                                       inside50.intent     = "details.inside50Intent",
                                       shot.angle          = "details.shotAngle",
                                       shot.distance       = "details.shotDistance",
                                       shot.result         = "details.shotResult",
                                       shot.source         = "details.shotSource",
                                       shot.type           = "details.shotType",
                                       freekick.context    = "details.freeKickContext",
                                       freekick.reason     = "details.freeKickReason",
                                       kickin.direction    = "details.kickinDirection"
                                       )

#' getMatchTransactionsPressureCols
#'
#' This vector contains the column names of the pressure columns split out in the getMatchTransactions function.
#' @keywords internal
getMatchTransactionsPressureCols        <- c("pressure.displayname1","pressure.displayname2","pressure.fullname1","pressure.fullname2","pressure.personid1","pressure.personid2","pressure.role1","pressure.role2")
getMatchTransactionsPressureCols1Player <- getMatchTransactionsPressureCols[c(1,3,5,7)] 
getMatchTransactionsPressureCols2Player <- getMatchTransactionsPressureCols[c(2,4,6,8)] 

#' getLadderExposedFields
#'
#' This vector contains all the fields we're exposing in the getLadder function and their equivalent renames.
#' @keywords internal
getLadderExposedFields <- c(season.id         = 'seasonId',
                            round.number      = 'roundNumber',
                            position          = 'squads.position',
                            squad.id          = 'squads.id',
                            squad.name        = 'squads.name',
                            squad.code        = 'squads.code',
                            ladder.points     = 'squads.ladderPoints',
                            ladder.percentage = 'squads.ladderPercentage',
                            played            = 'squads.matches.played',
                            win               = 'squads.matches.win',
                            win.pct           = 'squads.matches.winPct',
                            draw              = 'squads.matches.draw',
                            loss              = 'squads.matches.loss',
                            total.for         = 'squads.scores.for',
                            total.against     = 'squads.scores.against',
                            total.margin      = 'squads.scores.margin',
                            average.for       = 'squads.scores.forAverage',
                            average.against   = 'squads.scores.againstAverage',
                            average.margin    = 'squads.scores.marginAverage'
                            )

#' getPlayerStatsExposedFields
#'
#' This vector contains all the fields we're exposing in the getPlayerStats function and their equivalent renames.
#' @keywords internal
getPlayerStatsExposedFields <- c(match.id      = 'matchId',
                                 squad.id      = 'squads.id',
                                 squad.name    = 'squads.name',
                                 squad.code    = 'squads.code',
                                 player.id     = 'squads.players_personId',
                                 player.name   = 'squads.players_fullname',
                                 player.display= 'squads.players_displayName',
                                 code          = 'squads.players_statistics_code' , 
                                 name          = 'squads.players_statistics_name',
                                 id            = 'squads.players_statistics_id',
                                 plural        = 'squads.players_statistics_namePlural', 
                                 value         = 'squads.players_statistics_value',
                                 display       = 'squads.players_statistics_valueDisplay'
                                 )
#' getPlayerStatsMissingFields
#'
#' This vector contains all the fields that are not present when there is no data to unnest following the tidyr::unnest("squads.players_statistics"...) call in the code. This vector adds the fields listed as columns so the function can return a consistent output.
#' @keywords internal
getPlayerStatsMissingFields <- c('squads.players_statistics_code', 'squads.players_statistics_name', 'squads.players_statistics_id' , 'squads.players_statistics_namePlural', 'squads.players_statistics_value', 'squads.players_statistics_valueDisplay')

#' getSquadStatsExposedFields
#'
#' This vector contains all the fields we're exposing in the getSquadStats function and their equivalent renames.
#' @keywords internal
getSquadStatsExposedFields <- c(match.id      = 'matchId'    ,
                                squad.id      = 'squads.id'  ,
                                squad.name    = 'squads.name',
                                squad.code    = 'squads.code',
                                code          = 'squads.statistics_code' , 
                                name          = 'squads.statistics_name' ,
                                id            = 'squads.statistics_id' ,
                                plural        = 'squads.statistics_namePlural', 
                                value         = 'squads.statistics_value'     ,
                                display       = 'squads.statistics_valueDisplay'
                                )

#' getSquadStatsMissingFields
#'
#' This vector contains all the fields that are not present when there is no data to unnest following the tidyr::unnest("squads.statistics"...) call in the code. This vector adds the fields listed as columns so the function can return a consistent output.
#' @keywords internal
getSquadStatsMissingFields <- c('squads.statistics_code', 'squads.statistics_name', 'squads.statistics_id', 'squads.statistics_namePlural', 'squads.statistics_value', 'squads.statistics_valueDisplay')

#' getRotationsWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getRotations function.
#' @keywords internal
getRotationsWhitelist <- c(
  "match.id"  , 
  "matchTrxId",
  "period",
  "periodSecs",
  "off.reason",
  "off.reasonCode",
  "off.displayName",
  "off.fullname",
  "off.personId",
  "squad.code",
  "squad.id",
  "squad.name",
  "on.displayName",
  "on.fullname",
  "on.personId"
)


#' getRotationsExposedFields
#'
#' This vector contains all the fields we're exposing in the getRotations function and their equivalent renames.
#' @keywords internal
getRotationsExposedFields <- c(
  match.id                  = "match.id"   , 
  squad.name                = "squad.name" ,
  squad.code                = "squad.code" ,
  squad.id                  = "squad.id"   ,
  period                    = "period"     ,     # CHANGE: match.period              = "period"    ,
  secs                      = "periodSecs" ,     # CHANGE: match.period.secs         = "periodSecs",
  id                        = "matchTrxId" ,     # CHANGE: trx.id                    = "matchTrxId" ,
  off.name                  = "off.fullname"   , # CHANGE: off.player.fullname       = "off.fullname"   ,
  off.display               = "off.displayName", # CHANGE: off.display.name          = "off.displayName",
  off.id                    = "off.personId"   , # CHANGE: off.player.id             = "off.personId"   ,
  on.name                   = "on.fullname"    , # CHANGE: on.player.fullname        = "on.fullname"    ,
  on.display                = "on.displayName" , # CHANGE: on.display.name           = "on.displayName" ,
  on.id                     = "on.personId"    , # CHANGE: on.player.id              = "on.personId"    , 
  off.reason                = "off.reason"     , # CHANGE: rotation.off.reason       = "off.reason"     ,
  off.code                  = "off.reasonCode"   # CHANGE: rotation.off.reason.code  = "off.reasonCode"
)

#' getRotations_HomeAwayStintsExposedFields
#'
#' This vector contains all the fields we're exposing in the getRotations function when currentStints = TRUE and their equivalent renames.
#' @keywords internal
getRotations_HomeAwayStintsExposedFields <- c(
  squad.name                      = "squadName",
  squad.code                      = "squadCode",
  squad.id                        = "squadId",
  player.fullname                 = "players.fullname",
  player.display.name             = "players.displayName",
  player.id                       = "players.personId",
  current.stint.period            = "players.currentStint.period",
  current.stint.start.period.secs = "players.currentStint.periodSecs",
  current.stint.elapsed.secs      = "players.currentStint.elapsedSecs",
  current.stint.status            = "players.currentStint.status",
  current.stint.reason            = "players.currentStint.reason",
  current.stint.reason.code       = "players.currentStint.reasonCode"
)

#' getSquadStatsPOSTExposedFields
#'
#' This vector contains all the fields we're exposing in the getSquadStatsPOST function (not including info) and their equivalent renames.
#' @keywords internal
getSquadStatsPOSTExposedFields <- c(match.id      = "matchId", 
                                    squad.name    = "squads_name",
                                    squad.code    = "squads_code",
                                    squad.id      = "squads_id",
                                    stat.code     = "squads_statistics_code",
                                    stat.name     = "squads_statistics_name",
                                    stat.id       = "squads_statistics_id",
                                    stat.plural   = "squads_statistics_namePlural",
                                    value         = "squads_statistics_value", 
                                    display       = "squads_statistics_valueDisplay",
                                    id            = "id"
                                    )

#' getSquadStatsPOST_info_ExposedFields
#'
#' This vector contains all the fields we're exposing in the getPlayerStatsPOST function INFO and their equivalent renames.
#' @keywords internal
getSquadStatsPOST_info_ExposedFields <- c(info.metric.codes = "metricCodes",
                                          info.periods      = "periods", 
                                          info.team         = "team",
                                          info.zones        = "zones",
                                          info.context      = "context",
                                          info.lastXSeconds = "lastXSeconds" , 
                                          id                = "id"
                                          )

#' getSquadStatsPOST_info_Whitelist
#'
#' This vector contains all the possible columns in the info portion of the getSquadStatsPOST() function.
#' @keywords internal
getSquadStatsPOST_info_Whitelist <- c("metricCodes","periods","team","zones","context","lastXSeconds")

#' getPlayerStatsPOSTExposedFields
#'
#' This vector contains all the fields we're exposing in the getPlayerStatsPOST function (not including info) and their equivalent renames.
#' @keywords internal
getPlayerStatsPOSTExposedFields <- c(match.id      = "matchId", 
                                     squad.name    = "squads_name",
                                     squad.code    = "squads_code",
                                     squad.id      = "squads_id",
                                     player.name   = "fullname", 
                                     player.display= "displayName",
                                     player.id     = "personId",
                                     stat.code     = "statistics_code",
                                     stat.name     = "statistics_name",
                                     stat.id       = "statistics_id",
                                     stat.plural   = "statistics_namePlural",
                                     value         = "statistics_value", 
                                     display       = "statistics_valueDisplay",
                                     id            = "id"
                                     )

#' getPlayerStatsPOST_info_ExposedFields
#'
#' This vector contains all the fields we're exposing in the getPlayerStatsPOST function INFO and their equivalent renames.
#' @keywords internal
getPlayerStatsPOST_info_ExposedFields <- c(info.metric.codes = "metricCodes",
                                           info.periods      = "periods", 
                                           info.team         = "team",
                                           info.zones        = "zones",
                                           info.lastXSeconds = "lastXSeconds" , 
                                           id                = "id"
                                           )

#' getPlayerStatsPOST_info_Whitelist
#'
#' This vector contains all the possible columns in the info portion of the getPlayerStatsPOST() function.
#' @keywords internal
getPlayerStatsPOST_info_Whitelist <- c("metricCodes","periods","team","zones","lastXSeconds")

#' #' getLeagueInfo_leagueLevelCombos
#' #'
#' #' This vector contains all the possible combinations of league and level in order to gather all info in getLeagueInfo function.
#' #' @keywords internal
#' # getLeagueInfo_leagueLevelCombos <- expand.grid(leagueId = 1:3, levelId = 1)
#' 
#' #' getLeagueInfoExposedFields
#' #'
#' #' This vector contains all the fields we're exposing in the getLeagueInfoExposedFields function and their equivalent renames.
#' #' @keywords internal
#' getLeagueInfoExposedFields <- c(current.season.id = "currentSeason.seasonId",
#'                                 level.id          = "id",
#'                                 league.id         = "league.id", 
#'                                 level.name        = "name",
#'                                 league.name       = "league.name",
#'                                 level.code        = "code" , 
#'                                 league.code       = "league.code",
#'                                 league.gender     = "league.gender",
#'                                 competition.id    = "currentSeason.competitionId",
#'                                 championship.id   = "currentSeason.championshipId")

#' getMatchWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getMatch function.
#' @keywords internal
getMatchWhitelist <- c(
  'competitionName', 'seasonId', 'type.id', 'type.name', 'type.code',
  'roundNumber', 'phaseRoundNumber', 'id', 'name', 'code',
  'date.utcMatchStart', 'date.startDate', 'date.startTime', 'home.id', 'home.name',
  'home.code', 'away.id', 'away.name', 'away.code', 'venue.id',
  'venue.name', 'venue.code', 'venue.timeZone',
  'status.period', 'status.periodSecs', 'status.periodDisplay',
  'status.id', 'status.name', 'status.name' , 'status.code',
  'status.typeId', 'status.typeName', 'status.remainingSecs', 'status.remainingTime', 'status.remainingDisplay',
  'home.score.goals', 'home.score.behinds', 'home.score.points',
  'away.score.goals', 'away.score.behinds', 'away.score.points', 'winningSquadId', 'result',
  'resultCode', 'coinToss.winningSquadId', 'coinToss.decision', 'attendance' , 'statisticUpdate' , 
  "time.utcMatchStartActual", "time.utcMatchEndActual", "time.periodSecs" , "time.duration"          
)

#' getMatchExposedFields
#'
#' This vector contains all the fields we're exposing in the getMatch function and their equivalent renames.
#' @keywords internal
getMatchExposedFields <- c(
  competition.name             = 'competitionName',
  season.id                    = 'seasonId',
  type.id                      = 'type.id',
  type.name                    = 'type.name',
  type.code                    = 'type.code',
  round.number                 = 'roundNumber',
  round.phaseNumber            = 'phaseRoundNumber',
  match.id                     = 'id',
  match.name                   = 'name',
  match.code                   = 'code',
  match.date                   = 'date.startDate',
  match.time                   = 'date.startTime',
  home.id                      = 'home.id',
  home.name                    = 'home.name',
  home.code                    = 'home.code',
  away.id                      = 'away.id',
  away.name                    = 'away.name',
  away.code                    = 'away.code',
  venue.id                     = 'venue.id',
  venue.name                   = 'venue.name',
  venue.code                   = 'venue.code',
  venue.timezone               = 'venue.timeZone',
  match.status.period          = 'status.period',
  match.status.period.secs     = 'status.periodSecs',
  match.status.period.display  = 'status.periodDisplay',
  match.status.code            = 'status.code',
  match.status.name            = 'status.name', 
  match.status.id              = 'status.id',
  match.status.type.id         = 'status.typeId',
  match.status.type.name       = 'status.typeName',
  countdown.remaining.secs     = 'status.remainingSecs',
  countdown.remaining.time     = 'status.remainingTime',
  countdown.remaining.display  = 'status.remainingDisplay',
  home.goals                   = 'home.score.goals',
  home.behinds                 = 'home.score.behinds',
  home.points                  = 'home.score.points',
  away.goals                   = 'away.score.goals',
  away.behinds                 = 'away.score.behinds',
  away.points                  = 'away.score.points',
  winner.id                    = 'winningSquadId',
  result                       = 'result',
  result.code                  = 'resultCode', 
  coin.toss.winning.squad.id   = 'coinToss.winningSquadId',
  coin.toss.direction.decision = 'coinToss.decision',
  attendance                   = 'attendance',
  match.start.scheduled        = 'date.utcMatchStart',
  match.start.actual           = 'time.utcMatchStartActual',
  match.end.actual             = 'time.utcMatchEndActual',
  match.total.period.secs      = 'time.periodSecs',
  match.total.duration         = 'time.duration' , 
  statistic.update             = 'statisticUpdate' 
)

#' getMatch_PeriodsWhitelist
#'
#' This vector contains all the possible fields in the getMatch function when periods = TRUE
#' @keywords internal
getMatch_PeriodsWhitelist <- c(
  'period', 'utcPeriodStart', 'utcPeriodEnd', 'periodSecs'
)

#' getMatch_PeriodsExposedFields
#'
#' This vector contains all the fields we're exposing in the getMatch function when periods = TRUE and their equivalent renames.
#' @keywords internal
getMatch_PeriodsExposedFields <- c(
  match.id     = 'match.id' , 
  period       = 'period',
  period.secs  = 'periodSecs',
  period.start = 'utcPeriodStart',
  period.end   = 'utcPeriodEnd'
)




#' getTRXfile_chainsFields
#'
#' This vector contains all the fields we're taking when we hit the chains endpoint within the getAFLClubTrxFeed() function and their equivalent renames.
#' @keywords internal
getTRXfile_chainsFields <- c(
  match.id             = 'match.id',
  INITIAL_TRX_ID       = 'start.id',
  FINAL_TRX_ID         = 'end.id',
  CHAIN_SQUAD          = 'squad.name',
  INITIAL_STATE        = 'start.code',
  FINAL_STATE          = 'end.code',
  ZONE_LOGICAL_INITIAL = 'start.zone',
  FINAL_ZONE_LOGICAL   = 'end.zone',
  LAUNCH_PERSON_ID     = 'launch.id',
  LAUNCH_PLAYER        = 'launch.name',
  GUILTY_PERSON_ID     = 'turnover.player.id',
  GUILTY_PLAYER        = 'turnover.player.name'
)

#' getTRXfile_twoPlayerStats
#'
#' This vector contains all the fields we're taking when we pull out the two player stats within the getAFLClubTrxFeed() function and their equivalent renames.
#' @keywords internal
getTRXfile_twoPlayerStats <- c(
  match.id  = "match.id",
  trx.id    = "trx.id", 
  stat.code = "stat.code",
  person.id = "person.id_1",
  AR_ID = "person.id_2", AR = "person.fullname_2",
  H1_ID = "person.id_3", H1 = "person.fullname_3",
  H2_ID = "person.id_5", H2 = "person.fullname_5",
  H3_ID = "person.id_7", H3 = "person.fullname_7",
  A1_ID = "person.id_4", A1 = "person.fullname_4",
  A2_ID = "person.id_6", A2 = "person.fullname_6",
  A3_ID = "person.id_8", A3 = "person.fullname_8"         
)

#' getTRXfileExposedFields
#'
#' This vector contains all the fields we're exposing within the getAFLClubTrxFeed() function and their equivalent renames.
#' @keywords internal
getTRXfileExposedFields <- c(
  MATCH_ID             = 'match.id',
  MATCH_DATE           = 'match.date',
  MATCH_TIME           = 'match.time',
  SEASON_ID            = 'season.id',
  GROUP_ROUND_NO       = 'round.number',
  VENUE_NAME           = 'venue.name',
  HOME_SQUAD           = 'home.name',
  HOME_SCORE           = 'home.points',
  AWAY_SQUAD           = 'away.name',
  AWAY_SCORE           = 'away.points',
  MATCH_TRX_ID         = 'trx.id',
  SEQUENCE             = 'sequence',
  PERIOD               = 'period',
  PERIOD_SECS          = 'period.secs',
  STATISTIC_CODE       = 'stat.code',
  PERSON_ID            = 'person.id',
  FULLNAME             = 'person.fullname',
  SQUAD_NAME           = 'squad.name',
  OPP_SQUAD            = 'opp.squad.name',
  AR_ID                = 'AR_ID',
  AR                   = 'AR',
  H1_ID                = 'H1_ID',
  H1                   = 'H1',
  H2_ID                = 'H2_ID',
  H2                   = 'H2',
  H3_ID                = 'H3_ID',
  H3                   = 'H3',
  A1_ID                = 'A1_ID',
  A1                   = 'A1',
  A2_ID                = 'A2_ID',
  A2                   = 'A2',
  A3_ID                = 'A3_ID',
  A3                   = 'A3',
  ZONE_LOGICAL_AFL     = 'zone.logical',
  ZONE_PHYSICAL_AFL    = 'zone.physical',
  TRUEX                = 'location.x',
  TRUEY                = 'location.y',
  VENUE_LENGTH         = 'length',
  VENUE_WIDTH          = 'width',
  STDX                 = 'location.x.std',
  STDY                 = 'location.y.std',
  XY_FLIP              = 'XY_FLIP',
  INITIAL_TRX_ID       = 'INITIAL_TRX_ID',
  FINAL_TRX_ID         = 'FINAL_TRX_ID',
  CHAIN_SQUAD          = 'CHAIN_SQUAD',
  INITIAL_STATE        = 'INITIAL_STATE',
  FINAL_STATE          = 'FINAL_STATE',
  ZONE_LOGICAL_INITIAL = 'ZONE_LOGICAL_INITIAL',
  FINAL_ZONE_LOGICAL   = 'FINAL_ZONE_LOGICAL',
  LAUNCH_PERSON_ID     = 'LAUNCH_PERSON_ID',
  LAUNCH_PLAYER        = 'LAUNCH_PLAYER',
  GUILTY_PERSON_ID     = 'GUILTY_PERSON_ID',
  GUILTY_PLAYER        = 'GUILTY_PLAYER',
  PARAM1               = 'PARAM1',
  PARAM2               = 'PARAM2',
  PARAM3               = 'PARAM3',
  PARAM4               = 'PARAM4',
  KICK_FOOT            = 'kicking.foot',
  KICK_INTENT          = 'kicking.intent',
  KICK_DISTANCE        = 'kicking.distance',
  KICK_DIRECTION       = 'kicking.direction',
  PRESSURE_LEVEL       = 'pressure.name',
  PRESSURE_PLAYER_ID   = 'pressure.personid1',
  PRESSURE_PLAYER      = 'pressure.fullname1',
  PRESSURE_PLAYER2_ID  = 'pressure.personid2',
  PRESSURE_PLAYER2     = 'pressure.fullname2',
  PRESSURE_POINTS      = 'pressure.points'
)

#' PARAM1_mapping
#'
#' This vector contains all the mappings for the first parameter within the getAFLClubTrxFeed() function and their equivalent renames.
#' @keywords internal
PARAM1_mapping <- c(
  "Holding the Man"            = "HOLDING_THE_MAN",
  "Centre"                     = "CENTRE",
  "General Play"               = "GENERAL_PLAY",
  "Illegal Block"              = "ILLEGAL_BLOCK",
  "Left"                       = "LEFT",
  "Push in Back"               = "PUSH_IN_BACK",
  "Right"                      = "RIGHT",
  "Mark"                       = "MARK",
  "Holding the Ball"           = "HOLDING_THE_BALL",
  "Trip/Slide"                 = "TRIP_SLIDE",
  "High Tackle"                = "HIGH_TACKLE",
  "Free Kick"                  = "FREE",
  "Deliberate Out of Bounds"   = "DELIBERATE_OUT_OF_BOUNDS",
  "Chopping the Arms"          = "CHOPPING_THE_ARMS",
  "Free after Disposal"        = "FREE_AFTER_DISPOSAL",
  "Other"                      = "OTHER_REASON",
  "50m Penalty"                = "PENALTY_50M",
  "Kicking in Danger"          = "KICKING_IN_DANGER",
  "Run too Far"                = "RUN_TOO_FAR",
  "Centre Bounce Infringement" = "CENTRE_BOUNCE_INFRINGEMENT",
  "Throwing the Ball"          = "THROWING_THE_BALL",
  "Gimme"                      = "GIMME",
  "Deliberate Rushed"          = "DELIBERATE_RUSHED",
  "Official in Wrong Place"    = "OFFICIAL_IN_WRONG_PLACE",
  "Interchange Infringement"   = "INTERCHANGE_INFRINGEMENT",
  "Corridor"                   = "CORRIDOR"
  
)

#' PARAM2_mapping
#'
#' This vector contains all the mappings for the second parameter within the getAFLClubTrxFeed() function and their equivalent renames.
#' @keywords internal
PARAM2_mapping <- c(
  "Ruck"                 = "RUCK",
  "Bomb"                 = "BOMB",
  "General Play Snap"    = "SNAP",
  "Go To No Chance"      = "GO_TO_NO_CHANCE",
  "Tackling"             = "TACKLING",
  "Other"                = "OTHER",
  "Go To"                = "GO_TO",
  "Set Shot Regular"     = "SET_SHOT",
  "General"              = "GENERAL",
  "General Play Regular" = "ON_RUN_IN_GENERAL_PLAY",
  "Marking"              = "MARKING",
  "Score"                = "SCORE",
  "Set Shot Snap"        = "DELIBERATE_SNAP",
  "Ground Kick"          = "OFF_GROUND"
)

#' PARAM3_mapping
#'
#' This vector contains all the mappings for the third parameter within the getAFLClubTrxFeed() function and their equivalent renames.
#' @keywords internal
PARAM3_mapping <- c(
  "Left Corridor"  = "ZONE_3",
  "Left Acute"     = "ZONE_4",
  "Right Acute"    = "ZONE_1",
  "Right Boundary" = "BOUNDARY_RIGHT",
  "Right Corridor" = "ZONE_2",
  "In Front"       = "DIRECTLY_IN_FRONT",
  "Left Boundary"  = "BOUNDARY_LEFT"
)

#' PARAM4_mapping
#'
#' This vector contains all the mappings for the fourth parameter within the getAFLClubTrxFeed() function and their equivalent renames.
#' @keywords internal
PARAM4_mapping <- c(
  "15-30m" = "M15_30",
  "30-40m" = "M30_40",
  "50m+"   = "M50_PLUS",
  "40-50m" = "M40_50",
  "0-15m"  = "M0_15"
)

#' twoplayerstats_empty
#'
#' This dataframe contains all the column names and required class types for the two player stats table, we may need to create an empty DF with these names based on if ruck transactions exist or not
#' @keywords internal
twoplayerstats_empty <- data.frame(
  "match.id"  = integer(),
  "trx.id"    = integer(),
  "stat.code" = character(),
  "person.id_1" = integer(),
  "person.id_2" = integer(),
  "person.id_3" = integer(),
  "person.id_4" = integer(),
  "person.id_5" = integer(),
  "person.id_6" = integer(),
  "person.id_7" = integer(),
  "person.id_8" = integer(),
  "person.fullname_1" = character(),
  "person.fullname_2" = character(),
  "person.fullname_3" = character(),
  "person.fullname_4" = character(),
  "person.fullname_5" = character(),
  "person.fullname_6" = character(),
  "person.fullname_7" = character(),
  "person.fullname_8" = character(),
  stringsAsFactors = FALSE
)

#' getVenueWhitelist
#'
#' This vector contains all the possible columns in the getVenue() function.
#' @keywords internal
getVenueWhitelist <- c(
  "code", 
  "dimensions.length", 
  "dimensions.width", 
  "id", 
  "location.country.code", 
  "location.country.id",  
  "location.country.name", 
  "location.country.state.id", 
  "location.country.state.name", 
  "location.country.state.code", 
  "location.timezone", 
  "matchId", 
  "name"
)

#' getVenueExposedFields
#'
#' This vector contains all the fields we're exposing in the getVenueExposedFields function and their equivalent renames.
#' @keywords internal
getVenueExposedFields <- c(match.id='matchId',
                           id = "id",
                           name = "name",
                           code = "code",
                           country.id='location.country.id',
                           country.name='location.country.name',
                           country.code='location.country.code',
                           state.id='location.country.state.id',
                           state.name='location.country.state.name',
                           state.code='location.country.state.code',
                           timezone='location.timezone',
                           length='dimensions.length',
                           width='dimensions.width')







#' getMatchPersons_Whitelist
#'
#' This vector contains all the possible columns in the getMatchPersons() function 
#' @keywords internal
getMatchPersons_Whitelist <- c(
  "players.dateOfBirth", "players.matchAge", "players.height"      ,
  "players.firstname"  , "players.surname" , "players.jumperNumber",
  "players.displayName", "players.fullname", "players.personId"    ,
  "players.positions.selected.id"  , "players.positions.selected.code", 
  "players.positions.selected.name", "players.positions.season.id"    , 
  "players.positions.season.code"  , "players.positions.season.name"  ,
  "code", "id", "name"
)

#' getMatchPersons_officialsWhitelist
#'
#' This vector contains all the possible columns in the getMatchPersons() function for the officials portion of the response (officials param == TRUE).
#' @keywords internal
getMatchPersons_officialsWhitelist <- c("match.id", "personId", "fullname", "displayName", "jumperNumber", 
                                        "positions.selected.id", "positions.selected.name", "positions.selected.code")

#' getMatchPersons_officialsExposedFields
#'
#' This vector contains all the fields we're exposing in the getMatchPersons function and their equivalent renames for the officials portion of the response (officials param == TRUE).
#' @keywords internal
getMatchPersons_officialsExposedFields <- c(match.id       = 'match.id',
                                            person.name    = "fullname",                # CHANGE: official.name          = 'fullname',
                                            person.display = "displayName",             # CHANGE: official.display.name  = 'displayName',
                                            person.id      = "personId",                # CHANGE: official.id            = 'personId',
                                            jumper         = "jumperNumber",            # CHANGE: official.jumper.no     = 'jumperNumber',
                                            selected.id    = "positions.selected.id",   # CHANGE: selected.position.id   = 'positions.selected.id',
                                            selected.name  = "positions.selected.name", # CHANGE: selected.position.name = 'positions.selected.name',
                                            selected.code  = "positions.selected.code") # CHANGE: selected.position.code = 'positions.selected.code'
#' getMatchPersons_officialsDF
#'
#' This is the empty dataframe returned in the response when officials param of getMatchPersons() is set to TRUE, but there are no officials in the response (ie. for AFLW matches where officials arent recorded).
#' @keywords internal
getMatchPersons_officialsDF <- data.frame("match.id"       = character(),
                                          "person.name"    = character(), # CHANGE: "official.name"          = character(),
                                          "person.display" = character(), # CHANGE: "official.display.name"  = character(),
                                          "person.id"      = character(), # CHANGE: "official.id"            = character(),
                                          "jumper"         = character(), # CHANGE: "official.jumper.no"     = character(),
                                          "selected.id"    = character(), # CHANGE: "selected.position.id"   = character(),
                                          "selected.name"  = character(), # CHANGE: "selected.position.name" = character(),
                                          "selected.code"  = character(), # CHANGE: "selected.position.code" = character(),
                                          stringsAsFactors = FALSE)

#' getMatchPersonsExposedFields
#'
#' This vector contains all the fields we're exposing in the getMatchPersonsExposedFields function and their equivalent renames.
#' @keywords internal
getMatchPersonsExposedFields <- c(
  match.id         = "match.id",
  squad.name       = 'name', 
  squad.code       = 'code',
  squad.id         = 'id',
  person.name      = 'players.fullname',                 # CHANGE: player.fullname  = 'players.personId',
  person.firstname = 'players.firstname',                # CHANGE: player.firstname = 'players.personId',
  person.surname   = 'players.surname',                  # CHANGE: player.surname   = 'players.personId',
  person.display   = 'players.displayName',              # CHANGE: player.display.name = 'players.personId', 
  person.id        = 'players.personId',                 # CHANGE: player.id        = 'players.personId',
  jumper           = 'players.jumperNumber',             # CHANGE: player.jumper.no = 'players.personId', 
  selected.id      = 'players.positions.selected.id',    # CHANGE: selected.position.id = 'players.personId',
  selected.name    = 'players.positions.selected.name',  # CHANGE: selected.position.name = 'players.personId',
  selected.code    = 'players.positions.selected.code',  # CHANGE: selected.position.code = 'players.personId',
  position.id      = 'players.positions.season.id',      
  position.name    = 'players.positions.season.name',
  position.code    = 'players.positions.season.code',
  height           = "players.height", 
  weight           = "weight",
  DOB              = 'players.dateOfBirth', 
  age              = 'players.matchAge'
)

#' getLeadersWhitelist
#'
#' This vector contains all the possible columns in the getLeadersWhitelist() function (after the unnesting).
#' @keywords internal
getLeadersWhitelist <- c("statistics.persons_squadId", "statistics.persons_squadName", "statistics.persons_squadCode", 
                         "statistics.persons_order", "statistics.persons_rank", "statistics.persons_value", 
                         "statistics.persons_valueDisplay", "statistics.persons_jumperNumber", 
                         "statistics.persons_displayName", "statistics.persons_fullname", "statistics.persons_personId", 
                         "statistics.id", "statistics.code", "statistics.name", "statistics.namePlural", 
                         "matchId")

#' getLeadersExposedFields
#'
#' This vector contains all the fields we're exposing in the getLeadersExposedFields function and their equivalent renames.
#' @keywords internal
getLeadersExposedFields <- c(match.id            = 'matchId',
                             name                = 'statistics.name',
                             plural              = 'statistics.namePlural',
                             id                  = 'statistics.id',
                             code                = 'statistics.code',
                             player.name         = 'statistics.persons_fullname',
                             player.id           = 'statistics.persons_personId',
                             player.display      = 'statistics.persons_displayName',
                             player.jumper.number= 'statistics.persons_jumperNumber',
                             squad.name          = 'statistics.persons_squadName',
                             squad.id            = 'statistics.persons_squadId',
                             squad.code          = 'statistics.persons_squadCode',
                             value               = 'statistics.persons_value' , 
                             display             = 'statistics.persons_valueDisplay',
                             rank                = 'statistics.persons_rank',
                             order               = 'statistics.persons_order')

#' zonedMetrics_PlatformNames_Squad
#'
#' The ZONED metrics that go into the POST payload in getSquadSummaryFile()
#' @keywords internal
zonedMetrics_PlatformNames_Squad <- c(
  "BALL_UP", "CLEARANCE_BU", "FIRST_POSSESSION_BU", "HITOUT_BU", "HITOUT_SHARKED_BU", "BAULK", "BAULKED", "BEHIND_ASSIST", "BEHIND",
  "BLOCK", "TACKLE_BREAK", "CHAIN_LAUNCH_BU_BEHI", "CLEARANCE_BU_EFFECTIVE", "CHAIN_LAUNCH_BU_GOAL", "HITOUT_TO_ADVANTAGE_BU",
  "CHAIN_LAUNCH_BU_IN50", "CHAIN_LAUNCH_BU_SCORE", "CHAIN_METRES", "CHAIN_METRES_BU", "CHAIN_METRES_KI", "CHAIN_METRES_NET",
  "CHAIN_METRES_NET_BU", "CHAIN_METRES_NET_KI", "CHAIN_METRES_NET_INT", "CHAIN_METRES_NET_ST", "CHAIN_METRES_NET_TI", "CHAIN_METRES_INT",
  "CHAIN_METRES_REPLY", "CHAIN_METRES_REPLY_BU", "CHAIN_METRES_REPLY_KI", "CHAIN_METRES_REPLY_INT", "CHAIN_METRES_REPLY_ST",
  "CHAIN_METRES_REPLY_TI", "CHAIN_METRES_ST", "CHAIN_METRES_TI", "CLANGER", "KICK_GROUND_CLANGER", "HANDBALL_CLANGER", "KICK_CLANGER",
  "CLEARANCE", "ONE_ON_ONE_DEFENDER_LOSS", "ONE_ON_ONE_DEFENDER_NEUTRAL", "ONE_ON_ONE_DEFENDER_WIN", "ONE_ON_ONE_DEFENDER",
  "ONE_ON_ONE_TARGET_LOSS", "ONE_ON_ONE_TARGET_NEUTRAL", "ONE_ON_ONE_TARGET_WIN", "ONE_ON_ONE_TARGET", "KNOCK_ON_CONTESTED", 
  "MARK_CONTESTED", "MARK_CONTESTED_OPPOSITION", "MARK_CONTESTED_SQ", "POSSESSION_CONTESTED", "POSSESSION_CONTESTED_GP", 
  "POSSESSION_CONTESTED_PREC", "CRUMB", "DISPOSAL", "DISPOSAL_GP", "DISPOSAL_PREC", "CLEARANCE_EFFECTIVE", "DISPOSAL_EFFECTIVE",
  "KICK_GROUND_EFFECTIVE", "HANDBALL_EFFECTIVE", "KICK_EFFECTIVE", "POINTS_EXPECTED", "FIRST_POSSESSION", "FIRST_POSSESSION_CLEARANCE",
  "FREE_KICK_AGAINST", "FREE_KICK_AGAINST_GENERAL", "FREE_KICK_AGAINST_MARKING", "FREE_KICK_AGAINST_RUCK", "FREE_KICK_AGAINST_TACKLING",
  "FREE_KICK", "FREE_KICK_OFF_BALL", "FREE_KICK_IN_CONTEST", "FREE_KICK_GP", "FREE_KICK_PREC", "GATHER", "GATHER_HITOUT", "GOAL",
  "GOAL_ASSIST", "GROUNDBALL_GET", "GROUNDBALL_GET_GP", "GROUNDBALL_GET_PREC", "KICK_GROUND", "HANDBALL", "METRES_GAINED_HANDBALL",
  "HARDBALL_GET", "HARDBALL_GET_GP", "HARDBALL_GET_PREC", "HITOUT_SHARK", "HITOUT_SHARKED", "HITOUT_TO_ADVANTAGE", "HITOUT",
  "INSIDE_50_FORCED_ENTRY_RETURN", "INSIDE_50_INITIAL", "INSIDE_50_INITIAL_ENTRY_RETURN", "INSIDE_50_KICK", "INSIDE_50_KICK_LOSS",
  "INSIDE_50_KICK_RETAIN_MARK", "INSIDE_50_KICK_RETAIN", "INSIDE_50_REPEAT", "INSIDE_50_REPEAT_DIRECT", "INSIDE_50_REPEAT_DIRECT_ENTRY_RETURN",
  "INSIDE_50_REPEAT_ENTRY_RETURN", "INSIDE_50_TRANSITION", "INSIDE_50_TRANSITION_DIRECT", "INSIDE_50_TRANSITION_DIRECT_ENTRY_RETURN",
  "INSIDE_50_TRANSITION_ENTRY_RETURN", "CLEARANCE_INEFFECTIVE", "KICK_GROUND_INEFFECTIVE", "HANDBALL_INEFFECTIVE", "KICK_INEFFECTIVE",
  "INSIDE_50", "INTERCEPT", "INTERCEPT_MARK_CONTESTED", "INTERCEPT_FREE_KICK", "INTERCEPT_GATHER", "INTERCEPT_GROUNDBALL_GET",
  "INTERCEPT_HARDBALL_GET", "INTERCEPT_LOOSEBALL_GET", "INTERCEPT_MARK", "INTERCEPT_OUT_ON_FULL_KICK_IN","INTERCEPT_GROUND_KICK","INTERCEPT_KNOCK_ON", "INTERCEPT_MARK_UNCONTESTED",
  "CHAIN_LAUNCH_KI_BEHI", "CHAIN_LAUNCH_KI_GOAL", "CHAIN_LAUNCH_KI_IN50", "CHAIN_LAUNCH_KI_SCORE", "KICK", "KICK_EFFECTIVE_BACKWARDS",
  "KICK_DIRECTION_FORWARD", "KICK_DIRECTION_FORWARD_NON_SET", "KICK_DIRECTION_FORWARD_SET", "METRES_GAINED_KICK", "KICK_IN",
  "KNOCK_ON", "KICK_EFFECTIVE_LONG", "KICK_DISTANCE_LONG", "LOOSEBALL_GET", "LOOSEBALL_GET_GP",
  "LOOSEBALL_GET_PREC", "PENALTY_50M_AGAINST", "MARK", "MARK_DROPPED", "MARK_FUMBLED", "MARK_ON_LEAD", "MARK_PLAY_ON", "D50_BALL_MOVEMENT",
  "D50_BALL_MOVEMENT_BOUNDARY", "D50_BALL_MOVEMENT_CORRIDOR", "D50_BALL_MOVEMENT_WING", "METRES_GAINED_ASSISTED", "METRES_GAINED_EFFECTIVE",
  "METRES_GAINED_NET", "METRES_GAINED_RETAIN", "SHOT_AT_GOAL_MISSED", "TACKLE_MISSED", "ERROR_NO_PRESSURE", "HARDBALL_GET_GROUNDBALL",
  "OUT_ON_FULL", "CHAIN_LAUNCH_INT_BEHI", "CHAIN_LAUNCH_INT_GOAL", "CHAIN_LAUNCH_INT_IN50", "CHAIN_LAUNCH_INT_SCORE", "POSSESSION","RANKING_POINTS",
  "PLAYER_RATING_BALL_USE", "PLAYER_RATING_BALL_WINNING", "PLAYER_RATING_DEFENCE", "PLAYER_RATING_BALL_USE_FIELD_KICK", "PLAYER_RATING_HITOUT",
  "PLAYER_RATING_DEFENCE_PRESSURE", "PLAYER_RATING_BALL_USE_SHOT_AT_GOAL", "REBOUND_50", "HANDBALL_RECEIVE", "DISPOSAL_RETAIN", 
  "HANDBALL_RETAIN", "KICK_RETAIN", "HARDBALL_GET_RUCK", "TACKLE_RUN_DOWN", "RUNNING_BOUNCE", "BEHIND_RUSHED", "POINTS", "SCORE_ASSIST",
  "SCORING_SHOT", "STOPPAGE_SECONDARY", "KICK_EFFECTIVE_SHORT", "KICK_DISTANCE_SHORT", "SHOT_AT_GOAL", "SMOTHER", "SPOIL", "SPOIL_GAINING_POSSESSION",
  "SPOIL_INEFFECTIVE", "TACKLE_ATTEMPT_SQ", "PRESSURE_ACT_SQ_CHASING", "PRESSURE_ACT_SQ_CLOSING", "PRESSURE_ACT_SQ_CORRALLING", 
  "TACKLE_INEFFECTIVE_SQ", "PRESSURE_ACT_SQ_NONE", "PRESSURE_ACT_SQ_PHYSICAL", "PRESSURE_ACT_SQ_SET", "PRESSURE_ACT_SQ", 
  "PRESSURE_POINTS_SQ", "STOPPAGE_EXIT", "STOPPAGE_EXIT_HANDBALL", "STOPPAGE_EXIT_KICK", "STOPPAGE", "TACKLE", "TACKLE_GP", 
  "TACKLE_PREC", "THROW_IN", "CLEARANCE_TI", "FIRST_POSSESSION_TI", "HITOUT_TI", "HITOUT_SHARK_TI", "HITOUT_SHARKED_TI",
  "CHAIN_LAUNCH_TI_BEHI", "CLEARANCE_TI_EFFECTIVE", "CHAIN_LAUNCH_TI_GOAL", "HITOUT_TO_ADVANTAGE_TI", "CHAIN_LAUNCH_TI_IN50",
  "CHAIN_LAUNCH_TI_SCORE", "TIME_IN_ZONE", "TURNOVER", "TURNOVER_CLEARING_STOPPAGE", "PRESSURE_ACT_FORCED_TURNOVER", 
  "PRESSURE_ACT_FORCED_TURNOVER_POINTS", "TURNOVER_GENERAL_PLAY", "TURNOVER_GIVEAWAY", "TURNOVER_OPPOSITION_TAKEAWAY", 
  "TURNOVER_GIVEAWAY_UNFORCED", "GATHER_UNCONTESTED", "MARK_UNCONTESTED", "MARK_UNCONTESTED_OPPOSITION", "MARK_UNCONTESTED_SQ",
  "POSSESSION_UNCONTESTED","INTERCEPT_GROUND_KICK","INTERCEPT_KNOCK_ON"
)

#' zonelessMetrics_PlatformNames_Squad
#'
#' The ZONELESS metrics that go into the POST payload in getSquadSummaryFile()
#' @keywords internal
zonelessMetrics_PlatformNames_Squad <- c(
  "CHAIN_LAUNCH_CB_GOAL", "FIRST_POSSESSION_CB", "HITOUT_SHARKED_CB",
  "HITOUT_TO_ADVANTAGE_CB", "CHAIN_LAUNCH_CB_IN50", "CHAIN_LAUNCH_CB_SCORE",
  "CENTRE_BOUNCE", "CLEARANCE_CB", "HITOUT_CB", "D50_REBOUND_BEHI","CHAIN_LAUNCH_CB_BEHI",
  "D50_REBOUND_GOAL", "D50_REBOUND_IN50", "D50_REBOUND_SCORE", "D50_REBOUND",
  "INSIDE_50_TARGET", "INSIDE_50_TARGET_CHANCE_PLAYER_RETAIN","KICK_IN_CLANGER", "KICK_IN_INEFFECTIVE",
  "INSIDE_50_TARGET_CHANCE_PLAYER_SCORE", "INSIDE_50_TARGET_CHANCE_TEAM_RETAIN",
  "INSIDE_50_TARGET_CHANCE_TEAM_SCORE", "INTERCHANGE_CAP_COUNT", "KICK_IN_EFFECTIVE",
  "KICK_IN_PLAY_ON", "MID_BALL_MOVEMENT_BOUNDARY", "MID_BALL_MOVEMENT_CORRIDOR",
  "MID_BALL_MOVEMENT_WING", "REBOUND_50_LOSS_CP", "REBOUND_50_LOSS_UP",
  "REBOUND_50_RETAIN_RUN", "REBOUND_50_RETAIN_CP", "REBOUND_50_RETAIN_UP",
  "STOPPAGE_SECONDARY_BU", "STOPPAGE_SECONDARY_CB", "STOPPAGE_SECONDARY_TI",
  "CHAIN_LAUNCH_ST_BEHI", "CHAIN_LAUNCH_ST_GOAL", "CHAIN_LAUNCH_ST_SCORE",
  "TIME_IN_POSSESSION_DISPUTE", "TIME_IN_POSSESSION", "TIME_IN_POSSESSION_TOTAL",
  "METRES_GAINED", "INSIDE_50_TARGET_CHANCE", "CLEARANCE_CB_EFFECTIVE",
  "CHAIN_METRES_CB", "CHAIN_METRES_NET_CB", "CHAIN_METRES_REPLY_CB",
  "INSIDE_50_FORCED", "INSIDE_50_INITIAL_DIRECT", "INSIDE_50_INITIAL_DIRECT_ENTRY_RETURN",
  "LONG_DOWN_LINE", "LONG_DOWN_LINE_LOSS", "LONG_DOWN_LINE_OPPORTUNITY",
  "LONG_DOWN_LINE_RETAIN", "LONG_DOWN_LINE_SCORE", "LONG_DOWN_LINE_STOPPAGE",
  "PLAYER_RATING", "SWITCH", "SWITCH_IN50", "SWITCH_OPPORTUNITY",
  "SWITCH_SCORE", "CHAIN_METRES_NET", "CHAIN_METRES_NET_ST", "CHAIN_METRES_REPLY",
  "CHAIN_METRES_REPLY_ST", "CHAIN_METRES_ST", "CHAIN_METRES",
  "FIRST_POSSESSION_CLEARANCE", "CLEARANCE", "FIRST_POSSESSION",
  "STOPPAGE", "HITOUT", "HITOUT_SHARKED", "HITOUT_SHARK",
  "HITOUT_TO_ADVANTAGE","PLAYER_RATING_HITOUT","RANKING_POINTS"
)

#' zonelessMetricsOther_PlatformNames_Squad
#'
#' These are metrics that need to be treated differently (ie. Time In Possession essentially gets turned into its own metric) in getSquadSummaryFile()
#' @keywords internal
zonelessMetricsOther_PlatformNames_Squad <- c("TIME_IN_POSSESSION")

#' squadSummaryFileMetricNames
#'
#' This vector contains the namees of all the metrics as they appeared in the old Squad Summary files available on the support site. This should map 1:1 with squadSummaryFilePlatformMetricNames (used in getSquadSummaryFile())
#' @keywords internal
squadSummaryFileMetricNames <- c(
  'BALL_UP',
  'BALL_UP_CLEARANCE',
  'BALL_UP_FIRST_POSSESSION',
  'BALL_UP_HITOUT',
  'BALL_UP_HITOUT_SHARKED',
  'BAULK',
  'BAULKED',
  'BEHIND_ASSIST',
  'BEHIND_INC_RUSH',
  'BLOCK',
  'BROKEN_TACKLE',
  'BU_BEHIND_LAUNCH',
  'BU_GOAL_LAUNCH',
  'BU_HITOUT_TO_ADVANTAGE',
  'BU_IN50_LAUNCH',
  'BU_SCORE_LAUNCH',
  'CB_BEHIND_LAUNCH',
  'CB_FIRST_POSSESSION',
  'CB_GOAL_LAUNCH',
  'CB_HITOUT_SHARKED',
  'CB_HITOUT_TO_ADVANTAGE',
  'CB_IN50_LAUNCH',
  'CB_SCORE_LAUNCH',
  'CENTRE_BOUNCE',
  'CENTRE_BOUNCE_CLEARANCE',
  'CENTRE_BOUNCE_HITOUT',
  'CLANGER',
  'CLANGER_GROUND_KICK',
  'CLANGER_HANDBALL',
  'CLANGER_KICK',
  'CLEARANCE',
  'CONTESTED_KNOCK_ON',
  'CONTESTED_MARK',
  'CONTESTED_MARK_FROM_OPP',
  'CONTESTED_MARK_FROM_TEAM',
  'CONTESTED_POSSESSION',
  'CONTESTED_POSSESSION_POST',
  'CONTESTED_POSSESSION_PRE',
  'CRUMB',
  'D50_REB_BEHI',
  'D50_REB_GOAL',
  'D50_REB_IN50',
  'D50_REB_SCORE',
  'D50_REBOUND',
  'DISPOSAL',
  'DISPOSAL_POST',
  'DISPOSAL_PRE',
  'EFFECTIVE_DISPOSAL',
  'EFFECTIVE_GROUND_KICK',
  'EFFECTIVE_HANDBALL',
  'EFFECTIVE_KICK',
  'FIRST_POSSESSION',
  'FIRST_POSSESSION_TO_CLEAR',
  'FREE_AGAINST',
  'FREE_AGAINST_GENERAL',
  'FREE_AGAINST_MARKING',
  'FREE_AGAINST_RUCK',
  'FREE_AGAINST_TACKLING',
  'FREE_FOR',
  'FREE_FOR_OFF_BALL',
  'FREE_FOR_ON_BALL',
  'FREE_FOR_POST',
  'FREE_FOR_PRE',
  'GATHER',
  'GATHER_FROM_HITOUT',
  'GOAL',
  'GOAL_ASSIST',
  'GROUND_BALL_GET',
  'GROUND_BALL_GET_POST',
  'GROUND_BALL_GET_PRE',
  'GROUND_KICK',
  'HANDBALL',
  'HANDBALL_GAIN_METRES',
  'HARD_BALL_GET',
  'HARD_BALL_GET_POST',
  'HARD_BALL_GET_PRE',
  'HIT_OUT_SHARK',
  'HIT_OUT_SHARKED',
  'HIT_OUT_TO_ADVANTAGE',
  'HITOUT',
  'IN50_KICK',
  'IN50_KICK_LOSE',
  'IN50_KICK_MARK',
  'IN50_KICK_RETAIN',
  'IN50_TARGET',
  'IN50_TARGET_PLAY_RET',
  'IN50_TARGET_PLAY_SCORE',
  'IN50_TARGET_TEAM_RET',
  'IN50_TARGET_TEAM_SCORE',
  'INEFFECTIVE_GROUND_KICK',
  'INEFFECTIVE_HANDBALL',
  'INEFFECTIVE_KICK',
  'INSIDE_50',
  'INT_CAP_TOTAL',
  'INTERCEPT',
  'INTERCEPT_CM',
  'INTERCEPT_FREE',
  'INTERCEPT_GATHER',
  'INTERCEPT_GBG',
  'INTERCEPT_HBG',
  'INTERCEPT_LBG',
  'INTERCEPT_MARK',
  'INTERCEPT_OOFKI',
  'INTERCEPT_OTHER',
  'INTERCEPT_UM',
  'KI_BEHIND_LAUNCH',
  'KI_GOAL_LAUNCH',
  'KI_IN50_LAUNCH',
  'KI_SCORE_LAUNCH',
  'KICK',
  'KICK_BACKWARDS',
  'KICK_GAIN_METRES',
  'KICK_IN',
  'KICK_IN_CLANGER',
  'KICK_IN_EFFECTIVE',
  'KICK_IN_INEFFECTIVE',
  'KICK_IN_SELF',
  'KNOCK_ON',
  'LONG_KICK',
  'LOOSE_BALL_GET',
  'LOOSE_BALL_GET_POST',
  'LOOSE_BALL_GET_PRE',
  'M50M_PENALTY_AGAINST',
  'MARK',
  'MARK_DROPPED',
  'MARK_FUMBLED',
  'MARK_ON_LEAD',
  'MARK_PLAY_ON',
  'MBM_D50',
  'MBM_D50_BOUNDARY',
  'MBM_D50_CORRIDOR',
  'MBM_D50_WING',
  'MID_BALL_MOVE_BOUND',
  'MID_BALL_MOVE_CORRIDOR',
  'MID_BALL_MOVE_WING',
  'MISSED_SHOT',
  'MISSED_TACKLE',
  'NO_PRESSURE_ERROR',
  'NON_RUCK_HARD_BALL_GET',
  'OUT_ON_FULL',
  'PG_BEHIND_LAUNCH',
  'PG_GOAL_LAUNCH',
  'PG_IN50_LAUNCH',
  'PG_SCORE_LAUNCH',
  'POSSESSION',
  'RANKING_PTS',
  'RE50_RESULT_OPP_CP',
  'RE50_RESULT_OPP_UP',
  'RE50_RESULT_OTHER',
  'RE50_RESULT_RUN',
  'RE50_RESULT_TEAM_CP',
  'RE50_RESULT_TEAM_UP',
  'REBOUND_50',
  'RECEIVE_HANDBALL',
  'RETAIN_DISPOSAL',
  'RETAIN_HANDBALL',
  'RETAIN_KICK',
  'RUCK_HARD_BALL_GET',
  'RUNDOWN_TACKLE',
  'RUNNING_BOUNCE',
  'RUSHED_BEHIND',
  'SCORE',
  'SCORE_ASSIST',
  'SCORING_SHOTS',
  'SEC_STOP',
  'SEC_STOP_BU',
  'SEC_STOP_CB',
  'SEC_STOP_TI',
  'SHORT_KICK',
  'SHOT_AT_GOAL',
  'SMOTHER',
  'SPOIL',
  'SPOIL_GAINING_POSSESSION',
  'SPOIL_INEFFECTIVE',
  'ST_BEHIND_LAUNCH',
  'ST_GOAL_LAUNCH',
  'ST_SCORE_LAUNCH',
  'STOPPAGE',
  'TACKLE',
  'TACKLE_POST',
  'TACKLE_PRE',
  'THROW_IN',
  'THROW_IN_CLEARANCE',
  'THROW_IN_FIRST_POSSESSION',
  'THROW_IN_HITOUT',
  'THROW_IN_HITOUT_SHARK',
  'THROW_IN_HITOUT_SHARKED',
  'TI_BEHIND_LAUNCH',
  'TI_GOAL_LAUNCH',
  'TI_HITOUT_TO_ADVANTAGE',
  'TI_IN50_LAUNCH',
  'TI_SCORE_LAUNCH',
  'TIME_IN_POSS_DIFF',
  'TIME_IN_POSS_DISPUTE',
  'TIME_IN_POSS_OPP_SQUAD',
  'TIME_IN_POSS_SQUAD',
  'TIME_IN_POSS_TOTAL',
  'TIME_IN_ZONE_SECS',
  'PERIOD_LENGTH',
  'TOTAL_GAINED_METRES',
  'TURNOVER',
  'UNCONTESTED_GATHER',
  'UNCONTESTED_MARK',
  'UNCONTESTED_MARK_FROM_OPP',
  'UNCONTESTED_MARK_FROM_TEAM',
  'UNCONTESTED_POSSESSION',
  'IN50_TARGET_CHANCE',
  'KICK_FWD',
  'KICK_FWD_GEN',
  'KICK_FWD_SET',
  'LONG_KICK_FROM_POSS',
  'SHORT_KICK_FROM_POSS',
  'SQUAD_ATTEMPTED_TACKLE',
  'SQUAD_IMP_CHASING',
  'SQUAD_IMP_CLOSING',
  'SQUAD_IMP_CORRALLING',
  'SQUAD_INEFFECTIVE_TACKLE',
  'SQUAD_PRESSURE_ACTS',
  'SQUAD_PRESSURE_CHANCE',
  'SQUAD_PRESSURE_POINTS',
  'SQUAD_PRESS_ACTS_NP',
  'SQUAD_PRESS_ACTS_PHY',
  'SQUAD_PRESS_ACTS_SET',
  'TURNOVER_FORCED',
  'TURNOVER_FORCED_PTS',
  'BU_EFFECTIVE_CLEARANCE',
  'CB_EFFECTIVE_CLEARANCE',
  'CHAIN_METRES',
  'CHAIN_METRES_BU',
  'CHAIN_METRES_CB',
  'CHAIN_METRES_KI',
  'CHAIN_METRES_NET',
  'CHAIN_METRES_NET_BU',
  'CHAIN_METRES_NET_CB',
  'CHAIN_METRES_NET_KI',
  'CHAIN_METRES_NET_PG',
  'CHAIN_METRES_NET_ST',
  'CHAIN_METRES_NET_TI',
  'CHAIN_METRES_PG',
  'CHAIN_METRES_REPLY',
  'CHAIN_METRES_REPLY_BU',
  'CHAIN_METRES_REPLY_CB',
  'CHAIN_METRES_REPLY_KI',
  'CHAIN_METRES_REPLY_PG',
  'CHAIN_METRES_REPLY_ST',
  'CHAIN_METRES_REPLY_TI',
  'CHAIN_METRES_ST',
  'CHAIN_METRES_TI',
  'CONTEST_DEFENDER',
  'CONTEST_DEF_LOSE',
  'CONTEST_DEF_NEUTRAL',
  'CONTEST_DEF_WIN',
  'CONTEST_TARGET',
  'CONTEST_TARG_LOSE',
  'CONTEST_TARG_NEUTRAL',
  'CONTEST_TARG_WIN',
  'EFFECTIVE_CLEARANCE',
  'EXPECTED_SCORE',
  'IN50_FORCED',
  'IN50_FORCED_RETURN',
  'IN50_INIT',
  'IN50_INIT_DIR',
  'IN50_INIT_DIR_RETURN',
  'IN50_INIT_RETURN',
  'IN50_RPT',
  'IN50_RPT_DIR',
  'IN50_RPT_DIR_RETURN',
  'IN50_RPT_RETURN',
  'IN50_TRANS',
  'IN50_TRANS_DIR',
  'IN50_TRANS_DIR_RETURN',
  'IN50_TRANS_RETURN',
  'INEFFECTIVE_CLEARANCE',
  'LONG_DOWN_LINE_KICK',
  'LONG_DOWN_LINE_LOSE',
  'LONG_DOWN_LINE_OPP',
  'LONG_DOWN_LINE_RET',
  'LONG_DOWN_LINE_SCORE',
  'LONG_DOWN_LINE_STOP',
  'METRES_GAINED_ASSISTED',
  'METRES_GAINED_EFF',
  'METRES_GAINED_NET',
  'METRES_GAINED_RETAINED',
  'RATING',
  'RATING_BALL_USE',
  'RATING_BALL_WINNING',
  'RATING_DEFENCE',
  'RATING_FIELD_KICKS',
  'RATING_HITOUTS',
  'RATING_PRESSURE',
  'RATING_SHOTS',
  'STOP_EXIT',
  'STOP_EXIT_H',
  'STOP_EXIT_K',
  'SWITCH_COMPLETE',
  'SWITCH_IN50',
  'SWITCH_OPP',
  'SWITCH_SCORE',
  'TI_EFFECTIVE_CLEARANCE',
  'TURNOVER_CLEARING_STOPPAGE',
  'TURNOVER_GENERAL_PLAY',
  'TURNOVER_GIVEAWAY',
  'TURNOVER_TAKEAWAY',
  'TURNOVER_UNFORCED_GIVEAWAY'
)

#' squadSummaryFilePlatformMetricNames
#'
#' This vector contains the PLATFORM/API metric names of all the metrics that were in the Squad Summary file on the support site. This should map 1:1 with squadSummaryFileMetricNames (used in getSquadSummaryFile())
#' @keywords internal
squadSummaryFilePlatformMetricNames <- c(
  'BALL_UP',
  'CLEARANCE_BU',
  'FIRST_POSSESSION_BU',
  'HITOUT_BU',
  'HITOUT_SHARKED_BU',
  'BAULK',
  'BAULKED',
  'BEHIND_ASSIST',
  'BEHIND',
  'BLOCK',
  'TACKLE_BREAK',
  'CHAIN_LAUNCH_BU_BEHI',
  'CHAIN_LAUNCH_BU_GOAL',
  'HITOUT_TO_ADVANTAGE_BU',
  'CHAIN_LAUNCH_BU_IN50',
  'CHAIN_LAUNCH_BU_SCORE',
  'CHAIN_LAUNCH_CB_BEHI',
  'FIRST_POSSESSION_CB',
  'CHAIN_LAUNCH_CB_GOAL',
  'HITOUT_SHARKED_CB',
  'HITOUT_TO_ADVANTAGE_CB',
  'CHAIN_LAUNCH_CB_IN50',
  'CHAIN_LAUNCH_CB_SCORE',
  'CENTRE_BOUNCE',
  'CLEARANCE_CB',
  'HITOUT_CB',
  'CLANGER',
  'KICK_GROUND_CLANGER',
  'HANDBALL_CLANGER',
  'KICK_CLANGER',
  'CLEARANCE',
  'KNOCK_ON_CONTESTED',
  'MARK_CONTESTED',
  'MARK_CONTESTED_OPPOSITION',
  'MARK_CONTESTED_SQ',
  'POSSESSION_CONTESTED',
  'POSSESSION_CONTESTED_GP',
  'POSSESSION_CONTESTED_PREC',
  'CRUMB',
  'D50_REBOUND_BEHI',
  'D50_REBOUND_GOAL',
  'D50_REBOUND_IN50',
  'D50_REBOUND_SCORE',
  'D50_REBOUND',
  'DISPOSAL',
  'DISPOSAL_GP',
  'DISPOSAL_PREC',
  'DISPOSAL_EFFECTIVE',
  'KICK_GROUND_EFFECTIVE',
  'HANDBALL_EFFECTIVE',
  'KICK_EFFECTIVE',
  'FIRST_POSSESSION',
  'FIRST_POSSESSION_CLEARANCE',
  'FREE_KICK_AGAINST',
  'FREE_KICK_AGAINST_GENERAL',
  'FREE_KICK_AGAINST_MARKING',
  'FREE_KICK_AGAINST_RUCK',
  'FREE_KICK_AGAINST_TACKLING',
  'FREE_KICK',
  'FREE_KICK_OFF_BALL',
  'FREE_KICK_IN_CONTEST',
  'FREE_KICK_GP',
  'FREE_KICK_PREC',
  'GATHER',
  'GATHER_HITOUT',
  'GOAL',
  'GOAL_ASSIST',
  'GROUNDBALL_GET',
  'GROUNDBALL_GET_GP',
  'GROUNDBALL_GET_PREC',
  'KICK_GROUND',
  'HANDBALL',
  'METRES_GAINED_HANDBALL',
  'HARDBALL_GET',
  'HARDBALL_GET_GP',
  'HARDBALL_GET_PREC',
  'HITOUT_SHARK',
  'HITOUT_SHARKED',
  'HITOUT_TO_ADVANTAGE',
  'HITOUT',
  'INSIDE_50_KICK',
  'INSIDE_50_KICK_LOSS',
  'INSIDE_50_KICK_RETAIN_MARK',
  'INSIDE_50_KICK_RETAIN',
  'INSIDE_50_TARGET',
  'INSIDE_50_TARGET_CHANCE_PLAYER_RETAIN',
  'INSIDE_50_TARGET_CHANCE_PLAYER_SCORE',
  'INSIDE_50_TARGET_CHANCE_TEAM_RETAIN',
  'INSIDE_50_TARGET_CHANCE_TEAM_SCORE',
  'KICK_GROUND_INEFFECTIVE',
  'HANDBALL_INEFFECTIVE',
  'KICK_INEFFECTIVE',
  'INSIDE_50',
  'INTERCHANGE_CAP_COUNT',
  'INTERCEPT',
  'INTERCEPT_MARK_CONTESTED',
  'INTERCEPT_FREE_KICK',
  'INTERCEPT_GATHER',
  'INTERCEPT_GROUNDBALL_GET',
  'INTERCEPT_HARDBALL_GET',
  'INTERCEPT_LOOSEBALL_GET',
  'INTERCEPT_MARK',
  'INTERCEPT_OUT_ON_FULL_KICK_IN',
  'INTERCEPT_GROUND_KICK',
  'INTERCEPT_MARK_UNCONTESTED',
  'CHAIN_LAUNCH_KI_BEHI',
  'CHAIN_LAUNCH_KI_GOAL',
  'CHAIN_LAUNCH_KI_IN50',
  'CHAIN_LAUNCH_KI_SCORE',
  'KICK',
  'KICK_EFFECTIVE_BACKWARDS',
  'METRES_GAINED_KICK',
  'KICK_IN',
  'KICK_IN_CLANGER',
  'KICK_IN_EFFECTIVE',
  'KICK_IN_INEFFECTIVE',
  'KICK_IN_PLAY_ON',
  'KNOCK_ON',
  'KICK_EFFECTIVE_LONG',
  'LOOSEBALL_GET',
  'LOOSEBALL_GET_GP',
  'LOOSEBALL_GET_PREC',
  'PENALTY_50M_AGAINST',
  'MARK',
  'MARK_DROPPED',
  'MARK_FUMBLED',
  'MARK_ON_LEAD',
  'MARK_PLAY_ON',
  'D50_BALL_MOVEMENT',
  'D50_BALL_MOVEMENT_BOUNDARY',
  'D50_BALL_MOVEMENT_CORRIDOR',
  'D50_BALL_MOVEMENT_WING',
  'MID_BALL_MOVEMENT_BOUNDARY',
  'MID_BALL_MOVEMENT_CORRIDOR',
  'MID_BALL_MOVEMENT_WING',
  'SHOT_AT_GOAL_MISSED',
  'TACKLE_MISSED',
  'ERROR_NO_PRESSURE',
  'HARDBALL_GET_GROUNDBALL',
  'OUT_ON_FULL',
  'CHAIN_LAUNCH_INT_BEHI',
  'CHAIN_LAUNCH_INT_GOAL',
  'CHAIN_LAUNCH_INT_IN50',
  'CHAIN_LAUNCH_INT_SCORE',
  'POSSESSION',
  'RANKING_POINTS',
  'REBOUND_50_LOSS_CP',
  'REBOUND_50_LOSS_UP',
  'UNMAPPED',
  'REBOUND_50_RETAIN_RUN',
  'REBOUND_50_RETAIN_CP',
  'REBOUND_50_RETAIN_UP',
  'REBOUND_50',
  'HANDBALL_RECEIVE',
  'DISPOSAL_RETAIN',
  'HANDBALL_RETAIN',
  'KICK_RETAIN',
  'HARDBALL_GET_RUCK',
  'TACKLE_RUN_DOWN',
  'RUNNING_BOUNCE',
  'BEHIND_RUSHED',
  'POINTS',
  'SCORE_ASSIST',
  'SCORING_SHOT',
  'STOPPAGE_SECONDARY',
  'STOPPAGE_SECONDARY_BU',
  'STOPPAGE_SECONDARY_CB',
  'STOPPAGE_SECONDARY_TI',
  'KICK_EFFECTIVE_SHORT',
  'SHOT_AT_GOAL',
  'SMOTHER',
  'SPOIL',
  'SPOIL_GAINING_POSSESSION',
  'SPOIL_INEFFECTIVE',
  'CHAIN_LAUNCH_ST_BEHI',
  'CHAIN_LAUNCH_ST_GOAL',
  'CHAIN_LAUNCH_ST_SCORE',
  'STOPPAGE',
  'TACKLE',
  'TACKLE_GP',
  'TACKLE_PREC',
  'THROW_IN',
  'CLEARANCE_TI',
  'FIRST_POSSESSION_TI',
  'HITOUT_TI',
  'HITOUT_SHARK_TI',
  'HITOUT_SHARKED_TI',
  'CHAIN_LAUNCH_TI_BEHI',
  'CHAIN_LAUNCH_TI_GOAL',
  'HITOUT_TO_ADVANTAGE_TI',
  'CHAIN_LAUNCH_TI_IN50',
  'CHAIN_LAUNCH_TI_SCORE',
  'UNMAPPED',
  'TIME_IN_POSSESSION_DISPUTE',
  'UNMAPPED',
  'TIME_IN_POSSESSION',
  'TIME_IN_POSSESSION_TOTAL',
  'TIME_IN_ZONE',
  'PERIOD_LENGTH',
  'METRES_GAINED',
  'TURNOVER',
  'GATHER_UNCONTESTED',
  'MARK_UNCONTESTED',
  'MARK_UNCONTESTED_OPPOSITION',
  'MARK_UNCONTESTED_SQ',
  'POSSESSION_UNCONTESTED',
  'INSIDE_50_TARGET_CHANCE',
  'KICK_DIRECTION_FORWARD',
  'KICK_DIRECTION_FORWARD_NON_SET',
  'KICK_DIRECTION_FORWARD_SET',
  'KICK_DISTANCE_LONG',
  'KICK_DISTANCE_SHORT',
  'TACKLE_ATTEMPT_SQ',
  'PRESSURE_ACT_SQ_CHASING',
  'PRESSURE_ACT_SQ_CLOSING',
  'PRESSURE_ACT_SQ_CORRALLING',
  'TACKLE_INEFFECTIVE_SQ',
  'PRESSURE_ACT_SQ',
  'PRESSURE_ACT_SQ',
  'PRESSURE_POINTS_SQ',
  'PRESSURE_ACT_SQ_NONE',
  'PRESSURE_ACT_SQ_PHYSICAL',
  'PRESSURE_ACT_SQ_SET',
  'PRESSURE_ACT_FORCED_TURNOVER',
  'PRESSURE_ACT_FORCED_TURNOVER_POINTS',
  'CLEARANCE_BU_EFFECTIVE',
  'CLEARANCE_CB_EFFECTIVE',
  'CHAIN_METRES',
  'CHAIN_METRES_BU',
  'CHAIN_METRES_CB',
  'CHAIN_METRES_KI',
  'CHAIN_METRES_NET',
  'CHAIN_METRES_NET_BU',
  'CHAIN_METRES_NET_CB',
  'CHAIN_METRES_NET_KI',
  'CHAIN_METRES_NET_INT',
  'CHAIN_METRES_NET_ST',
  'CHAIN_METRES_NET_TI',
  'CHAIN_METRES_INT',
  'CHAIN_METRES_REPLY',
  'CHAIN_METRES_REPLY_BU',
  'CHAIN_METRES_REPLY_CB',
  'CHAIN_METRES_REPLY_KI',
  'CHAIN_METRES_REPLY_INT',
  'CHAIN_METRES_REPLY_ST',
  'CHAIN_METRES_REPLY_TI',
  'CHAIN_METRES_ST',
  'CHAIN_METRES_TI',
  'ONE_ON_ONE_DEFENDER',
  'ONE_ON_ONE_DEFENDER_LOSS',
  'ONE_ON_ONE_DEFENDER_NEUTRAL',
  'ONE_ON_ONE_DEFENDER_WIN',
  'ONE_ON_ONE_TARGET',
  'ONE_ON_ONE_TARGET_LOSS',
  'ONE_ON_ONE_TARGET_NEUTRAL',
  'ONE_ON_ONE_TARGET_WIN',
  'CLEARANCE_EFFECTIVE',
  'POINTS_EXPECTED',
  'INSIDE_50_FORCED',
  'INSIDE_50_FORCED_ENTRY_RETURN',
  'INSIDE_50_INITIAL',
  'INSIDE_50_INITIAL_DIRECT',
  'INSIDE_50_INITIAL_DIRECT_ENTRY_RETURN',
  'INSIDE_50_INITIAL_ENTRY_RETURN',
  'INSIDE_50_REPEAT',
  'INSIDE_50_REPEAT_DIRECT',
  'INSIDE_50_REPEAT_DIRECT_ENTRY_RETURN',
  'INSIDE_50_REPEAT_ENTRY_RETURN',
  'INSIDE_50_TRANSITION',
  'INSIDE_50_TRANSITION_DIRECT',
  'INSIDE_50_TRANSITION_DIRECT_ENTRY_RETURN',
  'INSIDE_50_TRANSITION_ENTRY_RETURN',
  'CLEARANCE_INEFFECTIVE',
  'LONG_DOWN_LINE',
  'LONG_DOWN_LINE_LOSS',
  'LONG_DOWN_LINE_OPPORTUNITY',
  'LONG_DOWN_LINE_RETAIN',
  'LONG_DOWN_LINE_SCORE',
  'LONG_DOWN_LINE_STOPPAGE',
  'METRES_GAINED_ASSISTED',
  'METRES_GAINED_EFFECTIVE',
  'METRES_GAINED_NET',
  'METRES_GAINED_RETAIN',
  'PLAYER_RATING',
  'PLAYER_RATING_BALL_USE',
  'PLAYER_RATING_BALL_WINNING',
  'PLAYER_RATING_DEFENCE',
  'PLAYER_RATING_BALL_USE_FIELD_KICK',
  'PLAYER_RATING_HITOUT',
  'PLAYER_RATING_DEFENCE_PRESSURE',
  'PLAYER_RATING_BALL_USE_SHOT_AT_GOAL',
  'STOPPAGE_EXIT',
  'STOPPAGE_EXIT_HANDBALL',
  'STOPPAGE_EXIT_KICK',
  'SWITCH',
  'SWITCH_IN50',
  'SWITCH_OPPORTUNITY',
  'SWITCH_SCORE',
  'CLEARANCE_TI_EFFECTIVE',
  'TURNOVER_CLEARING_STOPPAGE',
  'TURNOVER_GENERAL_PLAY',
  'TURNOVER_GIVEAWAY',
  'TURNOVER_OPPOSITION_TAKEAWAY',
  'TURNOVER_GIVEAWAY_UNFORCED'
)

#' squadSummaryFile_lookup
#'
#' This DF acts as a lookup table containing all the metrics contained in the squad summary file, the names of those metrics as they existed in the old file on the support site (squadSummaryFileMetricNames) and their names now in the API (squadSummaryFilePlatformMetricNames) 
#' @keywords internal
squadSummaryFile_lookup <- data.frame("SF_METRIC_CODE"      = squadSummaryFileMetricNames , 
                                      "PLATFORM_METRIC_CODE"= squadSummaryFilePlatformMetricNames) %>%
  add_row(SF_METRIC_CODE = 'INTERCEPT_OTHER_KO', PLATFORM_METRIC_CODE = 'INTERCEPT_KNOCK_ON')

#' squadSummaryFile_roundedMetrics1DP
#'
#' This vector contains the collection of metrics that need to be rounded to 1 decimal place in getSquadSummaryFile()
#' @keywords internal
squadSummaryFile_roundedMetrics1DP <- c('METRES_GAINED_HANDBALL',
                                        'METRES_GAINED_KICK',
                                        'METRES_GAINED',
                                        'PLAYER_RATING',
                                        'PLAYER_RATING_BALL_USE',
                                        'PLAYER_RATING_BALL_WINNING',
                                        'PLAYER_RATING_DEFENCE',
                                        'PLAYER_RATING_BALL_USE_FIELD_KICK',
                                        'PLAYER_RATING_HITOUT',
                                        'PLAYER_RATING_DEFENCE_PRESSURE',
                                        'PLAYER_RATING_BALL_USE_SHOT_AT_GOAL',
                                        'POINTS_EXPECTED',
                                        'PRESSURE_POINTS_SQ',
                                        'RANKING_POINTS')

#' squadSummaryFile_roundedMetrics0DP
#'
#' This vector contains the collection of metrics that need to be rounded to 0 decimal places in getSquadSummaryFile()
#' @keywords internal
squadSummaryFile_roundedMetrics0DP <- c('METRES_GAINED_ASSISTED',
                                        'METRES_GAINED_EFFECTIVE',
                                        'METRES_GAINED_NET',
                                        'METRES_GAINED_RETAIN',
                                        'CHAIN_METRES',
                                        'CHAIN_METRES_BU',
                                        'CHAIN_METRES_CB',
                                        'CHAIN_METRES_KI',
                                        'CHAIN_METRES_NET',
                                        'CHAIN_METRES_NET_BU',
                                        'CHAIN_METRES_NET_CB',
                                        'CHAIN_METRES_NET_KI',
                                        'CHAIN_METRES_NET_INT',
                                        'CHAIN_METRES_NET_ST',
                                        'CHAIN_METRES_NET_TI',
                                        'CHAIN_METRES_INT',
                                        'CHAIN_METRES_REPLY',
                                        'CHAIN_METRES_REPLY_BU',
                                        'CHAIN_METRES_REPLY_CB',
                                        'CHAIN_METRES_REPLY_KI',
                                        'CHAIN_METRES_REPLY_INT',
                                        'CHAIN_METRES_REPLY_ST',
                                        'CHAIN_METRES_REPLY_TI',
                                        'CHAIN_METRES_ST',
                                        'CHAIN_METRES_TI')

#' getSquadSummaryFileExposedFields
#'
#' This vector contains all of the fields we're exposing in the getSquadSummaryFile() function
#' @keywords internal
getSquadSummaryFileExposedFields <- c("MATCH_ID",
                                      "SEASON_ID" , 
                                      "GROUP_ROUND_NO" , 
                                      "VENUE_NAME" , 
                                      "SQUAD_NAME" , 
                                      "OPP_SQUAD_NAME" , 
                                      "SQUAD_MARGIN",
                                      "PERIOD",
                                      "MARGIN" , 
                                      "ZONE_LOGICAL_AFL",
                                      squadSummaryFileMetricNames
) 

#' matchDetailsCols
#'
#' This vector contains all of the fields we want to pull from the call to match details in the getSquadSummaryFile() AND getPlayerSummaryFile() functions.
#' @keywords internal
matchDetailsCols <- c("leagueId", "seasonId", "roundNumber", "id", "venue.name", "home.name", "home.id", "home.score.points","away.name", "away.id", "away.score.points", "period", "periodSecs")

#' zonedMetrics_PlatformNames_Player
#'
#' The ZONED metrics that go into the POST payload in getPlayerSummaryFile()
#' @keywords internal
zonedMetrics_PlatformNames_Player <- c(
  "CLEARANCE_BU", "FIRST_POSSESSION_BU", "HITOUT_BU", "HITOUT_SHARKED_BU", 
  "BAULK", "BAULKED", "BEHIND", "BEHIND_ASSIST", "BLOCK", "TACKLE_BREAK", 
  "HITOUT_TO_ADVANTAGE_BU", "CLANGER", 
  "KICK_GROUND_CLANGER", "HANDBALL_CLANGER", "KICK_CLANGER", 
  "KNOCK_ON_CONTESTED", "MARK_CONTESTED", "MARK_CONTESTED_OPPOSITION", 
  "MARK_CONTESTED_SQ", "POSSESSION_CONTESTED", "POSSESSION_CONTESTED_GP", 
  "POSSESSION_CONTESTED_PREC", "CRUMB", "DISPOSAL", "DISPOSAL_GP", 
  "DISPOSAL_PREC", "DISPOSAL_EFFECTIVE", "KICK_GROUND_EFFECTIVE", 
  "HANDBALL_EFFECTIVE", "KICK_EFFECTIVE", "INTERCEPT_GROUND_KICK","INTERCEPT_KNOCK_ON",
  "FIRST_POSSESSION_CLEARANCE", "FREE_KICK_AGAINST", "FREE_KICK_AGAINST_GENERAL", 
  "FREE_KICK_AGAINST_MARKING", "FREE_KICK_AGAINST_RUCK", "FREE_KICK_AGAINST_TACKLING", 
  "FREE_KICK", "FREE_KICK_OFF_BALL", "FREE_KICK_IN_CONTEST", "FREE_KICK_GP", 
  "FREE_KICK_PREC", "GATHER", "GATHER_HITOUT", "GOAL", "GOAL_ASSIST", 
  "GROUNDBALL_GET", "GROUNDBALL_GET_GP", "GROUNDBALL_GET_PREC", "KICK_GROUND", 
  "HANDBALL", "METRES_GAINED_HANDBALL", "HARDBALL_GET", "HARDBALL_GET_GP", 
  "HARDBALL_GET_PREC", "HOLD", "INSIDE_50_KICK", "INSIDE_50_KICK_LOSS", 
  "INSIDE_50_KICK_RETAIN_MARK", "INSIDE_50_KICK_RETAIN", "KICK_GROUND_INEFFECTIVE", 
  "HANDBALL_INEFFECTIVE", "KICK_INEFFECTIVE", "INSIDE_50", "INTERCEPT", 
  "INTERCEPT_MARK_CONTESTED", "INTERCEPT_FREE_KICK", "INTERCEPT_GATHER", 
  "INTERCEPT_GROUNDBALL_GET", "INTERCEPT_HARDBALL_GET", "INTERCEPT_LOOSEBALL_GET", 
  "INTERCEPT_MARK", "INTERCEPT_OUT_ON_FULL_KICK_IN", "INTERCEPT_MARK_UNCONTESTED", 
  "KICK", "KICK_EFFECTIVE_BACKWARDS", "METRES_GAINED_KICK", "KICK_IN", 
  "KICK_IN_CLANGER", "KICK_IN_INEFFECTIVE", "KNOCK_ON", "KICK_EFFECTIVE_LONG", 
  "LOOSEBALL_GET", "LOOSEBALL_GET_GP", "LOOSEBALL_GET_PREC", "PENALTY_50M_AGAINST", 
  "MARK", "MARK_DROPPED", "MARK_FUMBLED", "MARK_ON_LEAD", "MARK_PLAY_ON", 
  "SHOT_AT_GOAL_MISSED", "TACKLE_MISSED", "ERROR_NO_PRESSURE", 
  "HARDBALL_GET_GROUNDBALL", "OUT_ON_FULL", "POSSESSION","RANKING_POINTS", "REBOUND_50", 
  "HANDBALL_RECEIVE", "DISPOSAL_RETAIN", "HANDBALL_RETAIN", "KICK_RETAIN", 
  "HARDBALL_GET_RUCK", "TACKLE_RUN_DOWN", "RUNNING_BOUNCE", "POINTS", 
  "SCORE_ASSIST", "SCORING_SHOT", "KICK_EFFECTIVE_SHORT", "SHOT_AT_GOAL", 
  "SMOTHER", "SPOIL", "SPOIL_GAINING_POSSESSION", "SPOIL_INEFFECTIVE", 
  "TACKLE", "TACKLE_GP", "TACKLE_PREC", "CLEARANCE_TI", "FIRST_POSSESSION_TI", 
  "HITOUT_TI", "HITOUT_SHARK_TI", "HITOUT_SHARKED_TI", "HITOUT_TO_ADVANTAGE_TI", 
  "TURNOVER", "GATHER_UNCONTESTED", "MARK_UNCONTESTED", "MARK_UNCONTESTED_OPPOSITION", 
  "MARK_UNCONTESTED_SQ", "POSSESSION_UNCONTESTED", "TIME_ON_GROUND_LOOSE", 
  "KICK_DIRECTION_FORWARD", "KICK_DIRECTION_FORWARD_NON_SET", 
  "KICK_DIRECTION_FORWARD_SET", "KICK_DISTANCE_LONG", "PRESSURE_ACT", 
  "PRESSURE_ACT_GP", "PRESSURE_ACT_PREC", "TACKLE_ATTEMPT", "TACKLE_INEFFECTIVE", 
  "PRESSURE_POINTS", "PRESSURE_POINTS_GP", "PRESSURE_POINTS_PREC", 
  "PRESSURE_ACT_CHASING", "PRESSURE_ACT_CLOSING", "PRESSURE_ACT_CORRALLING", 
  "PRESSURE_ACT_PHYSICAL", "KICK_DISTANCE_SHORT", "PRESSURE_ACT_FORCED_TURNOVER", 
  "PRESSURE_ACT_FORCED_TURNOVER_POINTS", "CLEARANCE_BU_EFFECTIVE", 
  "ONE_ON_ONE_DEFENDER", "ONE_ON_ONE_DEFENDER_LOSS", "ONE_ON_ONE_DEFENDER_NEUTRAL", 
  "ONE_ON_ONE_DEFENDER_WIN", "ONE_ON_ONE_TARGET", "ONE_ON_ONE_TARGET_LOSS", 
  "ONE_ON_ONE_TARGET_NEUTRAL", "ONE_ON_ONE_TARGET_WIN", "CLEARANCE_EFFECTIVE", 
  "POINTS_EXPECTED", "CLEARANCE_INEFFECTIVE", "METRES_GAINED_ASSISTED", 
  "METRES_GAINED_EFFECTIVE", "METRES_GAINED_NET", "METRES_GAINED_RETAIN", 
  "PLAYER_RATING_BALL_USE", "PLAYER_RATING_BALL_WINNING", "PLAYER_RATING_DEFENCE", 
  "PLAYER_RATING_BALL_USE_FIELD_KICK", 
  "PLAYER_RATING_DEFENCE_PRESSURE", "PLAYER_RATING_BALL_USE_SHOT_AT_GOAL", 
  "CLEARANCE_TI_EFFECTIVE", "TURNOVER_CLEARING_STOPPAGE", 
  "TURNOVER_GENERAL_PLAY", "TURNOVER_GIVEAWAY", "TURNOVER_OPPOSITION_TAKEAWAY", 
  "TURNOVER_GIVEAWAY_UNFORCED",  "CLEARANCE",
  "FIRST_POSSESSION",
  "HITOUT_SHARK",
  "HITOUT_SHARKED",
  "HITOUT_TO_ADVANTAGE",
  "HITOUT",
  "PLAYER_RATING_HITOUT"
)

#' zonelessMetrics_PlatformNames_Player
#'
#' The ZONELESS metrics that go into the POST payload in getPlayerSummaryFile()
#' @keywords internal
zonelessMetrics_PlatformNames_Player <- c(
  "RUCK_CONTEST_BU",
  "ABSENCE_CENTRE_BOUNCE",
  "ABSENCE_CENTRE_BOUNCE_LOSS",
  "ABSENCE_CENTRE_BOUNCE_WIN",
  "ATTENDANCE_CENTRE_BOUNCE",
  "ATTENDANCE_CENTRE_BOUNCE_LOSS",
  "ATTENDANCE_CENTRE_BOUNCE_WIN",
  "CLEARANCE_CB_EFFECTIVE",
  "RUCK_CONTEST_CB",
  "INSIDE_50_TARGET",
  "INSIDE_50_TARGET_CHANCE",
  "INSIDE_50_TARGET_CHANCE_PLAYER_RETAIN",
  "INSIDE_50_TARGET_CHANCE_PLAYER_SCORE",
  "INSIDE_50_TARGET_CHANCE_TEAM_RETAIN",
  "INSIDE_50_TARGET_CHANCE_TEAM_SCORE",
  "INTERCHANGE_OFF",
  "KICK_IN_EFFECTIVE",
  "KICK_IN_PLAY_ON",
  "PLAYER_RATING",
  "REBOUND_50_LOSS_CP",
  "REBOUND_50_LOSS_UP",
  "REBOUND_50_RETAIN_RUN",
  "REBOUND_50_RETAIN_CP",
  "REBOUND_50_RETAIN_UP",
  "RUCK_CONTEST",
  "SCOREBOARD_IMPACT",
  "SCORE_INVOLVEMENT",
  "CHAIN_LAUNCH_SCORE",
  "RUCK_CONTEST_TI",
  "TIME_ON_GROUND_DEFENCE",
  "TIME_ON_GROUND_FORWARD",
  "TIME_ON_GROUND_MIDFIELD",
  "TIME_ON_GROUND_RUCK",
  "TIME_ON_GROUND_WING",
  # "TIME_ON_GROUND_MATCHUPS",   ## THIS IS FLAGGING INVALID
  "TIME_ON_GROUND",
  "METRES_GAINED",
  "FIRST_POSSESSION_CB", 
  "HITOUT_SHARKED_CB", 
  "HITOUT_TO_ADVANTAGE_CB",
  "CLEARANCE_CB",
  "HITOUT_CB",
  "CLEARANCE",
  "FIRST_POSSESSION",
  "HITOUT_SHARK",
  "HITOUT_SHARKED",
  "HITOUT_TO_ADVANTAGE",
  "HITOUT",
  "PLAYER_RATING_HITOUT",
  "RANKING_POINTS"
)

#' playerSummaryFile_roundedMetrics1DP
#'
#' This vector contains the collection of metrics that need to be rounded to 1 decimal place in getPlayerSummaryFile()
#' @keywords internal
playerSummaryFile_roundedMetrics1DP<-c('METRES_GAINED_HANDBALL',
                                       'METRES_GAINED_KICK',
                                       'METRES_GAINED',
                                       'PLAYER_RATING',
                                       'PLAYER_RATING_BALL_USE',
                                       'PLAYER_RATING_BALL_WINNING',
                                       'PLAYER_RATING_DEFENCE',
                                       'PLAYER_RATING_BALL_USE_FIELD_KICK',
                                       'PLAYER_RATING_HITOUT',
                                       'PLAYER_RATING_DEFENCE_PRESSURE',
                                       'PLAYER_RATING_BALL_USE_SHOT_AT_GOAL',
                                       'POINTS_EXPECTED',
                                       'RANKING_POINTS'
)

#' playerSummaryFile_roundedMetrics0DP
#'
#' This vector contains the collection of metrics that need to be rounded to 0 decimal places in getPlayerSummaryFile()
#' @keywords internal
playerSummaryFile_roundedMetrics0DP<-c('METRES_GAINED_ASSISTED',
                                       'METRES_GAINED_EFFECTIVE',
                                       'METRES_GAINED_NET',
                                       'METRES_GAINED_RETAIN'
)

#' playerSummaryFileMetricNames
#'
#' This vector contains the namees of all the metrics as they appeared in the old Player Summary files available on the support site. This should map 1:1 with squadSummaryFilePlatformMetricNames (used in getSquadSummaryFile())
#' @keywords internal
playerSummaryFileMetricNames <- c(
  'BALL_UP_CLEARANCE',
  'BALL_UP_FIRST_POSSESSION',
  'BALL_UP_HITOUT',
  'BALL_UP_HITOUT_SHARKED',
  'BAULK',
  'BAULKED',
  'BEHIND',
  'BEHIND_ASSIST',
  'BLOCK',
  'BROKEN_TACKLE',
  'BU_HITOUT_TO_ADVANTAGE',
  'CB_FIRST_POSSESSION',
  'CB_HITOUT_SHARKED',
  'CB_HITOUT_TO_ADVANTAGE',
  'CENTRE_BOUNCE_CLEARANCE',
  'CENTRE_BOUNCE_HITOUT',
  'CLANGER',
  'CLANGER_GROUND_KICK',
  'CLANGER_HANDBALL',
  'CLANGER_KICK',
  'CLEARANCE',
  'CONTESTED_KNOCK_ON',
  'CONTESTED_MARK',
  'CONTESTED_MARK_FROM_OPP',
  'CONTESTED_MARK_FROM_TEAM',
  'CONTESTED_POSSESSION',
  'CONTESTED_POSSESSION_POST',
  'CONTESTED_POSSESSION_PRE',
  'CRUMB',
  'DISPOSAL',
  'DISPOSAL_POST',
  'DISPOSAL_PRE',
  'EFFECTIVE_DISPOSAL',
  'EFFECTIVE_GROUND_KICK',
  'EFFECTIVE_HANDBALL',
  'EFFECTIVE_KICK',
  'FIRST_POSSESSION',
  'FIRST_POSSESSION_TO_CLEAR',
  'FREE_AGAINST',
  'FREE_AGAINST_GENERAL',
  'FREE_AGAINST_MARKING',
  'FREE_AGAINST_RUCK',
  'FREE_AGAINST_TACKLING',
  'FREE_FOR',
  'FREE_FOR_OFF_BALL',
  'FREE_FOR_ON_BALL',
  'FREE_FOR_POST',
  'FREE_FOR_PRE',
  'GATHER',
  'GATHER_FROM_HITOUT',
  'GOAL',
  'GOAL_ASSIST',
  'GROUND_BALL_GET',
  'GROUND_BALL_GET_POST',
  'GROUND_BALL_GET_PRE',
  'GROUND_KICK',
  'HANDBALL',
  'HANDBALL_GAIN_METRES',
  'HARD_BALL_GET',
  'HARD_BALL_GET_POST',
  'HARD_BALL_GET_PRE',
  'HIT_OUT_SHARK',
  'HIT_OUT_SHARKED',
  'HIT_OUT_TO_ADVANTAGE',
  'HITOUT',
  'HOLD',
  'IN50_KICK',
  'IN50_KICK_LOSE',
  'IN50_KICK_MARK',
  'IN50_KICK_RETAIN',
  'IN50_TARGET',
  'IN50_TARGET_PLAY_RET',
  'IN50_TARGET_PLAY_SCORE',
  'IN50_TARGET_TEAM_RET',
  'IN50_TARGET_TEAM_SCORE',
  'INEFFECTIVE_GROUND_KICK',
  'INEFFECTIVE_HANDBALL',
  'INEFFECTIVE_KICK',
  'INSIDE_50',
  'INT_OFF_TOTAL',
  'INTERCEPT',
  'INTERCEPT_CM',
  'INTERCEPT_FREE',
  'INTERCEPT_GATHER',
  'INTERCEPT_GBG',
  'INTERCEPT_HBG',
  'INTERCEPT_LBG',
  'INTERCEPT_MARK',
  'INTERCEPT_OOFKI',
  'INTERCEPT_OTHER',
  'INTERCEPT_UM',
  'KICK',
  'KICK_BACKWARDS',
  'KICK_GAIN_METRES',
  'KICK_IN',
  'KICK_IN_CLANGER',
  'KICK_IN_EFFECTIVE',
  'KICK_IN_INEFFECTIVE',
  'KICK_IN_SELF',
  'KNOCK_ON',
  'LONG_KICK',
  'LOOSE_BALL_GET',
  'LOOSE_BALL_GET_POST',
  'LOOSE_BALL_GET_PRE',
  'M50M_PENALTY_AGAINST',
  'MARK',
  'MARK_DROPPED',
  'MARK_FUMBLED',
  'MARK_ON_LEAD',
  'MARK_PLAY_ON',
  'MISSED_SHOT',
  'MISSED_TACKLE',
  'NO_PRESSURE_ERROR',
  'NON_RUCK_HARD_BALL_GET',
  'OUT_ON_FULL',
  'POSSESSION',
  'RANKING_PTS',
  'RE50_RESULT_OPP_CP',
  'RE50_RESULT_OPP_UP',
  'RE50_RESULT_OTHER',
  'RE50_RESULT_RUN',
  'RE50_RESULT_TEAM_CP',
  'RE50_RESULT_TEAM_UP',
  'REBOUND_50',
  'RECEIVE_HANDBALL',
  'RETAIN_DISPOSAL',
  'RETAIN_HANDBALL',
  'RETAIN_KICK',
  'RUCK_HARD_BALL_GET',
  'RUNDOWN_TACKLE',
  'RUNNING_BOUNCE',
  'SCORE',
  'SCORE_ASSIST',
  'SCORE_INVOLVEMENT',
  'SCORE_LAUNCH',
  'SCOREBOARD_IMPACT',
  'SCORING_SHOTS',
  'SHORT_KICK',
  'SHOT_AT_GOAL',
  'SMOTHER',
  'SPOIL',
  'SPOIL_GAINING_POSSESSION',
  'SPOIL_INEFFECTIVE',
  'TACKLE',
  'TACKLE_POST',
  'TACKLE_PRE',
  'THROW_IN_CLEARANCE',
  'THROW_IN_FIRST_POSSESSION',
  'THROW_IN_HITOUT',
  'THROW_IN_HITOUT_SHARK',
  'THROW_IN_HITOUT_SHARKED',
  'TI_HITOUT_TO_ADVANTAGE',
  'TOG_PERIOD_SECS',
  'TOG_PLAYED_SECS',
  'TOTAL_GAINED_METRES',
  'TURNOVER',
  'UNCONTESTED_GATHER',
  'UNCONTESTED_MARK',
  'UNCONTESTED_MARK_FROM_OPP',
  'UNCONTESTED_MARK_FROM_TEAM',
  'UNCONTESTED_POSSESSION',
  'BALL_UP_VERSUS',
  'CB_ABSENT',
  'CB_ABSENT_OPP_CLEAR',
  'CB_ABSENT_TEAM_CLEAR',
  'CB_ATTEND',
  'CB_ATTEND_OPP_CLEAR',
  'CB_ATTEND_TEAM_CLEAR',
  'CENTRE_BOUNCE_VERSUS',
  'RUCK_CONTEST',
  'THROW_IN_VERSUS',
  'TIME_IN_POS_DEFENCE',
  'TIME_IN_POS_FORWARD',
  'TIME_IN_POS_LD',
  'TIME_IN_POS_MIDFIELD',
  'TIME_IN_POS_RUC',
  'TIME_IN_POS_W',
  'IN50_TARGET_CHANCE',
  'KICK_FWD',
  'KICK_FWD_GEN',
  'KICK_FWD_SET',
  'LONG_KICK_FROM_POSS',
  'PLAYER_PRESSURE_ACT',
  'PLAYER_PRESSURE_ACT_POST',
  'PLAYER_PRESSURE_ACT_PRE',
  'PLY_ATTEMPTED_TACKLE',
  'PLY_INEFFECTIVE_TACKLE',
  'PLY_PRESS_PTS',
  'PLY_PRESS_PTS_POST',
  'PLY_PRESS_PTS_PRE',
  'PLY_PRES_IMP_CHASING',
  'PLY_PRES_IMP_CLOSING',
  'PLY_PRES_IMP_CORRALLING',
  'PLY_PRES_PHYSICAL',
  'SHORT_KICK_FROM_POSS',
  'TURNOVER_FORCED',
  'TURNOVER_FORCED_PTS',
  'BU_EFFECTIVE_CLEARANCE',
  'CB_EFFECTIVE_CLEARANCE',
  'CONTEST_DEFENDER',
  'CONTEST_DEF_LOSE',
  'CONTEST_DEF_NEUTRAL',
  'CONTEST_DEF_WIN',
  'CONTEST_TARGET',
  'CONTEST_TARG_LOSE',
  'CONTEST_TARG_NEUTRAL',
  'CONTEST_TARG_WIN',
  'EFFECTIVE_CLEARANCE',
  'EXPECTED_SCORE',
  'INEFFECTIVE_CLEARANCE',
  'METRES_GAINED_ASSISTED',
  'METRES_GAINED_EFF',
  'METRES_GAINED_NET',
  'METRES_GAINED_RETAINED',
  'RATING',
  'RATING_BALL_USE',
  'RATING_BALL_WINNING',
  'RATING_DEFENCE',
  'RATING_FIELD_KICKS',
  'RATING_HITOUTS',
  'RATING_PRESSURE',
  'RATING_SHOTS',
  'TI_EFFECTIVE_CLEARANCE',
  'TURNOVER_CLEARING_STOPPAGE',
  'TURNOVER_GENERAL_PLAY',
  'TURNOVER_GIVEAWAY',
  'TURNOVER_TAKEAWAY',
  'TURNOVER_UNFORCED_GIVEAWAY'
)


#' playerSummaryFilePlatformMetricNames
#'
#' This vector contains the PLATFORM/API metric names of all the metrics that were in the Player Summary file on the support site. This should map 1:1 with squadSummaryFileMetricNames (used in getSquadSummaryFile())
#' @keywords internal
playerSummaryFilePlatformMetricNames <- c(
  'CLEARANCE_BU',
  'FIRST_POSSESSION_BU',
  'HITOUT_BU',
  'HITOUT_SHARKED_BU',
  'BAULK',
  'BAULKED',
  'BEHIND',
  'BEHIND_ASSIST',
  'BLOCK',
  'TACKLE_BREAK',
  'HITOUT_TO_ADVANTAGE_BU',
  'FIRST_POSSESSION_CB',
  'HITOUT_SHARKED_CB',
  'HITOUT_TO_ADVANTAGE_CB',
  'CLEARANCE_CB',
  'HITOUT_CB',
  'CLANGER',
  'KICK_GROUND_CLANGER',
  'HANDBALL_CLANGER',
  'KICK_CLANGER',
  'CLEARANCE',
  'KNOCK_ON_CONTESTED',
  'MARK_CONTESTED',
  'MARK_CONTESTED_OPPOSITION',
  'MARK_CONTESTED_SQ',
  'POSSESSION_CONTESTED',
  'POSSESSION_CONTESTED_GP',
  'POSSESSION_CONTESTED_PREC',
  'CRUMB',
  'DISPOSAL',
  'DISPOSAL_GP',
  'DISPOSAL_PREC',
  'DISPOSAL_EFFECTIVE',
  'KICK_GROUND_EFFECTIVE',
  'HANDBALL_EFFECTIVE',
  'KICK_EFFECTIVE',
  'FIRST_POSSESSION',
  'FIRST_POSSESSION_CLEARANCE',
  'FREE_KICK_AGAINST',
  'FREE_KICK_AGAINST_GENERAL',
  'FREE_KICK_AGAINST_MARKING',
  'FREE_KICK_AGAINST_RUCK',
  'FREE_KICK_AGAINST_TACKLING',
  'FREE_KICK',
  'FREE_KICK_OFF_BALL',
  'FREE_KICK_IN_CONTEST',
  'FREE_KICK_GP',
  'FREE_KICK_PREC',
  'GATHER',
  'GATHER_HITOUT',
  'GOAL',
  'GOAL_ASSIST',
  'GROUNDBALL_GET',
  'GROUNDBALL_GET_GP',
  'GROUNDBALL_GET_PREC',
  'KICK_GROUND',
  'HANDBALL',
  'METRES_GAINED_HANDBALL',
  'HARDBALL_GET',
  'HARDBALL_GET_GP',
  'HARDBALL_GET_PREC',
  'HITOUT_SHARK',
  'HITOUT_SHARKED',
  'HITOUT_TO_ADVANTAGE',
  'HITOUT',
  'HOLD',
  'INSIDE_50_KICK',
  'INSIDE_50_KICK_LOSS',
  'INSIDE_50_KICK_RETAIN_MARK',
  'INSIDE_50_KICK_RETAIN',
  'INSIDE_50_TARGET',
  'INSIDE_50_TARGET_CHANCE_PLAYER_RETAIN',
  'INSIDE_50_TARGET_CHANCE_PLAYER_SCORE',
  'INSIDE_50_TARGET_CHANCE_TEAM_RETAIN',
  'INSIDE_50_TARGET_CHANCE_TEAM_SCORE',
  'KICK_GROUND_INEFFECTIVE',
  'HANDBALL_INEFFECTIVE',
  'KICK_INEFFECTIVE',
  'INSIDE_50',
  'INTERCHANGE_OFF',
  'INTERCEPT',
  'INTERCEPT_MARK_CONTESTED',
  'INTERCEPT_FREE_KICK',
  'INTERCEPT_GATHER',
  'INTERCEPT_GROUNDBALL_GET',
  'INTERCEPT_HARDBALL_GET',
  'INTERCEPT_LOOSEBALL_GET',
  'INTERCEPT_MARK',
  'INTERCEPT_OUT_ON_FULL_KICK_IN',
  'INTERCEPT_GROUND_KICK',
  'INTERCEPT_MARK_UNCONTESTED',
  'KICK',
  'KICK_EFFECTIVE_BACKWARDS',
  'METRES_GAINED_KICK',
  'KICK_IN',
  'KICK_IN_CLANGER',
  'KICK_IN_EFFECTIVE',
  'KICK_IN_INEFFECTIVE',
  'KICK_IN_PLAY_ON',
  'KNOCK_ON',
  'KICK_EFFECTIVE_LONG',
  'LOOSEBALL_GET',
  'LOOSEBALL_GET_GP',
  'LOOSEBALL_GET_PREC',
  'PENALTY_50M_AGAINST',
  'MARK',
  'MARK_DROPPED',
  'MARK_FUMBLED',
  'MARK_ON_LEAD',
  'MARK_PLAY_ON',
  'SHOT_AT_GOAL_MISSED',
  'TACKLE_MISSED',
  'ERROR_NO_PRESSURE',
  'HARDBALL_GET_GROUNDBALL',
  'OUT_ON_FULL',
  'POSSESSION',
  'RANKING_POINTS',
  'REBOUND_50_LOSS_CP',
  'REBOUND_50_LOSS_UP',
  'UNMAPPED',
  'REBOUND_50_RETAIN_RUN',
  'REBOUND_50_RETAIN_CP',
  'REBOUND_50_RETAIN_UP',
  'REBOUND_50',
  'HANDBALL_RECEIVE',
  'DISPOSAL_RETAIN',
  'HANDBALL_RETAIN',
  'KICK_RETAIN',
  'HARDBALL_GET_RUCK',
  'TACKLE_RUN_DOWN',
  'RUNNING_BOUNCE',
  'POINTS',
  'SCORE_ASSIST',
  'SCORE_INVOLVEMENT',
  'CHAIN_LAUNCH_SCORE',
  'SCOREBOARD_IMPACT',
  'SCORING_SHOT',
  'KICK_EFFECTIVE_SHORT',
  'SHOT_AT_GOAL',
  'SMOTHER',
  'SPOIL',
  'SPOIL_GAINING_POSSESSION',
  'SPOIL_INEFFECTIVE',
  'TACKLE',
  'TACKLE_GP',
  'TACKLE_PREC',
  'CLEARANCE_TI',
  'FIRST_POSSESSION_TI',
  'HITOUT_TI',
  'HITOUT_SHARK_TI',
  'HITOUT_SHARKED_TI',
  'HITOUT_TO_ADVANTAGE_TI',
  'TIME_ON_GROUND_MATCHUPS',
  'TIME_ON_GROUND',
  'METRES_GAINED',
  'TURNOVER',
  'GATHER_UNCONTESTED',
  'MARK_UNCONTESTED',
  'MARK_UNCONTESTED_OPPOSITION',
  'MARK_UNCONTESTED_SQ',
  'POSSESSION_UNCONTESTED',
  'RUCK_CONTEST_BU',
  'ABSENCE_CENTRE_BOUNCE',
  'ABSENCE_CENTRE_BOUNCE_LOSS',
  'ABSENCE_CENTRE_BOUNCE_WIN',
  'ATTENDANCE_CENTRE_BOUNCE',
  'ATTENDANCE_CENTRE_BOUNCE_LOSS',
  'ATTENDANCE_CENTRE_BOUNCE_WIN',
  'RUCK_CONTEST_CB',
  'RUCK_CONTEST',
  'RUCK_CONTEST_TI',
  'TIME_ON_GROUND_DEFENCE',
  'TIME_ON_GROUND_FORWARD',
  'TIME_ON_GROUND_LOOSE',
  'TIME_ON_GROUND_MIDFIELD',
  'TIME_ON_GROUND_RUCK',
  'TIME_ON_GROUND_WING',
  'INSIDE_50_TARGET_CHANCE',
  'KICK_DIRECTION_FORWARD',
  'KICK_DIRECTION_FORWARD_NON_SET',
  'KICK_DIRECTION_FORWARD_SET',
  'KICK_DISTANCE_LONG',
  'PRESSURE_ACT',
  'PRESSURE_ACT_GP',
  'PRESSURE_ACT_PREC',
  'TACKLE_ATTEMPT',
  'TACKLE_INEFFECTIVE',
  'PRESSURE_POINTS',
  'PRESSURE_POINTS_GP',
  'PRESSURE_POINTS_PREC',
  'PRESSURE_ACT_CHASING',
  'PRESSURE_ACT_CLOSING',
  'PRESSURE_ACT_CORRALLING',
  'PRESSURE_ACT_PHYSICAL',
  'KICK_DISTANCE_SHORT',
  'PRESSURE_ACT_FORCED_TURNOVER',
  'PRESSURE_ACT_FORCED_TURNOVER_POINTS',
  'CLEARANCE_BU_EFFECTIVE',
  'CLEARANCE_CB_EFFECTIVE',
  'ONE_ON_ONE_DEFENDER',
  'ONE_ON_ONE_DEFENDER_LOSS',
  'ONE_ON_ONE_DEFENDER_NEUTRAL',
  'ONE_ON_ONE_DEFENDER_WIN',
  'ONE_ON_ONE_TARGET',
  'ONE_ON_ONE_TARGET_LOSS',
  'ONE_ON_ONE_TARGET_NEUTRAL',
  'ONE_ON_ONE_TARGET_WIN',
  'CLEARANCE_EFFECTIVE',
  'POINTS_EXPECTED',
  'CLEARANCE_INEFFECTIVE',
  'METRES_GAINED_ASSISTED',
  'METRES_GAINED_EFFECTIVE',
  'METRES_GAINED_NET',
  'METRES_GAINED_RETAIN',
  'PLAYER_RATING',
  'PLAYER_RATING_BALL_USE',
  'PLAYER_RATING_BALL_WINNING',
  'PLAYER_RATING_DEFENCE',
  'PLAYER_RATING_BALL_USE_FIELD_KICK',
  'PLAYER_RATING_HITOUT',
  'PLAYER_RATING_DEFENCE_PRESSURE',
  'PLAYER_RATING_BALL_USE_SHOT_AT_GOAL',
  'CLEARANCE_TI_EFFECTIVE',
  'TURNOVER_CLEARING_STOPPAGE',
  'TURNOVER_GENERAL_PLAY',
  'TURNOVER_GIVEAWAY',
  'TURNOVER_OPPOSITION_TAKEAWAY',
  'TURNOVER_GIVEAWAY_UNFORCED'
)

#' getPlayerSummaryFileExposedFields
#'
#' This vector contains all of the fields we're exposing in the getPlayerSummaryFile() function
#' @keywords internal
getPlayerSummaryFileExposedFields <- c("MATCH_ID",
                                       "SEASON_ID" , 
                                       "GROUP_ROUND_NO" , 
                                       "VENUE_NAME" ,
                                       "PERSON_ID" ,
                                       "FULLNAME" ,
                                       "SQUAD_NAME" , 
                                       "OPP_SQUAD_NAME" , 
                                       "SQUAD_MARGIN",
                                       "PERIOD",
                                       "MARGIN" , 
                                       "ZONE_LOGICAL_AFL",
                                       playerSummaryFileMetricNames) 

#' playerSummaryFile_lookup
#'
#' This DF acts as a lookup table containing all the metrics contained in the player summary file, the names of those metrics as they existed in the old file on the support site (playerSummaryFileMetricNames) and their names now in the API (playerSummaryFilePlatformMetricNames) 
#' @keywords internal
playerSummaryFile_lookup <- data.frame("SF_METRIC_CODE"     = playerSummaryFileMetricNames , 
                                       "PLATFORM_METRIC_CODE"= playerSummaryFilePlatformMetricNames) %>%
  add_row(SF_METRIC_CODE = 'INTERCEPT_OTHER_KO', PLATFORM_METRIC_CODE = 'INTERCEPT_KNOCK_ON')

#' getSquadPersonsExposedFields
#'
#' This vector contains all of the fields we're exposing in the getSquadPersons() function
#' @keywords internal
getSquadPersonsExposedFields <- c(
  season.id            = "seasonId",
  squad.name           = "name" , 
  squad.code           = "code",
  squad.id             = "id",
  name          = "players.fullname" ,    # CHANGE: fullname      = "players.fullname",
  display       = "players.displayName",  # CHANGE: display.name  = "players.displayName",
  firstname     = "players.firstname",
  surname       = "players.surname",
  id            = "players.personId",     # CHANGE: player.id            = "players.personId",
  jumper.no     = "players.jumperNumber", 
  DOB           = "players.dateOfBirth" , 
  age.season    = "players.ageSeason" ,   
  age.year      = "players.ageYear",
  age.today     = "players.ageToday",
  height        = "players.height",
  weight        = "weight" ,                       
  position.long = "players.position.description",
  position      = "players.position.name" ,        # CHANGE: position.short = "players.position.name" 
  position.code = "players.position.code",
  position.id   = "players.position.id",
  player.matches.season= "players.matches.season"
)



#' getPeriodScoresWhitelist
#'
#' This vector contains all the possible columns in the info portion of the getPeriodScores() function.
#' @keywords internal
getPeriodScoresWhitelist <- c(
  "away.id", "away.name", "away.code", "away.periods.period",
  "away.periods.goalsCumulative", "away.periods.behindsCumulative", "away.periods.pointsCumulative", "away.periods.marginCumulative",
  "away.periods.margin", "away.periods.result", "away.periods.resultCode", "away.periods.goals",
  "away.periods.behinds", "away.periods.points", "away.margin", "away.result",
  "away.resultCode", "away.goals", "away.behinds", "away.points",
  "home.id", "home.name", "home.code", "home.periods.period",
  "home.periods.goalsCumulative", "home.periods.behindsCumulative", "home.periods.pointsCumulative", "home.periods.marginCumulative",
  "home.periods.margin", "home.periods.result", "home.periods.resultCode", "home.periods.goals",
  "home.periods.behinds", "home.periods.points", "home.margin", "home.result",
  "home.resultCode", "home.goals", "home.behinds", "home.points",
  "matchId", "result", "resultCode", "winningSquadId"
)

#' getPeriodScoreExposedFields_cumulative
#'
#' This vector contains all of the fields we're exposing when cumulative = TRUE in the getPeriodScore() function
#' @keywords internal
getPeriodScoresExposedFields_cumulative <- c(
  match.id           = 'matchId',
  period             = 'home.periods.period',
  home.name    = 'home.name',
  home.code    = 'home.code',
  home.id      = 'home.id',
  home.goals   = 'home.periods.goalsCumulative',
  home.behinds = 'home.periods.behindsCumulative',
  home.points  = 'home.periods.pointsCumulative',
  home.margin  = 'home.periods.marginCumulative',
  home.period.result      = 'home.periods.result' , 
  home.period.result.code = 'home.periods.resultCode' ,
  home.match.result       = 'home.result' , 
  away.name    = 'away.name',
  away.code    = 'away.code',
  away.id      = 'away.id',
  away.goals   = 'away.periods.goalsCumulative',
  away.behinds = 'away.periods.behindsCumulative',
  away.points  = 'away.periods.pointsCumulative',
  away.margin  = 'away.periods.marginCumulative',
  away.period.result      = 'away.periods.result',
  away.period.result.code = 'away.periods.resultCode' ,
  away.match.result       = 'away.result' 
)

#' getPeriodScoresExposedFields
#'
#' This vector contains all of the fields we're exposing when cumulative = FALSE in the getPeriodScore() function
#' @keywords internal
getPeriodScoresExposedFields <- c(
  match.id     = 'matchId',
  period       = 'home.periods.period',
  home.name    = 'home.name',
  home.code    = 'home.code',
  home.id      = 'home.id',
  home.goals   = 'home.periods.goals',
  home.behinds = 'home.periods.behinds',
  home.points  = 'home.periods.points',
  home.margin  = 'home.periods.margin',
  home.period.result      = 'home.periods.result',
  home.period.result.code = 'home.periods.resultCode' ,
  home.match.result       = 'home.result' , 
  away.name    = 'away.name',
  away.code    = 'away.code',
  away.id      = 'away.id',
  away.goals   = 'away.periods.goals',
  away.behinds = 'away.periods.behinds',
  away.points  = 'away.periods.points',
  away.margin  = 'away.periods.margin',
  away.period.result      = 'away.periods.result',
  away.period.result.code = 'away.periods.resultCode' ,
  away.match.result       = 'away.result' 
)

#' getStoppagesWhitelist
#'
#' This vector contains all the possible columns in the info portion of the getStoppages() function.
#' @keywords internal
getStoppagesWhitelist <- c(
  "matchId",
  "stoppages.id", "stoppages.name", "stoppages.code", "stoppages.period",
  "stoppages.periodSeconds", "stoppages.location.x", "stoppages.location.y",
  "stoppages.location.xStd", "stoppages.location.yStd",
  "stoppages.attendance.id", "stoppages.attendance.name", "stoppages.attendance.code",
  "stoppages.attendance.period", "stoppages.attendance.periodSeconds",
  "stoppages.hitout.id", "stoppages.hitout.name",
  "stoppages.hitout.code", "stoppages.hitout.period", "stoppages.hitout.periodSeconds",
  "stoppages.hitout.player.displayName", "stoppages.hitout.player.fullname",
  "stoppages.hitout.player.personId", "stoppages.hitout.player.squadId",
  "stoppages.firstPossession.id", "stoppages.firstPossession.name",
  "stoppages.firstPossession.code", "stoppages.firstPossession.period",
  "stoppages.firstPossession.periodSeconds", "stoppages.firstPossession.zone",
  "stoppages.firstPossession.player.displayName", "stoppages.firstPossession.player.fullname",
  "stoppages.firstPossession.player.personId", "stoppages.firstPossession.player.squadId",
  "stoppages.clearance.id", "stoppages.clearance.name", "stoppages.clearance.code",
  "stoppages.clearance.period", "stoppages.clearance.periodSeconds", "stoppages.clearance.zone",
  "stoppages.clearance.player.displayName", "stoppages.clearance.player.fullname",
  "stoppages.clearance.player.personId", "stoppages.clearance.player.squadId",
  "stoppages.stoppageExit.id", "stoppages.stoppageExit.name", "stoppages.stoppageExit.code",
  "stoppages.stoppageExit.period", "stoppages.stoppageExit.periodSeconds", "stoppages.stoppageExit.zone",
  "stoppages.stoppageExit.type", "stoppages.stoppageExit.pressure",
  "stoppages.stoppageExit.player.displayName", "stoppages.stoppageExit.player.fullname",
  "stoppages.stoppageExit.player.personId", "stoppages.stoppageExit.player.squadId",
  "stoppages.stoppageExit.kicking.foot", "stoppages.stoppageExit.kicking.intent",
  "stoppages.stoppageExit.kicking.distance", "stoppages.stoppageExit.kicking.direction",
  "stoppages.stoppageExit.location.x", "stoppages.stoppageExit.location.y",
  "stoppages.stoppageExit.location.xStd", "stoppages.stoppageExit.location.yStd"
)

#' getStoppagesExposedFields
#'
#' This vector contains all of the fields we're exposing when cumulative = FALSE in the getStoppages() function
#' @keywords internal
getStoppagesExposedFields <- c(
  match.id                                  = "matchId",
  type.name                                 = "stoppages.name",
  type.code                                 = "stoppages.code",
  trx.id                                    = "stoppages.id",
  period                                    = "stoppages.period",
  period.seconds                            = "stoppages.periodSeconds",
  stoppage.location.x                       = "stoppages.location.x",
  stoppage.location.y                       = "stoppages.location.y",
  stoppage.location.standard.x              = "stoppages.location.xStd",
  stoppage.location.standard.y              = "stoppages.location.yStd",
  hitout.id                                 = "stoppages.hitout.id",
  hitout.name                               = "stoppages.hitout.name",
  hitout.code                               = "stoppages.hitout.code",
  hitout.period.seconds                     = "stoppages.hitout.periodSeconds",
  hitout.player.displayname                 = "stoppages.hitout.player.displayName",
  hitout.player.fullname                    = "stoppages.hitout.player.fullname",
  hitout.player.id                          = "stoppages.hitout.player.personId",
  hitout.player.squad.id                    = "stoppages.hitout.player.squadId",
  first.possession.id                       = "stoppages.firstPossession.id",
  first.possession.name                     = "stoppages.firstPossession.name",
  first.possession.code                     = "stoppages.firstPossession.code",
  first.possession.period.seconds           = "stoppages.firstPossession.periodSeconds",
  first.possession.zone                     = "stoppages.firstPossession.zone",
  first.possession.player.displayname       = "stoppages.firstPossession.player.displayName",
  first.possession.player.fullname          = "stoppages.firstPossession.player.fullname",
  first.possession.player.id                = "stoppages.firstPossession.player.personId",
  first.possession.player.squad.id          = "stoppages.firstPossession.player.squadId",
  clearance.id                              = "stoppages.clearance.id",
  clearance.name                            = "stoppages.clearance.name",
  clearance.code                            = "stoppages.clearance.code",
  clearance.period.seconds                  = "stoppages.clearance.periodSeconds",
  clearance.zone                            = "stoppages.clearance.zone",
  clearance.player.displayname              = "stoppages.clearance.player.displayName",
  clearance.player.fullname                 = "stoppages.clearance.player.fullname",
  clearance.player.id                       = "stoppages.clearance.player.personId",
  clearance.player.squad.id                 = "stoppages.clearance.player.squadId",
  exit.id                                   = "stoppages.stoppageExit.id",
  exit.name                                 = "stoppages.stoppageExit.name",
  exit.code                                 = "stoppages.stoppageExit.code",
  exit.period.seconds                       = "stoppages.stoppageExit.periodSeconds",
  exit.zone                                 = "stoppages.stoppageExit.zone",
  exit.type                                 = "stoppages.stoppageExit.type",
  exit.pressure                             = "stoppages.stoppageExit.pressure",
  exit.player.displayname                   = "stoppages.stoppageExit.player.displayName",
  exit.player.fullname                      = "stoppages.stoppageExit.player.fullname",
  exit.player.id                            = "stoppages.stoppageExit.player.personId",
  exit.player.squad.id                      = "stoppages.stoppageExit.player.squadId",
  exit.kicking.foot                         = "stoppages.stoppageExit.kicking.foot",
  exit.kicking.intent                       = "stoppages.stoppageExit.kicking.intent",
  exit.kicking.distance                     = "stoppages.stoppageExit.kicking.distance",
  exit.kicking.direction                    = "stoppages.stoppageExit.kicking.direction",
  exit.location.x                           = "stoppages.stoppageExit.location.x",
  exit.location.y                           = "stoppages.stoppageExit.location.y",
  exit.location.x.std                       = "stoppages.stoppageExit.location.xStd",
  exit.location.y.std                       = "stoppages.stoppageExit.location.yStd",
  attendance.name                           = "stoppages.attendance.name",
  attendance.code                           = "stoppages.attendance.code",
  attendance.id                             = "stoppages.attendance.id",
  attendance.period.seconds                 = "stoppages.attendance.periodSeconds"
)

#' getStoppages_homeNames
#'
#' This vector contains all of the column names for the HOME stoppage attendees used when stoppageAttendees = TRUE in getStoppages()
#' @keywords internal
getStoppages_homeNames <- c(
  "stoppages.id", 
  "stoppage.attendance.home.fullname1", 
  "stoppage.attendance.home.displayname1", 
  "stoppage.attendance.home.personId1", 
  "stoppage.attendance.home.fullname2", 
  "stoppage.attendance.home.displayname2", 
  "stoppage.attendance.home.personId2", 
  "stoppage.attendance.home.fullname3", 
  "stoppage.attendance.home.displayname3", 
  "stoppage.attendance.home.personId3", 
  "stoppage.attendance.home.fullname4", 
  "stoppage.attendance.home.displayname4", 
  "stoppage.attendance.home.personId4" 
)

#' getStoppages_awayNames
#'
#' This vector contains all of the column names for the AWAY stoppage attendees used when stoppageAttendees = TRUE in getStoppages()
#' @keywords internal
getStoppages_awayNames <- c(
  "stoppages.id", 
  "stoppage.attendance.away.fullname1", 
  "stoppage.attendance.away.displayname1", 
  "stoppage.attendance.away.personId1", 
  "stoppage.attendance.away.fullname2", 
  "stoppage.attendance.away.displayname2", 
  "stoppage.attendance.away.personId2", 
  "stoppage.attendance.away.fullname3", 
  "stoppage.attendance.away.displayname3", 
  "stoppage.attendance.away.personId3", 
  "stoppage.attendance.away.fullname4", 
  "stoppage.attendance.away.displayname4", 
  "stoppage.attendance.away.personId4" 
)

#' getFixtureWhitelist
#'
#' This vector contains all of the fields in the getFixture() function
#' @keywords internal
getFixtureWhitelist <- c(
  "competitionCode", "competitionId", "competitionName", "competitionType",
  "endDate", "endYear", "firstMatchStart", "code",
  "id", "matches.id", "matches.roundOrder", "matches.winningSquadId",
  "name", "number", "phaseNumber", "phases.id",
  "phases.name", "phases.code", "seasonId", "startDate",
  "startYear", "matches.squads.away.code", "matches.squads.away.id", "matches.squads.away.name",
  "matches.squads.away.score.goals", "matches.squads.away.score.behinds", "matches.squads.away.score.points", "matches.squads.home.code",
  "matches.squads.home.id", "matches.squads.home.name", "matches.squads.home.score.goals", "matches.squads.home.score.behinds",
  "matches.squads.home.score.points", "matches.date.startDate", "matches.date.startTime", "matches.date.utcMatchStart",
  "matches.status.period", "matches.status.periodSecs", "matches.status.periodDisplay", "matches.status.remainingSecs",
  "matches.status.remainingDisplay", "matches.status.remainingTime", "matches.status.id", "matches.status.name",
  "matches.status.code", "matches.status.typeId", "matches.status.typeName", "matches.type.id",
  "matches.type.name", "matches.type.code", "matches.venue.id", "matches.venue.code",
  "matches.venue.name", "matches.venue.timeZone"
)

#' getFixtureExposedFields
#'
#' This vector contains all of the fields we're exposing in the getFixture() function
#' @keywords internal
getFixtureExposedFields <- c(
  competition.name              = "competitionName", 
  competition.code              = "competitionCode", 
  competition.id                = "competitionId", 
  season.id                     = "seasonId", 
  season.start.date             = "startDate", 
  season.end.date               = "endDate", 
  round.phaseNumber             = "phaseNumber",                         # CHANGE: phase.round.number            = "phases.rounds_phaseNumber",
  phase.name                    = "phases.name",
  phase.code                    = "phases.code",
  phase.id                      = "phases.id", 
  round.number                  = "number",
  round.name                    = "name",
  round.code                    = "code",
  round.id                      = "id",
  venue.name                    = "matches.venue.name",
  venue.code                    = "matches.venue.code",
  venue.id                      = "matches.venue.id",
  venue.timezone                = "matches.venue.timeZone", 
  match.id                      = "matches.id",
  type.name                     = "matches.type.name",                    # CHANGE: match.type.name               = "type.name", 
  match.type.code               = "matches.type.code", 
  match.type.id                 = "matches.type.id", 
  match.order                   = "matches.roundOrder" ,                  # CHANGE: match.round.order             = "roundOrder",
  match.date                    = "matches.date.startDate",               # CHANGE: match.start.date              = "date.startDate", 
  match.time                    = "matches.date.startTime",               # CHANGE: match.start.time              = "date.startTime", 
  match.start                   = "matches.date.utcMatchStart",           # CHANGE: match.start.UTC               = "date.utcMatchStart",
  status.name                   = "matches.status.name" ,                 # CHANGE: #match.status.name            = "status.name", 
  match.status.code             = "matches.status.code", 
  status.id                     = "matches.status.id" ,                   # CHANGE:  match.status.id               = "status.id", 
  match.status.period           = "matches.status.period", 
  match.status.period.secs      = "matches.status.periodSecs",
  match.status.period.display   = "matches.status.periodDisplay",
  status.type.name              = "matches.status.typeName",              # CHANGE: match.status.type.name        = "status.typeName",
  status.type.id                = "matches.status.typeId" ,                       # REMOVE: redundant
  home.name                     = "matches.squads.home.name",             # CHANGE: home.squad.name               = "squads.home.name",
  home.code                     = "matches.squads.home.code",             # CHANGE: home.squad.code               = "squads.home.code",
  home.id                       = "matches.squads.home.id",               # CHANGE: home.squad.id                 = "squads.home.id", 
  home.goals                    = "matches.squads.home.score.goals",      # CHANGE: home.squad.goals              = "squads.home.score.goals",
  home.behinds                  = "matches.squads.home.score.behinds",    # CHANGE: home.squad.behinds            = "squads.home.score.behinds",
  home.points                   = "matches.squads.home.score.points",     # CHANGE: home.squad.points             = "squads.home.score.points",
  away.name                     = "matches.squads.away.name",             # CHANGE: away.squad.name               = "squads.away.name"
  away.code                     = "matches.squads.away.code",             # CHANGE: away.squad.code               = "squads.away.code", 
  away.id                       = "matches.squads.away.id",               # CHANGE: away.squad.id                 = "squads.away.id",
  away.goals                    = "matches.squads.away.score.goals",      # CHANGE: away.squad.goals              = "squads.away.score.goals",
  away.behinds                  = "matches.squads.away.score.behinds",    # CHANGE: away.squad.behinds            = "squads.away.score.behinds",
  away.points                   = "matches.squads.away.score.points",     # CHANGE: away.squad.points             = "squads.away.score.points",
  winning.squad.id.match        = "matches.winningSquadId"
  # These fields are dumb and/or repetitive 
    #"" = "competitionType", 
    #"" = "startYear", 
    #"" = "endYear", 
    #"" = "firstMatchStart"
    #"" = "status.typeId", 
  # These fields I dont think need exposing in this function (better served in getMatch)
    # "matches.status.remainingSecs" 
    # "matches.status.remainingDisplay"
    # "matches.status.remainingTime"
)

#' getMetricsWhitelist
#'
#' This vector contains all of the fields in the getMetrics() function
#' @keywords internal
getMetricsWhitelist <- c(
  "id", "code", "codeShort", "name",
  "namePlural", "nameShort", "nameDisplay", "description",
  "levelId", "level", "formatId", "format",
  "formatAvgId", "formatAvg", "transaction"
)

#' getMetricsExposedFields
#'
#' This vector contains all of the fields we're exposing in the getMetrics() function
#' @keywords internal
getMetricsExposedFields <- c(
  match.id               = "match.id" , 
  metric.level           = "level",
  metric.level.id        = "levelId",
  metric.code            = "code",
  metric.name            = "name",
  metric.id              = "id",
  metric.name.short      = "nameShort",
  metric.name.short.code = "codeShort",
  metric.name.plural     = "namePlural",
  metric.name.display    = "nameDisplay",
  metric.description     = "description",
  metric.format          = "format",
  metric.format.id       = "formatId",
  metric.format.avg      = "formatAvg",
  metric.format.avg.id   = "formatAvgId",
  metric.isTransactional = "transaction"
)

#' getSquadsWhitelist
#'
#' This vector contains all of the fields in the getSquads() function
#' @keywords internal
getSquadsWhitelist <- c(
  "homeState.id"  ,
  "homeState.name",
  "homeState.code",
  "seasonId"      ,
  "code"          ,
  "id"            ,
  "name"
)

#' getSquadsExposedFields_squad
#'
#' This vector contains all of the fields we're exposing in the getSquads() function WHEN a squadId is passed in 
#' @keywords internal
getSquadsExposedFields_squad <- c(
  season.id  = "seasonId"      ,
  squad.name = "name"          ,
  squad.code = "code"          ,
  squad.id   = "id"            ,
  state.name = "homeState.name",
  state.code = "homeState.code",
  state.id   = "homeState.id"  
)  

#' getSquadsExposedFields_all
#'
#' This vector contains all of the fields we're exposing in the getSquads() function WHEN a squadId IS NOT passed in 
#' @keywords internal
getSquadsExposedFields_all <- c(
  season.id  = "seasonId"      ,
  squad.name = "squads.name"   ,
  squad.code = "squads.code"   ,
  squad.id   = "squads.id"            
)  


