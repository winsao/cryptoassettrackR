# `cryptoassettrackR`

### Purpose
`cryptoassettrackR` allows a user to obtain the current value of a cryptoasset portfolio specified by the user. Unlike mobile apps and cloud spreadsheets, no private portfolio data is provided to third parties, and the bulk price data download can be performed through Tor. Asset values are displayed in user's selected fiat currency as well as in $BTC and $ETH.

### Price Data
[Cryptowatch](https://cryptowat.ch) provides a general use public market REST API detailed [here](https://cryptowat.ch/docs/api).  

The `get.cryptowatch.data.f` function obtains [all current Cryptowatch pricing data](https://api.cryptowat.ch/markets/summaries) and returns the data in a "long" format.

Based on user's desired portfolio (as specified in `portfolio.sample.R` or `portfolio.private.R`, the latter of which is ignored via `.gitignore` for privacy), the values required to compute the latest portfolio value are extracted from the downloaded Cryptowatch data. A summary of the portfolio value is then displayed in a nicely formatted table.

## Getting Started

### System Requirements
`cryptoassettrackR` runs on GNU/Linux, macOS (f.k.a. Mac OS X), and Windows with the `R` programming language installed.

### Required: R programming language
##### GNU/Linux
https://cran.r-project.org/bin/linux/  
(`R` is also available through official Debian and Ubuntu package repositories)

##### macOS
https://cran.r-project.org/bin/macosx/

##### Windows 
https://cran.r-project.org/bin/windows/

### Recommended: RStudio Desktop
RStudio installers for GNU/Linux, macOS, and Windows are available here:  
https://www.rstudio.com/products/rstudio/download/#download  

To validate RStudio's GNU/Linux builds, the RStudio code signing public key (info@rstudio.com, key ID: E331692F) is available here:  
https://www.rstudio.com/code-signing/

### Recommended: Tor Browser
Tor Browser installers for GNU/Linux, macOS, and Windows are available here:  
https://www.torproject.org/download/download.html.en  

Beneath each download button is a link named "sig" to download the `.asc` digital signature for each file. When verifying your download with the associated `.asc` file, it should indicate signing by a Tor developer key listed here:  
https://www.torproject.org/docs/signing-keys.html.en  

### Next Steps
Download the `cryptoassettrackR` repository (click green "Clone or download" button in upper right of this page and select "download ZIP") and unzip on your local machine. Or, clone this repository with:  
`git clone https://github.com/winsao/cryptoassettrackR.git`  

If using RStudio, open RStudio and select File > New Project > Existing Directory and select the local directory containing the repository.

Next, open `configuration.R` and indicate:  

- if you want to download data with Tor (assign `use.tor.proxy` as `TRUE` or `FALSE`)

- if you want to use `portfolio.sample.R` or `portfolio.private.R` (assign `use.portfolio.private` as `TRUE` or `FALSE`). Regardless of selection, if `portfolio.private.R` does not exist, following the first run of `configuration.R`, `portfolio.private.R` is created as a copy of `portfolio.sample.R` and can then be edited. If `portfolio.private.R` exists, it is not overwritten with a copy of `portfolio.sample.R`.

- if you want to see available exchanges for price reference (assign `get.exchange.options` as `TRUE` or `FALSE`)  

If you want to value a user-specified portfolio instead of the sample data, set `use.portfolio.private` to `TRUE`. Open `portfolio.private.R` and indicate:  

- your preferred fiat currency of reference (set `fiat.base` to "USD", "EUR", etc.)  
- asset `ticker` (e.g. "ltc")  
- `base` (either `fiat.base` assigned previously or `btc.base`; the latter may be required for assets lacking fiat pairs)  
- `quantity`, and   
- `exchange` (e.g. "bitfinex")  

**Once the `configuration.R` and portfolio files are set as you'd like, run the entire `configuration.R` file by selecting all lines and running them (RStudio default keyboard shortcut for run selected lines is `ctrl`+`enter`) or by running `master.R`.**  

The two required `R` packages `dplyr` and `jsonlite` will install and/or load automatically via the `list.install.and.load.required.packages.f` function. Allow some additional time for installation of these packages on first run. The package download will fail if `error.in.tor.config` is `TRUE`.

After running, in addition to displaying in the `R` console, the portfolio value table is written as a time stamped `.csv` to the `output-of-historical-portfolio-value` folder. Also, a time stamped `.csv` of the supporting Cryptowatch data is written to the `output-of-historical-cryptowatch-data` folder. All `.csv` files in both folders are ignored via `.gitignore`.  

If prices are returned as `NA` for any asset, confirm the `ticker` plus `base` is available from Cryptowatch.

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