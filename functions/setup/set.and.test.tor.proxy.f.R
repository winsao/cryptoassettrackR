set.and.test.tor.proxy.f <-  function (
	use.tor.proxy.f  #TRUE or FALSE based on user input
) {
  if(use.tor.proxy.f==FALSE) {
  # User does not want to use Tor
  # Remove system environment variables (in case activated previously)
    Sys.unsetenv("http_proxy")
    Sys.unsetenv("HTTPS_PROXY")
    print("R is not configured to use Tor.")
} else {
  # User wants to use Tor
		
  # Set R system environment variables
    Sys.setenv(http_proxy="socks5://127.0.0.1:9050")
    Sys.setenv(HTTPS_PROXY="socks5://127.0.0.1:9050")

  # Check Tor status with torproject.org  
    tor.check.result.t <- readLines("https://check.torproject.org/")
    tor.status.t <- tor.check.result.t[8]
    ip.address.lookup <- grep("IP address", tor.check.result.t, fixed=T)
    ip.t <- tor.check.result.t[ip.address.lookup]
    ip.t <- gsub("  <p>Your IP address appears to be:  <strong>", "", ip.t)
    ip.t <- gsub("</strong></p>", "", ip.t)
  if (grepl("Congratulations", tor.status.t)) {
    print(paste("Congratulations. R is configured to use Tor. IP:", ip.t))
} else {
  # User wants to use Tor but it is is not working.
    print(paste("Error! R is *not* configured to use Tor. IP:", ip.t))
}
}
}

# # Check system environment variables
# Sys.getenv("http_proxy")
# Sys.getenv("HTTPS_PROXY")
# 
# Alternate IP websites
# readLines("https://httpbin.org/get")

# Acknowledgments:
# https://gist.github.com/leoluyi/21fdf8c7eff74c63178046208806194e