#'to_minsec
#'
#'Convert an integer of seconds elapsed to a text string with minutes and seconds.
#'@param x Seconds, as an integer.
#'@param leadingZero Logical. Add a leading zero to minute values less than 10?
#'@return A text string in the form "MI:SS" - eg. "9:54" if @param leadingZero is FALSE, "09:54" if @param leadingZero is TRUE.
#'@examples
#'to_minsec(594)
#'@export
to_minsec <- function(x,leadingZero=FALSE){
  require(tidyverse)
  mins <- floor(x/60)
  secs <- x %% 60
  if(leadingZero){
    mins_fill <- if_else(mins<10,paste("0",mins,sep=''),as.character(mins))
  }else{
    mins_fill <- mins
  }
  secs_fill <- if_else(secs<10,paste("0",secs,sep=''),as.character(secs))
  output <- paste(mins_fill,secs_fill,sep=':')
  return(output)
}

#' Helper to create payloads for getPlayerStatsPOST() and getSquadStatsPOST() functions.
#'
#'Create a payload for \code{getPlayerStatsPOST()} and \code{getSquadStatsPOST()} functions.
#'@param endpoint A string of either "player" or "squad" dictating the POST endpoint the payload is being built for.
#'@param list(s) Pass in any number of single lists to be combined into one payload.
#'@return A nested list in the correct structure to pass into payload arguments of \code{getPlayerStatsPOST()} and \code{getSquadStatsPOST()}
#'@examples
#'D50_Tackles_Q1 = list(metricCodes = list("TACKLE"), zones = list('D50'), periods = list(1), id = "D50_Tackles_Q1")
#'createPayLoad(endpoint = "squad", D50_Tackles_Q1)
#'@export
createPayLoad <- function(endpoint, ...) {
  if(!tolower(endpoint) %in% c("player","squad")) stop("Invalid endpoint specified\n--> Supported inputs to endpoint parameter are 'player' and 'squad'.")
  
  string <- paste0("list(",tolower(endpoint),"MetricRequests = list(...))")
  return <- eval(parse(text=string))
  return(return)
}