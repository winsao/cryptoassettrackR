# USER INPUT: Enter fiat.base, ticker, base, quantity, exchange -----------
## Asset #1 note: leave unchanged as ticker "btc" with base fiat.base
## Asset #1 note (continued): If you have zero btc, put 0 in quantity
## Asset #2 note: leave unchanged as ticker "eth" with base fiat.base or "btc"
## Asset #2 note (continued): If you have zero eth, put 0 in quantity
## Other assets note: base can be fiat.base OR "btc". (e.g. no "eth" base yet)
## Other assets note (continued): Add or delete rows as needed.

fiat.base <- tolower("USD")  # "USD", "EUR", "CAD", "CNY", "AUD", "JPY", etc.
btc.base <- tolower("BTC")  # leave this variable unchanged

portfolio <- 
	tribble(
    ~ticker, ~base, ~quantity, ~exchange,
    "btc", fiat.base, 2, "gdax",
    "eth", fiat.base, 21, "gdax",
    "bch", fiat.base, 1, "gdax",
    "ltc", fiat.base, 100, "gdax",
    "etc", btc.base, 11, "bitfinex",
    "ada", btc.base, 11, "bittrex",
    "neo", btc.base, 11, "bitfinex",
    "xmr", btc.base, 15, "kraken",
)