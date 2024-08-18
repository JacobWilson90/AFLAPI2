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

#' getLeagueInfo_leagueLevelCombos
#'
#' This vector contains all the possible combinations of league and level in order to gather all info in getLeagueInfo function.
#' @keywords internal
getLeagueInfo_leagueLevelCombos <- expand.grid(leagueId = 1:3, levelId = 1)

#' getLeagueInfoExposedFields
#'
#' This vector contains all the fields we're exposing in the getLeagueInfoExposedFields function and their equivalent renames.
#' @keywords internal
getLeagueInfoExposedFields <- c(current.season.id = "currentSeason.seasonId",
                                level.id          = "id",
                                league.id         = "league.id", 
                                level.name        = "name",
                                league.name       = "league.name",
                                level.code        = "code" , 
                                league.code       = "league.code",
                                league.gender     = "league.gender",
                                competition.id    = "currentSeason.competitionId",
                                championship.id   = "currentSeason.championshipId")

#' getMatchWhitelist
#'
#' This vector contains all the possible columns that can be returned by hitting the endpoint within the getMatch function.
#' @keywords internal
getMatchWhitelist <- c(
  'competitionName', 'seasonId', 'type.id', 'type.name', 'type.code',
  'roundNumber', 'phaseRoundNumber', 'id', 'name', 'code',
  'date.utcMatchStart', 'date.startDate', 'date.startTime', 'home.id', 'home.name',
  'home.code', 'away.id', 'away.name', 'away.code', 'venue.id',
  'venue.name', 'venue.code', 'venue.timeZone', 'status.id', 'status.name',
  'status.typeId', 'status.typeName', 'home.score.goals', 'home.score.behinds', 'home.score.points',
  'away.score.goals', 'away.score.behinds', 'away.score.points', 'winningSquadId', 'result',
  'resultCode', 'coinToss.winningSquadId', 'coinToss.decision', 'attendance'
)

#' getMatchExposedFields
#'
#' This vector contains all the fields we're exposing in the getMatch function and their equivalent renames.
#' @keywords internal
getMatchExposedFields <- c(
  competition.name='competitionName',
  season.id='seasonId',
  type.id='type.id',
  type.name='type.name',
  type.code='type.code',
  round.number='roundNumber',
  round.phaseNumber='phaseRoundNumber',
  match.id='id',
  match.name='name',
  match.code='code',
  match.start='date.utcMatchStart',
  match.date='date.startDate',
  match.time='date.startTime',
  home.id='home.id',
  home.name='home.name',
  home.code='home.code',
  away.id='away.id',
  away.name='away.name',
  away.code='away.code',
  venue.id='venue.id',
  venue.name='venue.name',
  venue.code='venue.code',
  venue.timezone='venue.timeZone',
  status.id='status.id',
  status.name='status.name', 
  status.type.id='status.typeId',
  status.type.id.name='status.typeName',
  home.goals='home.score.goals',
  home.behinds='home.score.behinds',
  home.points='home.score.points',
  away.goals='away.score.goals',
  away.behinds='away.score.behinds',
  away.points='away.score.points',
  winner.id='winningSquadId',
  result = 'result',
  result.code='resultCode' , 
  coin.toss.winning.squad.id   = 'coinToss.winningSquadId' ,
  coin.toss.direction.decision = 'coinToss.decision',
  attendance = 'attendance' 
)





# TRX FILE VECTORS #

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
  'VENUE_LENGTH '      = 'length',
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

#' twoplayerstatsbaseNames_trxFile
#'
#' This vector contains all the column names for the two player stats table, we may need to create an empty DF with these names based on if ruck transactions exist or not
#' @keywords internal
twoplayerstatsbaseNames_trxFile <- c("match.id", "trx.id", "stat.code", "stat.desc", "period", "period.secs",
                                     "score.home", "score.away", "squad.name", "squad.code", "squad.id", 
                                     "person.fullname", "person.displayName", "person.id", "pressure.squad.name",
                                     "pressure.squad.id", "pressure.squad.code", "pressure.name", "pressure.code", 
                                     "pressure.points", "pressure.fullname1", "pressure.displayname1", "pressure.personid1", 
                                     "pressure.role1", "pressure.fullname2", "pressure.displayname2", "pressure.personid2", 
                                     "pressure.role2", "zone.physical", "zone.logical", "location.x", "location.y", 
                                     "location.x.std", "location.y.std", "location.rotated.x", "location.rotated.y", 
                                     "location.rotated.x.std", "location.rotated.y.std", "kicking.foot", "kicking.intent", 
                                     "kicking.distance", "kicking.direction", "inside50.direction", "inside50.intent", 
                                     "shot.angle", "shot.distance", "shot.result", "shot.source", "shot.type", 
                                     "freekick.context", "freekick.reason", "kickin.direction", "sequence1", "sequence", 
                                     "count", "home_squad_n", "away_squad_n")

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












getMatchPersons_awayWhitelist <- c(
  "away.players.dateOfBirth", "away.players.matchAge", "away.players.height"      ,
  "away.players.firstname"  , "away.players.surname" , "away.players.jumperNumber",
  "away.players.displayName", "away.players.fullname", "away.players.personId"    ,
  "away.players.positions.selected.id"  , "away.players.positions.selected.code", 
  "away.players.positions.selected.name", "away.players.positions.season.id"    , 
  "away.players.positions.season.code"  , "away.players.positions.season.name"  ,
  "away.code", "away.id", "away.name")

getMatchPersons_homeWhitelist <- c(
  "home.players.dateOfBirth", "home.players.matchAge", "home.players.height"      ,
  "home.players.firstname"  , "home.players.surname" , "home.players.jumperNumber",
  "home.players.displayName", "home.players.fullname", "home.players.personId"    ,
  "home.players.positions.selected.id"  , "home.players.positions.selected.code", 
  "home.players.positions.selected.name", "home.players.positions.season.id"    , 
  "home.players.positions.season.code"  , "home.players.positions.season.name"  ,
  "home.code", "home.id", "home.name"
)

getMatchPersons_officialsWhitelist <- c("personId", "fullname", "displayName", "jumperNumber", 
                                        "positions.selected.id", "positions.selected.name", "positions.selected.code")


getMatchPersons_officialsExposedFields <- c(person.id      = "personId",
                                            person.name    = "fullname",
                                            person.display = "displayName", 
                                            jumper         = "jumperNumber", 
                                            selected.id    = "positions.selected.id",
                                            selected.name  = "positions.selected.name",
                                            selected.code  = "positions.selected.code")

getMatchPersons_officialsDF <- data.frame("person.id"      = character(),
                                          "person.name"    = character(),
                                          "person.display" = character(),
                                          "jumper"         = character(),
                                          "selected.id"    = character(),
                                          "selected.name"  = character(),
                                          "selected.code"  = character(),
                                          stringsAsFactors = FALSE)

getMatchPersonsExposedFields <- c(
  match.id = "match.id",
  squad.id = 'id',
  squad.name  = 'name', 
  squad.code  = 'code',
  person.id   = 'personId', 
  person.name = 'fullname', 
  person.firstname = 'firstname',
  person.surname   = 'surname',
  person.display   = 'displayName',
  jumper        = 'jumperNumber',
  selected.id   = 'positions.selected.id',
  selected.name = 'positions.selected.name',
  selected.code = 'positions.selected.code',
  position.id   = 'positions.season.id',
  position.name = 'positions.season.name',
  position.code = 'positions.season.code',
  height = "height", 
  weight = "weight",
  DOB    = 'dateOfBirth', 
  age    = 'matchAge'
)








