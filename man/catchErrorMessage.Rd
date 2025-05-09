% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internal_functions.R
\name{catchErrorMessage}
\alias{catchErrorMessage}
\title{catchErrorMessage}
\usage{
catchErrorMessage(name, functionCall, matchId, ...)
}
\value{
a dataframe (of class "data.frame") or text string (of class "character")
}
\description{
This function is used inside of getAFLClubTrxFeed() to either return a dataframe if the call passed to it is successful, or capture the error message thrown by the function call if unsuccessful.
}
\keyword{internal}
