## check_packages.R

#Run this script to check for packages that the other R scripts will use. If missing, try to install.
#code borrowed from here:
#http://www.vikram-baliga.com/blog/2015/7/19/a-hassle-free-way-to-verify-that-r-packages-are-installed-and-loaded

#add new packages to the chain here
packages = c("here", "texreg", "pander","stargazer",
             "broom", "knitr", "kableExtra",
             "psych","car","MASS","VGAM","nlme",
             "sandwich","lmtest","survey","mice",
             "mfx","nnet","BMA","logistf",
             "gapminder",
             "ggplot2","ggalt","scales","ggrepel",
             "scatterplot3d","corrgram")

package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})