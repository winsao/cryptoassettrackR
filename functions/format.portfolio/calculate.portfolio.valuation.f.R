calculate.portfolio.valuation.f <-  function (
	portfolio.f,
	fiat.base.f
) {

  portfolio.f.t <- create.exchange.price.lookup.column.f(portfolio.f)

  time.stamp.for.output <- format(Sys.time(), "%y-%m-%d.%H-%M-%S")
  cryptowatch.data.t <- get.cryptowatch.data.f()

  portfolio.f.t <- add.values.to.portfolio.f(portfolio.f.t, cryptowatch.data.t)
  portfolio.f.t <- process.values.data.f(portfolio.f.t, fiat.base.f)
  portfolio.f.t <- add.column.sums.f(portfolio.f.t)

  portfolio.f.t <- select(portfolio.f.t, -exchange, -base, everything(), exchange, base)

  write.table(portfolio.f.t, 
    paste("output-of-historical-portfolio-value/", time.stamp.for.output, 
  	      ".portfolio.value.csv", sep=""), row.names=F, sep=",")

  write.table(cryptowatch.data.t, 
    paste("output-of-historical-cryptowatch-data/", time.stamp.for.output, 
  	      ".cryptowatch.data.csv", sep=""), row.names=F, sep=",")

  print(portfolio.f.t)  # print for console output
  
  return(portfolio.f.t)  # return in case user wants to manipulate further
}

