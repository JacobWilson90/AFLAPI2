#'Champion Data AFL API
#'
#'Hit the Champion Data AFL API with a given endpoint.
#'@param endpoint The full path of an endpoint including path and query parameters, excluding the base_url and version components. eg: "Leagues" rather than "https://api.afl.championdata.io/v1/Leagues"
#'@param envir A short code representing the environment to hit. Empty string = Production, 'sandbox' = Sandbox environment, 'dev' = Development environment (Internal Champion Data use only).
#'@param base_url The base URL for the API. Defaults to the AFL API.
#'@param version The version number of the API. Defaults to 1.
#'@param df Logical. Convert to data.frame? Note: Will only work for endpoints with a flat JSON response.
#'@return A numerical value for league ID.
#'@examples
#'cdAPI('matches/113770401')
#'@export
cdAPI <- function(endpoint,envir=c('','sandbox','dev'),base_url='https://api.afl.championdata.io',version='v1',df=TRUE){
  
  api_url <- gsub('afl-.ch','afl.ch',gsub('afl',paste('afl',envir[1],sep='-'),base_url))
  r       <- GET(modify_url(api_url,path=paste(version,endpoint,sep='/')),authenticate(api_un,api_pw))
  
  if(r$status==403){
    message("Match yet to start")
    return(NULL)
  }
  if(df){
    if(length(content(r))>1){
      out <- data.frame(fromJSON(content(r,'text'),flatten=TRUE))
    }else{
      out <- data.frame(unlist(content(r)))
    }
    return(out)
  }else{
    return(r)
  }
}

#'Champion Data AFL API Response
#'
#'Hit the Champion Data AFL API with a given endpoint to retrieve a response object.
#'@param matchId A unique numerical identifier of a match (only required for match-level endpoints.)
#'@param endpoint The full path of an endpoint including path and query parameters, excluding the base_url and version components. eg: "Leagues" rather than "https://api.afl.championdata.io/v1/Leagues"
#'@param envir A short code representing the environment to hit. Empty string = Production, 'sandbox' = Sandbox environment, 'dev' = Development environment (Internal Champion Data use only).
#'@param base_url The base URL for the API. Defaults to the AFL API.
#'@param version The version number of the API. Defaults to 1.
#'@return A response object.
#'@examples
#'cdAPIresponse(matchId,paste('matches',matchId,'entries',sep='/')
#'@export
cdAPIresponse <- function(matchId,endpoint,envir=c('','sandbox','dev'),base_url='https://api.afl.championdata.io',version='v1'){
  
  getURL      <- gsub('afl-.ch','afl.ch',gsub('afl',paste('afl',envir[1],sep='-'),base_url))
  rawResponse <- GET(modify_url(getURL,path=paste(version,endpoint,sep='/')),authenticate(api_un,api_pw))
  
  # Handling 
  if(rawResponse$status==200){
    return(rawResponse)
  } else {
    
    if(substr(content(rawResponse, "text", encoding = "UTF-8"),1,1)=="{"){
      encodeJson   <- fromJSON(content(rawResponse, "text", encoding = "UTF-8"))
    } else {
      encodeJson   <- content(rawResponse, "text", encoding = "UTF-8")
    }
    lengthList   <- length(encodeJson)
    lengthErrors <- length(encodeJson[[lengthList]])
    message("Error(s) [Status: ",rawResponse$status,"]:\n",paste0("--> ",encodeJson[[lengthList]][1:lengthErrors],collapse = "\n"))
    return(NULL)
  }
}

#'Champion Data AFL API Response (POST Endpoint)
#'
#'Hit either the Players or Squads Champion Data AFL API via the POST Endpoint. 
#'@param matchId A unique numerical identifier of a match.
#'@param endpoint A (case-insensitive) string detailing which endpoint to hit (either 'player' or 'squad').
#'@param payload A nested list containing the parcels of data to be returned by the API. See: \code{createPayload()} as a method of simplifying this step.
#'@param base_url The base URL for the API. Defaults to the AFL API.
#'@param version The version number of the API. Defaults to 1.
#'@param envir A short code representing the environment to hit. Empty string = Production, 'sandbox' = Sandbox environment, 'dev' = Development environment (Internal Champion Data use only).
#'@return A response object from the API call.
#'@examples
#'cdAPIPOSTresponse(matchId = 120390401, endpoint = "player", payload = payload)
#'@export
cdAPIPOSTresponse <- function(matchId,endpoint,payload,baseUrl="https://api.afl.championdata.io",version="v1",envir="") { 
  
  # Player/Squad endpoint based on input
  if(tolower(endpoint) %in% c("player","players")) endpointString <- paste('matches',matchId,'statistics','players',sep='/')
  if(tolower(endpoint) %in% c("squad","squads"))  endpointString <- paste('matches',matchId,'statistics','squads',sep='/')
  
  # URL for POST 
  postURL <- modify_url(gsub('afl-.ch','afl.ch',gsub('afl',paste('afl',envir[1],sep='-'),baseUrl)),path=paste(version,endpointString,sep='/'))
  
  # Hit endpoint
  rawResponse <- POST(postURL,
                      body   = payload,
                      encode = "json" ,
                      add_headers(c("accept" = "text/plain","Content-Type" = "application/json")) , 
                      authenticate(api_un,api_pw))
  
  # Handling 
  if(rawResponse$status==200){
    return(rawResponse)
  } else {
    if(substr(content(rawResponse, "text", encoding = "UTF-8"),1,1)=="{"){
      encodeJson   <- fromJSON(content(rawResponse, "text", encoding = "UTF-8"))
    } else {
      encodeJson   <- content(rawResponse, "text", encoding = "UTF-8")
    }
  }
  lengthList   <- length(encodeJson)
  lengthErrors <- length(encodeJson[[lengthList]])
  message("Error(s) [Status: ",rawResponse$status,"]:\n",paste0("--> ",encodeJson[[lengthList]][1:lengthErrors],collapse = "\n"))
  return(NULL)
}

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

#'payloadDefaults (POST Functions Only)
#'
#'This function takes a POST payload as input and will print to the console any parameters of the payload that are missing & signal that defaults for these parameters are being used. For use inside of \code{getPlayerStatsPOST()} & \code{getSquadStatsPOST()} only visable when \code{verbose = TRUE}.
#'@param payload A nested list containing the parcels of data to be returned by the API. See: \code{createPayload()} as a method of simplifying this step.
#'@return A response object from the API call.
#'@examples
#'payloadDefaults(payload = payload)
#'@keywords internal
payloadDefaults <- function(payload) {
  
  payloadList <- payload[[1]]
  
  if(sub("MetricRequests", "", names(payload)) == "player"){
    fieldsToCheck <- c("metricCodes", "team", "periods", "zones")
  } else { 
    fieldsToCheck <- c("metricCodes", "team", "periods", "zones", "context")
  } 
  
  # Check if there are any missing parameters in any of the lists
  anyMissing <- any(sapply(payloadList, function(metricRequest) {
    any(sapply(fieldsToCheck, function(field) {
      isMissing <- !field %in% names(metricRequest) ||
        (is.character(metricRequest[[field]]) && (grepl("^#", metricRequest[[field]]) || metricRequest[[field]] == "")) ||
        (is.list(metricRequest[[field]]) && length(metricRequest[[field]]) == 0)
      return(isMissing)
    }))
  }))
  
  if (!anyMissing) {
    return(message("All payload parameters supplied\n--> No defaults required."))
  }
  
  message("Incomplete Payload\n--> Using defaults for parameters not supplied in the following")
  
  for (i in seq_along(payloadList)) {
    
    metricRequest <- payloadList[[i]]
    missingFields <- character(0)
    
    for (field in fieldsToCheck) {
      if (!field %in% names(metricRequest)) {
        missingFields <- c(missingFields, field)
      } else if (is.character(metricRequest[[field]]) && (grepl("^#", metricRequest[[field]]) || metricRequest[[field]] == "")) {
        missingFields <- c(missingFields, field)
      } else if (is.list(metricRequest[[field]]) && length(metricRequest[[field]]) == 0) {
        missingFields <- c(missingFields, field)
      }
    }
    
    # Print the result with ID in brackets if available
    if (length(missingFields) > 0) {
      message(paste0("id: '", metricRequest$id, "' - ", paste(missingFields, collapse = ", ")))
    }
  }
}

#'createPayload
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
  
  if(!tolower(endpoint) %in% c("player","squad")) stop("Invalid endpoint specified\n--> Supported inputs to endpoint are 'player' and 'squad'.")
  
  string <- paste0("list(",tolower(endpoint),"MetricRequests = list(...))")
  eval(parse(text=string))
  
}


