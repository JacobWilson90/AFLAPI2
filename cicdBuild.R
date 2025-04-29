# Check if the CI environment variable is set and true
if (Sys.getenv("CI") == "true") {
  print(paste("Running in GitLab CICD pipeline..."))
  repoDirectory <- getwd()
  # Install packages if required
  required_packages <- c("roxygen2", "httr", "tidyverse", "data.table")
  for (pkg in required_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      install.packages(pkg)
    }
    library(pkg, character.only = TRUE)
  }
} else {
  print(paste("Running OUTSIDE GitLab CICD pipeline..."))
  # Check if rstudioapi is available
  if (requireNamespace("rstudioapi", quietly = TRUE)) {
    repoDirectory <- dirname(rstudioapi::getSourceEditorContext()$path)
  } else {
    stop("RStudio not running and rstudioapi not available")
  }
  # Install packages if required
  required_packages <- c("roxygen2", "rstudioapi", "devtools")
  for (pkg in required_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      install.packages(pkg)
    }
    library(pkg, character.only = TRUE)
  }
}

#####
# roxygenise() to build documentation (.Rd files in /man directory)
# source the docsite script (generateDocsiteMarkdown.R) to generate markdown
# devtools::build() to build source package and generate tar.gz file
#####

################
# roxygenise() #
################

# Print the repo directory to verify
print(paste("Using repo directory:", repoDirectory))

# This needs to be run after the project has been loaded otherwise it will need additional info to know where to look. 
roxygenise()

#########################
# docsite Documentation #
#########################  

# File path for docsite script (in Misc folder of repo)
#docsiteScriptPath <- paste0(repoDirectory, "/Misc/Documentation/generateDocsiteMarkdown.R")

# Run script - this should generate a file 'R-package-docsite.md' in the root directory of the package repo 
#source(docsiteScriptPath)

#################
# Package Build #
#################   

# This line mimics going Build > Build Source Package (or going to the Build window once project is open and hitting Build Source Package) 
# NOTE: #
# --> the .Rbuildignore file is important as it trims out any of the unnecessary fat from being built into the tar.gz file 
# --> ie. Misc folder, tests folder, this file itself etc.
  devtools::build(pkg       = repoDirectory,
                  path      = repoDirectory,
                  binary    = FALSE)

####################################
# Set package path environment var #
#################################### 
  
  # Get the version of the tar.gz file thats just been created from the description file
  version     <- gsub("Version: ","",readLines(paste0(repoDirectory,"/DESCRIPTION"))[4])  
  
  # Get the full file path of tar file
  tarFilePath <- paste0(repoDirectory,"/cdAFLAPI_",version,".tar.gz") 

  # set env file path
  env_file <- paste0(repoDirectory,"/output.env")

  # write the env file out
  writeLines(paste("export BUILD_PACKAGE_PATH=", tarFilePath, sep=""), env_file)

  # Print to verify
  print(paste("Built package path set to:", tarFilePath))