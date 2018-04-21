# `cryptoassettrackR`

### Purpose
`cryptoassettrackR` allows a user to obtain the current value of a specified cryptoasset portfolio value. Unlike mobile apps and cloud spreadsheet solutions, no private portfolio data is provided to third parties, and the bulk price data download can be performed through Tor. Asset values are displayed in user's selected fiat currency as well as in $BTC and $ETH.

### Price Data
[Cryptowatch](https://cryptowat.ch) provides a "a general use public market REST API, providing basic information about all markets on our platform". Read more [here](https://cryptowat.ch/docs/api).

The `get.cryptowatch.data.f` function obtains [all current Cryptowatch pricing data](https://api.cryptowat.ch/markets/summaries) and returns the data in a "long" format.

Based on the user's desired portfolio (as specified in `portfolio.sample.R` or `portfolio.private.R` - the latter is ignored via `.gitignore` - and selected in `configuration.R`), the values required to compute the latest portfolio value are extracted from the long Cryptowatch data. The result is then displayed in a nicely formatted table (i.e. a `tibble`).

## Getting Started

### System Requirements
`cryptoassettrackR` runs on Windows, Mac, and Linux operating systems with the `R` programming language installed.

### Required: R programming language
##### Windows 
https://cran.r-project.org/bin/windows/

##### Mac
https://cran.r-project.org/bin/macosx/

##### Linux
https://cran.r-project.org/bin/linux/  
(`R` is also available through official Debian and Ubuntu package repositories)

### Recommended: RStudio Desktop
https://www.rstudio.com/products/rstudio/download/#download

### Recommended: Tor Browser
https://www.torproject.org/download/download.html.en

### Next Steps
Clone or download the repository to your local machine. If using RStudio, select File > New Project > Existing Directory and select your local repository folder.  

Next, open `configuration.R` and indicate:  

- if you want to download data with Tor (assign `use.tor.proxy` as `TRUE` or `FALSE`)

- if you want to use `portfolio.sample.R` or `portfolio.private.R` (assign `use.portfolio.private` as `TRUE` or `FALSE`). Regardless of selection, if `portfolio.private.R` does not exist, following the first run of `configuration.R`, `portfolio.private.R` is created as a copy of `portfolio.sample.R` and can then be edited. If `portfolio.private.R` exists, it is not overwritten.

- if you want to see available exchanges for price reference (assign `get.exchange.options` as `TRUE` or `FALSE`)  

If `use.portfolio.private` is `TRUE`, open `portfolio.private.R` and indicate:  

- your preferred fiat currency of reference (set `fiat.base` to "USD", "EUR", etc.), asset `ticker`, `base` (either `fiat.base` assigned previously or `btc.base`. `btc.base` may be required for assets lacking fiat pairs), `quantity`, and `exchange`.

Once the `configuration.R` and portfolio file is set as you'd like, run the entire `configuration.R` file by selecting all lines and running them or by running `master.R`.  

If prices are returned as `NA` for any asset, confirm the `ticker` plus `base` is available from Cryptowatch.

The two required `R` packages `dplyr` and `jsonlite` will install and/or load automatically via the `list.install.and.load.required.packages.f` function. The download fails if `error.in.tor.config` is `TRUE`.

# Feedback
If this project is interesting or useful, please mark with a star and/or consider contributing.

# Acknowledgments
- Cryptowatch https://cryptowat.ch
- R Project Contributors https://www.r-project.org/contributors.html
- RStudio https://www.rstudio.com
- Hadley Wickham https://github.com/hadley
- The Tor Project https://www.torproject.org
- Tutanota https://tutanota.com

# Contact
winsao@tuta.io  
(Emails from other Tutanota accounts are automatically end-to-end encrypted.)

For non-Tutanota accounts, encrypt correspondence with public key.  
PGP fingerprint: C11E 2FB2 7E7E 9142 2274 76CD 678D A274 6AF4 51FC  
PGP public key: https://pgp.mit.edu/pks/lookup?op=get&search=0x678DA2746AF451FC  