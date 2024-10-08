% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/match_ref.R
\name{getVenue}
\alias{getVenue}
\title{Match Venue}
\usage{
getVenue(matchId, ...)
}
\arguments{
\item{matchId}{An unique numerical identifier of a match.}

\item{...}{Arguments to be passed to internal functions, such as \code{envir} or \code{version}.}
}
\value{
A data frame with details about the match venue.
\itemize{
   \item \code{match.id} A unique numerical identifier of a match.
   \item \code{id} A unique numerical identifier of the match venue.
   \item \code{name} The name of the match venue.
   \item \code{code} A short code to represent the match venue.
   \item \code{country.id} A unique numerical identifier of the country of the venue.
   \item \code{country.name} The country of the venue.
   \item \code{country.code} A short code representing the country of the venue.
   \item \code{state.id} A numerical identifier of a country's state.
   \item \code{state.name} The venue's state.
   \item \code{state.code} A short code representing the venue's state.
   \item \code{timezone} The timezone of the venue.
   \item \code{length} The length of the venue in metres.
   \item \code{width} The width of the venue in metres.
}
}
\description{
Get details about the venue for a match.
}
\examples{
getVenue(216085122)
}
