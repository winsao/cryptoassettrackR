source("settings.and.functions.R")

# USER INPUT: Configure R to use Tor proxy? -------------------------------
use.tor.proxy <- TRUE  # TRUE or FALSE

tor.test.result <- set.and.test.tor.proxy.f(use.tor.proxy)
error.in.tor.config <- check.for.tor.config.error.f(tor.test.result)

list.install.and.load.required.packages.f(error.in.tor.config)

# USER INPUT: Use "portfolio.private.R"? ----------------------------------
# Note: "portfolio.private.R" is ignored via .gitignore. If the file does not
# exist, "portfolio.private.R" is created as a copy of "portfolio.sample.R", 
# and it can then be customized. If "portfolio.private.R" exists, 
# it is not overwritten.

use.portfolio.private <- FALSE  # TRUE or FALSE
portfolio <- select.portfolio.f(use.portfolio.private)

portfolio <- create.pair.lookup.f(portfolio)

# USER INPUT: Enter TRUE to see exchange options for assets above ---------
get.exchange.options <- FALSE  # TRUE or FALSE
list.portfolio.pair.exchange.options.f(portfolio, get.exchange.options)

portfolio <- calculate.portfolio.valuation.f(portfolio, fiat.base)

# When the above settings and portfolio ("portfolio.sample.R" or 
# "portfolio.sample.R") are configured as you'd like, run this entire file
# with ctrl+a (select all) and then ctrl+r (run all selected). Or, open
# master.R and select and run source("configuration.R")
