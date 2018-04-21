package.check.f <- function(packages.to.load.f) {
  # used in: 
    # list.install.and.load.required.packages.f function
	
	# If package is installed, it's loaded by require function AND 
	# the if condition returns FALSE (nothing further is run).
	
	# If package is not installed, the if condition is TRUE, 
	# so the package is then downloaded/installed and loaded.
	
    if (!require(packages.to.load.f, character.only=TRUE)) {
      install.packages(packages.to.load.f, dependencies=TRUE)
      library(packages.to.load.f, character.only=TRUE)
  }
}

# Acknowledgment:
# A Hassle-Free Way to Verify that R Packages are Installed and Loaded
# Author: Vikram Baliga
# Date: 2015-07-19
# https://www.vikram-baliga.com/blog/2015/7/19/a-hassle-free-way-to-verify-that-r-packages-are-installed-and-loaded