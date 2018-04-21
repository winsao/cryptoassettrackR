get.exchange.options.f <-  function (
  pair.f,
	cryptowatch.data.price.last.f
) {
  # Parent function:
	# list.portfolio.pair.exchange.options.f
	# Parent function runs lapply to return multiple results
	
  pair.regex.t <- paste(pair.f, "$", sep="")  # force "ends with"
  exchange.options.t <- filter(cryptowatch.data.price.last.f, 
                                 grepl(pair.regex.t, lookup, fixed=F))
	
  exchange.options.t <- exchange.options.t[ , 1, drop=F]
  text.to.remove <- paste(".", pair.f, sep="")
  exchange.options.t$lookup <- gsub(text.to.remove, "", 
                                      exchange.options.t$lookup)
  colnames(exchange.options.t) <- paste(pair.f, ".Exchange.Options", sep="")
  
  if(nrow(exchange.options.t)==0) {
  	return("USER MESSAGE: No exchange options. Try a different base.")
  } else {
  return(exchange.options.t)
  }
}

# get.exchange.options.f <-  function (
#   pair.f
# ) {
#   # cryptowatch.data.price.last.t below inherited from parent function:
# 	# list.portfolio.pair.exchange.options.f
# 	# Parent function runs lapply to return multiple results
# 	
#   pair.regex.t <- paste(pair.f, "$", sep="")  # force "ends with"
#   exchange.options.t <- filter(cryptowatch.data.price.last.t, 
#                                  grepl(pair.regex.t, lookup, fixed=F))
# 	
#   exchange.options.t <- exchange.options.t[ , 1, drop=F]
#   text.to.remove <- paste(".", pair.f, sep="")
#   exchange.options.t$lookup <- gsub(text.to.remove, "", 
#                                       exchange.options.t$lookup)
#   colnames(exchange.options.t) <- paste(pair.f, ".Exchange.Options", sep="")
#   
#   if(nrow(exchange.options.t)==0) {
#   	return("No exchange options. Try a different base.")
#   } else {
#   return(exchange.options.t)
#   }
# }