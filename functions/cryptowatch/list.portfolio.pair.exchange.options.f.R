list.portfolio.pair.exchange.options.f <-  function (
  portfolio.f,
	get.exchange.options.f
) {
  # depends on:
    # get.cryptowatch.data.f
    # filter.cryptowatch.data.to.price.last.f
    # get.exchange.options.f
if(get.exchange.options.f==TRUE) {
  cryptowatch.data.price.last.t <- 
    filter.cryptowatch.data.to.price.last.f()
  return(lapply(portfolio.f$pair, get.exchange.options.f, 
  	cryptowatch.data.price.last.f=cryptowatch.data.price.last.t))
}
}