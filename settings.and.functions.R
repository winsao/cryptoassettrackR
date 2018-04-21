# load settings and functions ---------------------------------------------
source("functions/setup/source.f.R")
# modify source function below to be source.f to output R file in console
# while also running it. Useful for line by line debugging.

source("functions/setup/settings.R.R")
source("functions/setup/settings.tibble.R")

source("functions/setup/set.and.test.tor.proxy.f.R")
source("functions/setup/check.for.tor.config.error.f.R")

source("functions/setup/package.check.f.R")
source("functions/setup/list.install.and.load.required.packages.f.R")

source("functions/format.portfolio/select.portfolio.f.R")
source("functions/format.portfolio/create.pair.lookup.f.R")
source("functions/cryptowatch/list.portfolio.pair.exchange.options.f.R")
source("functions/cryptowatch/get.cryptowatch.data.f.R")
source("functions/cryptowatch/filter.cryptowatch.data.to.price.last.f.R")
source("functions/cryptowatch/get.exchange.options.f.R")

source("functions/format.portfolio/calculate.portfolio.valuation.f.R")
source("functions/format.portfolio/create.exchange.price.lookup.column.f.R")
source("functions/format.portfolio/add.values.to.portfolio.f.R")
source("functions/format.portfolio/process.values.data.f.R")
source("functions/format.portfolio/add.column.sums.f.R")