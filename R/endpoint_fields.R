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
                        "chains.metrics.chainMetres", "chains.metrics.chainMetresReply", "chains.metrics.chainMetresNet"
                        )

#' getChainsExposedFields
#'
#' This vector contains all the fields we're exposing in the getChains function and their equivalent renames.
#' @keywords internal
getChainsExposedFields <- c(match.id                  = "matchId",
                            squad.id                  = "chains.squad.id",
                            squad.name                = "chains.squad.name",
                            squad.code                = "chains.squad.code",
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
                                 plural        = 'squads.players_statistics_namePlural', 
                                 value         = 'squads.players_statistics_value',
                                 display       = 'squads.players_statistics_valueDisplay'
                                 )
#' getPlayerStatsMissingFields
#'
#' This vector contains all the fields that are not present when there is no data to unnest following the tidyr::unnest("squads.players_statistics"...) call in the code. This vector adds the fields listed as columns so the function can return a consistent output.
#' @keywords internal
getPlayerStatsMissingFields <- c('squads.players_statistics_code', 'squads.players_statistics_name', 'squads.players_statistics_namePlural', 'squads.players_statistics_value', 'squads.players_statistics_valueDisplay')

#' getSquadStatsExposedFields
#'
#' This vector contains all the fields we're exposing in the getSquadStats function and their equivalent renames.
#' @keywords internal
getSquadStatsExposedFields <- c(match.id       = 'matchId',
                                squad.id      = 'squads.id',
                                squad.name    = 'squads.name',
                                squad.code    = 'squads.code',
                                code          = 'squads.statistics_code' , 
                                name          = 'squads.statistics_name',
                                plural        = 'squads.statistics_namePlural', 
                                value         = 'squads.statistics_value',
                                display       = 'squads.statistics_valueDisplay'
                                )

#' getSquadStatsMissingFields
#'
#' This vector contains all the fields that are not present when there is no data to unnest following the tidyr::unnest("squads.statistics"...) call in the code. This vector adds the fields listed as columns so the function can return a consistent output.
#' @keywords internal
getSquadStatsMissingFields <- c('squads.statistics_code', 'squads.statistics_name', 'squads.statistics_namePlural', 'squads.statistics_value', 'squads.statistics_valueDisplay')

#' getRotationsWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getRotations function.
#' @keywords internal
getRotationsWhitelist <- c('matchTrxId'  , 'period'         , 'periodSecs',
                           'squad.name'  , 'squad.code'     , 'squad.id', 
                           'off.reason'  , 'off.reasonCode' ,
                           'off.fullname', 'off.displayName', 'off.personId',
                           'on.fullname' , 'on.displayName' , 'on.personId'
                           )

#' getRotationsExposedFields
#'
#' This vector contains all the fields we're exposing in the getRotations function and their equivalent renames.
#' @keywords internal
getRotationsExposedFields <- c(match.id   = 'match.id',
                               trx.id     = 'matchTrxId',
                               period     = 'period',
                               secs       = 'periodSecs',
                               squad.name = 'squad.name',
                               squad.code = 'squad.code',
                               squad.id   = 'squad.id',
                               off.reason = 'off.reason',
                               off.code   = 'off.reasonCode',
                               off.name   = 'off.fullname',
                               off.display= 'off.displayName',
                               off.id     = 'off.personId',
                               on.name    = 'on.fullname',
                               on.display = 'on.displayName',
                               on.id      = 'on.personId'
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

