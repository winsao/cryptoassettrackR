add.column.sums.f <-  function (
	portfolio.f
) {

# get columns to sum and calculate sums
  columns.to.sum <- grepl("ext.", colnames(portfolio.f), fixed=T)
  sum.of.columns.to.sum <- colSums(portfolio.f[, columns.to.sum])

# create sum row as last row of portfolio
  asset.count.in.portfolio.t <- nrow(portfolio.f)
  row.number.of.sum.row.t <- asset.count.in.portfolio.t+1
  portfolio.f[row.number.of.sum.row.t, ] <- NA
  portfolio.f[row.number.of.sum.row.t, 1] <- "SUM"

  portfolio.f[row.number.of.sum.row.t, columns.to.sum] <- sum.of.columns.to.sum

# calculation portfolio's asset allocation (total portfolio = 1.00)
  portfolio.f$allocation <- portfolio.f$ext.btc/
	                          portfolio.f$ext.btc[nrow(portfolio.f)]

  return(portfolio.f)
}