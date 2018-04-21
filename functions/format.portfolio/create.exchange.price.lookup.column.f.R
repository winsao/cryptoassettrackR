create.exchange.price.lookup.column.f <-  function (
  portfolio.f  # data.frame or tibble with exchange and pair columns
) {
  portfolio.f$lookup <- paste(portfolio.f$exchange, 
                              ".", 
                              portfolio.f$pair, 
                              ".price.last", 
                              sep="")
  return(portfolio.f)
}