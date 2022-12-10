#THIS IS PINAR'S R SCRIPT FOR BASIC ECONOMETRIC ANALYSIS
#BASIC ECONOMETRICS IN R
#data from World Bank (2010) -  per capita CO2 emissions & GDP per capita US$ constant prices
### ### ###

#to enter data
# install.packages("knitr", repos = "http://cran.us.r-project.org")
# library(knitr)

ekc <- read.delim("ekc.txt")

head(ekc)

summary(ekc)

#to create histogram
hist(ekc$co2)

#ggplot command will be used for plotting graphs.
#it is not available by default, so let's install it. To install a package from CRAN, type install.packages ('nameofpackage')
# install.packages("ggplot2")
install.packages('ggplot2', repos = "http://cran.us.r-project.org")

#to use an installed package, type library(nameofpackage)
library(ggplot2)

# ggplot() function is used to construct the plot, aes (aesthetics) aes(x, y) part is for the independent (x) and dependent (y)
# variables, it is followed by + to add component to the plot.
#  method lm() is used for linear smooths, glm() for generalised linear smooths, and loess() for local smooths.
ggplot(ekc,aes(x=gdppc,y=co2))
  +geom_point()
  
  
ggplot(ekc,aes(x=gdppc,y=co2))+
  geom_point()+
  geom_smooth(method = "lm")

loggdppc<-log(ekc$gdppc)
logco2<-log(ekc$co2)

gdppc2<-loggdppc^2

ggplot(data=ekc,aes(x=loggdppc,y=logco2))+
  geom_point()+
  geom_smooth(formula = y~poly(x,2), method = "lm")

#to create regression model
lm(formula=logco2~loggdppc+gdppc2,data=ekc)

fit<-lm(formula=logco2~loggdppc+gdppc2,data=ekc)
summary(fit)

#you can also use plot command
plot(log(ekc$gdppc), log(ekc$co2), main = "EKC", xlab = "logGDPPC", ylab = "logCO2")

plot

plot(log(ekc$gdppc), log(ekc$co2),
     col = ifelse(log(ekc$gdppc) >= 10, "blue", "red"),
     main = "ekc with threshold",
     xlab = "log of gdppc",
     ylab = "log of co2")

ekc_highregime <- subset(ekc, log(ekc$gdppc) >= 10)
ekc_lowregime <- subset(ekc, log(ekc$gdppc) < 10)


# abline function adds one or more straight lines through the current plot

abline(lm(log(ekc_highregime$co2) ~ log(ekc_highregime$gdppc)), col = "blue")
abline(lm(log(ekc_lowregime$co2) ~ log(ekc_lowregime$gdppc)), col = "red")
