process.values.data.f <-  function (
	portfolio.f,
	fiat.base.f  # selected by user configuration.R
) {

# create new column and name it price.tickerOfFiatCurrency
  portfolio.f[ , ncol(portfolio.f)+1] <- 0
  fiat.column.name.t <- paste("price.", fiat.base.f, sep="")
  colnames(portfolio.f)[ncol(portfolio.f)] <- fiat.column.name.t

# populate price.fiat column with value, if appropriate
  portfolio.f[ , ncol(portfolio.f)] <- ifelse(portfolio.f$base==fiat.base.f,
                                                portfolio.f$value, 
                                                0)

# populate price.btc column with value, if appropriate
  portfolio.f$price.btc <- ifelse(portfolio.f$base=="btc", 
	                                  portfolio.f$value, 
	                                  0)

# populate price.eth column with value, if appropriate
  portfolio.f$price.eth <- ifelse(portfolio.f$base=="eth", 
	                                  portfolio.f$value, 
	                                  0)

# below doesn't work as tibble
  portfolio.f <- as.data.frame(portfolio.f)  

  btc.fiat.pair.name.t <- paste("btc", fiat.base.f, sep="")
  btc.fiat.pair.price.t <- portfolio.f[portfolio.f$pair==btc.fiat.pair.name.t, 
	                                     fiat.column.name.t]

# if not direct fiat price, populate column based on btc * fiat
  portfolio.f[, fiat.column.name.t] <- 
    ifelse(portfolio.f[, fiat.column.name.t]==0,
  	         portfolio.f$price.btc*btc.fiat.pair.price.t,
             portfolio.f[ , fiat.column.name.t])

# if not direct btc price, populate column based on fiat / btc
  portfolio.f$price.btc <- 
    ifelse(portfolio.f$price.btc==0, 
             portfolio.f[, fiat.column.name.t]/btc.fiat.pair.price.t, 
             portfolio.f$price.btc)

# add column with price in satoshis
  portfolio.f$price.sat <- portfolio.f$price.btc*100000000

  eth.fiat.pair.name.t <- paste("eth", fiat.base.f, sep="")
  eth.fiat.pair.price.t <- portfolio.f[portfolio.f$pair==eth.fiat.pair.name.t, 
	                                     fiat.column.name.t]

# calculated implied price in eth
  portfolio.f$price.eth <- portfolio.f[ , fiat.column.name.t]/
	                         eth.fiat.pair.price.t

  portfolio.f <- select(portfolio.f, -c(value, pair))

# create and name new column to hold fiat price * quantity
  portfolio.f[ , ncol(portfolio.f)+1] <- 0
  fiat.ext.column.name.t <- paste("ext.", fiat.base.f, sep="")
  colnames(portfolio.f)[ncol(portfolio.f)] <- fiat.ext.column.name.t

# calculate fiat price * quantity
  portfolio.f[, fiat.ext.column.name.t] <- portfolio.f[, fiat.column.name.t]*
	                                         portfolio.f$quantity

# calculate btc price * quantity	
  portfolio.f$ext.btc <- portfolio.f$price.btc*portfolio.f$quantity

# calculate eth price * quantity	
  portfolio.f$ext.eth <- portfolio.f$price.eth*portfolio.f$quantity

# drop unneeded lookup column
  portfolio.f <- select(portfolio.f, -lookup)

# arrange portfolio in descending value of btc extended
  portfolio.f <- arrange(portfolio.f, desc(ext.btc))

# reformat portfolio as tibble
  portfolio.f <- as_tibble(portfolio.f)

  return(portfolio.f)
}