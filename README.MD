# Champion Data AFL API R Package

## Outline
This R package is to enable easier usage of the AFL Sport Data Platform API. It is for internal and external usage.

## Building and publishing
### Internal package
All commits to the ```develop``` branch will trigger build and publish jobs to the ```internal-cran``` [Proget feed](https://proget.championdata.io/feeds/internal-cran). 

### External package
All merges from ```develop``` to ```master``` will trigger build and publish jobs to the ```Champion-RAN``` [Proget feed](https://proget.championdata.io/feeds/ChampionRAN). As this feed is publicly available, we want to ensure that packages that are published here are of a production quality.

## Using in R
### internal-cran
The ```internal-cran``` feed is only available via authentication or the [Proget web UI](https://proget.championdata.io/feeds). 

To **replace** the default CRAN repository:
```
local({r <- getOption("repos")
    r["CRAN"] <- "https://api:<<api key>>@proget.championdata.io/cran/internal-cran/" 
    options(repos=r)
})
```

To **add** to the default CRAN repository:
```
local({r <- getOption("repos")
    r["internal-cran"] <- "https://api:<<api key>>@proget.championdata.io/cran/internal-cran/"
    options(repos = r)
})
```