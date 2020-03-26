## check_packages.R

#Run this script to check for packages that the other R scripts will use. If missing, try to install.
#code borrowed from here:
#http://www.vikram-baliga.com/blog/2015/7/19/a-hassle-free-way-to-verify-that-r-packages-are-installed-and-loaded

#add new packages to the chain here
packages = c("here", "texreg", "pander","stargazer",
             "broom", "knitr", "kableExtra", "dplyr",
             "maptools","sp","rgeos","rgdal",
             "psych","car","MASS","VGAM","nlme",
             "sandwich","lmtest","survey","mice",
             "mfx","nnet","BMA","logistf",
             "gapminder","reshape2",
             "ggplot2","ggalt","scales","ggrepel", "plotly",
             "viridis", "latex2exp",
             "scatterplot3d","corrgram","gganimate","gifski",
             "devtools")

package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE, repos = "http://cran.us.r-project.org")
    library(x, character.only = TRUE)
  }
})

if(!require(patchwork)) {
  devtools::install_github("thomasp85/patchwork")
  library(patchwork)
}

if(!require(icon)) {
  devtools::install_github("ropenscilabs/icon")
} else {
  #don't load to avoid conflicts
  detach("package:icon", unload=TRUE)
}

if(!require(emo)) {
  devtools::install_github("hadley/emo")
} else {
  #don't load to avoid conflicts
  detach("package:emo", unload=TRUE)
}
