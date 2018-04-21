create.pair.lookup.f <-  function (
  portfolio.f  # dataframe or tibble with ticker and base columns
) {
  portfolio.f$ticker <- tolower(portfolio.f$ticker)
  portfolio.f$base <- tolower(portfolio.f$base)
	portfolio.f$pair <- paste(portfolio.f$ticker, portfolio.f$base, sep="")
  return(portfolio.f)
}