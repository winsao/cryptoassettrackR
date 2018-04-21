filter.cryptowatch.data.to.price.last.f <-  function (
) {
  # Used in: 
    # list.portfolio.pair.exchange.options.f
	
	cryptowatch.data.t <- get.cryptowatch.data.f()
	
  cryptowatch.data.price.last.t <- 
    filter(cryptowatch.data.t, grepl(".price.last", lookup))
  
  cryptowatch.data.price.last.t$lookup <-
    gsub(".price.last", "", cryptowatch.data.price.last.t$lookup, fixed=T)
  
  return(cryptowatch.data.price.last.t)
}