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