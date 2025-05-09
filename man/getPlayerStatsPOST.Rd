% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/match_stats.R
\name{getPlayerStatsPOST}
\alias{getPlayerStatsPOST}
\title{Match Player Stats (POST Endpoint)}
\usage{
getPlayerStatsPOST(matchId, payload, info = FALSE, verbose = FALSE, ...)
}
\arguments{
\item{matchId}{A unique numerical identifier of a match.}

\item{payload}{A nested list containing the parcels of data to be returned by the API. See: \code{createPayload()} as a method of simplifying this step.}

\item{info}{A logical (\code{TRUE/FALSE}) to include the payload information alongside the data for each payload. Defaults to \code{FALSE}}

\item{verbose}{A logical (\code{TRUE/FALSE}) indicating whether to enable verbose messaging to the console. When set to \code{TRUE}, the function will print additional information and progress messages to the console to provide a more detailed view of its execution. Defaults to \code{FALSE} for a quieter output.}

\item{...}{Arguments to be passed to internal functions, such as \code{envir} or \code{version}.}
}
\value{
A data frame with a list of metrics supplied by the payload for each player in a match.
\itemize{
   \item \code{match.id} A unique numerical identifier of a match.
   \item \code{squad.name} The name of the squad.
   \item \code{squad.code} A short code to represent the squad.
   \item \code{squad.id} A unique numerical identifier of the squad.
   \item \code{player.name} The full name of the player.
   \item \code{player.display} The display name of the player, represented as first initial and surname.
   \item \code{player.id} A unique numerical identifier of the player.
   \item \code{stat.code} The metric code (ALL_CAPS format).
   \item \code{stat.name} The metric name (singular).
   \item \code{stat.plural} The metric name (plural).
   \item \code{value} The numeric metric value with no formatting applied.
   \item \code{display} The formatted metric value as a text string.
   \item \code{id} A unique identifier string able to be supplied by the user for each list in the payload. Defaults to numerical index starting at 0. 
   \item \code{info.metric.codes} (when \code{info = TRUE}) The metric code(s) supplied to the specific list in the payload for that row of data.
   \item \code{info.periods} (when \code{info = TRUE}) The period(s) supplied to the specific list in the payload for that row of data.
   \item \code{info.zones} (when \code{info = TRUE}) The zone(s) supplied to the specific list in the payload for that row of data.
   \item \code{info.team} (when \code{info = TRUE}) The team supplied to the specific list in the payload for that row of data.
   \item \code{info.context} (when \code{info = TRUE}) The match context supplied to the specific list in the payload for that row of data.
}
}
\description{
Get player stats for a match via a payload to the POST endpoint.
}
\examples{
getSquadStatsPOST(matchId = 120390401, payload = squadPayload, info = T, verbose = T)
}
