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
  r       <- GET(modify_url(api_url,path=paste(version,endpoint,sep='/')), authenticate(api_un,api_pw), add_headers(c(accept = "text/plain", `Content-Type` = "application/json", `Accept-Encoding` = "gzip")))
  
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
#'@param verbose Logical, default is \code{FALSE}. If \code{TRUE}, prints the full URL string passed to the API.
#'@return A response object.
#'@examples
#'cdAPIresponse(matchId,paste('matches',matchId,'entries',sep='/')
#'@export
cdAPIresponse <- function(matchId,endpoint,envir=c('','sandbox','dev'),base_url='https://api.afl.championdata.io',version='v1',verbose = F){
  
  getURL      <- gsub('afl-.ch','afl.ch',gsub('afl',paste('afl',envir[1],sep='-'),base_url))
  fullUrl     <- modify_url(getURL,path=paste(version,endpoint,sep='/'))
  if(verbose) message("Full URL: ",fullUrl)
  rawResponse <- GET(fullUrl, authenticate(api_un,api_pw), add_headers(c(accept = "text/plain", `Content-Type` = "application/json", `Accept-Encoding` = "gzip")))  
  
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
  if(tolower(endpoint) %in% c("player","players")){
    endpointString <- paste('matches',matchId,'statistics','players',sep='/')
  } else if(tolower(endpoint) %in% c("squad","squads")){
    endpointString <- paste('matches',matchId,'statistics','squads',sep='/')
  } else {
    message(paste0("Error\n--> Input for endpoint parameter: '",endpoint,"' is not a valid. Valid inputs are either 'players' or 'squads'."))
    return()
  }
  
  # URL for POST 
  postURL <- modify_url(gsub('afl-.ch','afl.ch',gsub('afl',paste('afl',envir[1],sep='-'),baseUrl)),path=paste(version,endpointString,sep='/'))
  
  # Hit endpoint
  rawResponse <- POST(postURL,
                      body   = payload,
                      encode = "json" ,
                      add_headers(c("accept" = "text/plain", "Content-Type" = "application/json", `Accept-Encoding` = "gzip")) , 
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
  if(!tolower(endpoint) %in% c("player","squad")) stop("Invalid endpoint specified\n--> Supported inputs to endpoint parameter are 'player' and 'squad'.")
  
  string <- paste0("list(",tolower(endpoint),"MetricRequests = list(...))")
  return <- eval(parse(text=string))
  return(return)
}

#'Update Package Version
#'
#'Function to install the most recent version of cdAFLAPI. Will prompt for a session restart if using R Studio (recommended).
#'@examples
#'cdAFLAPI.update()
#'@export
cdAFLAPI.update <- function(...){
  
  args <- list(...)
  v    <- args$v
  
  print(paste0('http://www.championdata.com/scratch/api/cdAFLAPI',if(!is.null(v))paste0('_', v), '.tar.gz'))
  
  # If installed, remove
  if("cdAFLAPI" %in% rownames(installed.packages())) remove.packages("cdAFLAPI");
  # If attached, detach
  if("package:cdAFLAPI" %in% search()) detach('package:cdAFLAPI',unload=TRUE);
  
  suppressPackageStartupMessages(install.packages(paste0('http://www.championdata.com/scratch/api/cdAFLAPI',if(!is.null(v))paste0('_', v), '.tar.gz'), source = TRUE, repos = NULL, quiet = T)) # Install
  
  if("cdAFLAPI" %in% rownames(installed.packages())){
    message(paste0("Success:\n--> cdAFLAPI ", read.dcf(system.file("DESCRIPTION", package = "cdAFLAPI"))[1, "Version"]," installed."))               # Print success
    library('cdAFLAPI')
    if(Sys.getenv("RSTUDIO")=="1"){
      response <- readline(message("--> It is recommended you restart your Rstudio session before proceeding. Would you like to? (Y/N): "))
      if(tolower(response) == "y") .rs.restartR() else return(invisible()) # Restart if running R studio
    } else {
      message("It is recommended that you restart your R session before proceeding.")
    }
  } else {
    message("\nError\ncdAFLAPI has not installed. Please try manually running:\n`install.packages('http://www.championdata.com/scratch/api/cdAFLAPI.tar.gz', source = TRUE, repos = NULL)`\n")
  }
}

#'Current Version of cdAFLAPI
#'
#'Return version details of the current version of the cdAFLAPI your system is running.
#'@param info A string for which information to return.
#'\code{info='Version'} will return a string of the current version number. (Default)
#'\code{info='Details'} will return a list containing package metadata of your current version.
#'@examples
#'cdAFLAPI.version()
#'@export
cdAFLAPI.version <- function(info="Version"){
  # Description file
  descFile <- system.file("DESCRIPTION", package = "cdAFLAPI")
  # Return version no
  if(tolower(info) == "version"){
    return(paste0("v.",read.dcf(descFile)[1, "Version"][[1]]))
  } else if(tolower(info) == "details"){
    data <- as.data.frame(read.dcf(descFile))[c(1,4,7,5,6,10,14,15)] %>%
      mutate("Packaged" = format(as.POSIXct(gsub("; aaron.brougham", "", Packaged)), "%B %d, %Y") ,
             "Built on R Version" = sub(";.*", "", Built),
             "Installed" = format(as.POSIXct(gsub(".*; ; | UTC; .*", "", Built)), "%B %d, %Y")) %>%
      select(Package, Version, Description, Author, Maintainer, "Dependencies"=Depends, Packaged, "Built on R Version", "Installed")
    return(as.list(data))
    # Invalid string entered
  } else {
    message("Error\n--> Invalid input entered. Valid inputs are 'Version' or 'Details'.")
  }
}

