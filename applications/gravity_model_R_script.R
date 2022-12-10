#GRAVITY MODEL TRIAL ON R STUDIO - SEMINAR IN ECONOMICS I

#let's install the ggplot package for graphs
install.packages('ggplot2', repos = "http://cran.us.r-project.org")
#add the ggplot package to the library
library(ggplot2)

#import the data from "import dataset" combo box from the RHS panel (from text, excel, etc.)
#let's create a scatter plot for GDP and export
ggplot(gravity_data,aes(x=gdp,y=export))+
  geom_point()+
  geom_smooth(method = "lm")

#there are outliers in the data (US and China). Maybe we can remove them by creating a subset of gravity_data dataframe. let's name it as gravity_data1
gravity_data1=subset(gravity_data,gdp<3.865759e+12)

#now create a scatter plot excluding the outlier countries:
ggplot(gravity_data1,aes(x=gdp,y=export))+
  geom_point()+
  geom_smooth(method = "lm")
#that looks better as the trend line of the combination points fits to the expectations (positive relationship btw EXPORT AND GDP)
#now let's take a look at the scatter plot for GDP and distance
ggplot(gravity_data,aes(x=distance,y=export))+
  geom_point()+
  geom_smooth(method = "lm")
#that did not fit very well.

#let's take logs of all variables as they are not in ratio forms
logexport <- log(gravity_data$export)
loggdp <- log(gravity_data$gdp)
logdistance <- log(gravity_data$distance)

#to create regression model
lm(formula=logexport~loggdp+logdistance)

#to insert the regression model under a name, such as "fit"
fit<-lm(formula=logexport~loggdp+logdistance)
#let's summarize "fit"
summary(fit)

#we can also create scatter plot using "plot" command as well. to add a fitted line, use "abline" command after "plot" command
plot(loggdp,logexport)
plot(loggdp,logexport, main = "Relationship btw GDP and EX under Gravity Model", xlab = "log(GDP)", ylab = "log(EXPORT)")
abline(lm(logexport ~ loggdp), col = "blue")
