check.for.tor.config.error.f <-  function (
  tor.test.result.f  # output of set.and.test.tor.proxy.f function
) {
  grepl("Error!", tor.test.result.f)
}