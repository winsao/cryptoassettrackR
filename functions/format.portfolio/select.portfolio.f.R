select.portfolio.f <-  function (
  use.private.portfolio.f  # user selects TRUE or FALSE
) {
	# Ensure "portfolio.private.R" exists but don't overwrite existing
  	file.copy("portfolio.sample.R", "portfolio.private.R", overwrite=FALSE)
  if(use.private.portfolio.f==TRUE){
   	source("portfolio.private.R")
    return(portfolio)
  } else {
    source("portfolio.sample.R")	
    return(portfolio)
  }
}