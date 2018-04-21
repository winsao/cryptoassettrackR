add.values.to.portfolio.f <-  function (
  portfolio.f,
  cryptowatch.data.f
) {
  return(left_join(portfolio.f, cryptowatch.data.f, by="lookup"))
}