get.cryptowatch.data.f <-  function (
  # Get cryptowatch summaries data and output long data.frame
  # Return data.frame
) {
  # used in: 
    # list.portfolio.pair.exchange.options.f 
    # filter.cryptowatch.data.to.price.last.f
	if(error.in.tor.config==TRUE) {
		stop("Error! Tor improperly configured in R settings.")
	} else {
  df.t <- readLines("https://api.cryptowat.ch/markets/summaries")
  df.t <- fromJSON(paste(df.t, collapse=""))
  df.t <- df.t[[1]]  # drop usage data
  df.t <- data.frame(df.t)
  df.format.t <- data.frame(lookup=colnames(df.t))
  df.format.t$value <- as.data.frame(t(df.t[1,]))[,1]
  return(df.format.t)
	}
}