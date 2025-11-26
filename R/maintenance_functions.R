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
      dplyr::select(Package, Version, Description, Author, Maintainer, "Dependencies"=Depends, Packaged, "Built on R Version", "Installed")
    return(as.list(data))
    # Invalid string entered
  } else {
    message("Error\n--> Invalid input entered. Valid inputs are 'Version' or 'Details'.")
  }
}