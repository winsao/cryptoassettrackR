list.install.and.load.required.packages.f <- function(
  error.in.tor.config.f  # output of check.for.tor.config.error.f function
	) {
  # depends on: 
    # package.check.f function
  if(error.in.tor.config.f==TRUE) {
    stop("Error! Tor improperly configured in R settings.")
	} else {
  packages.to.load.t <- list.files(path="functions/library", full.names=F)
  packages.to.load.t <- gsub(".R", "", packages.to.load.t, fixed=T)
  lapply(packages.to.load.t, package.check.f)
  }
}