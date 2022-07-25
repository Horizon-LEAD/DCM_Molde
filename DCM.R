model<-function(dataset){

#upload the libraries
library(mlogit)
library(stargazer)

#upload the file
library(readxl)
dat<-read_excel(dataset)

#create the formula
names<-names(dat[,2:length(dat)-1])
q<-as.formula(dat[,c(names)])

#create the mlogit dataset
a<-names(dat)[1]
b<-names(dat)[length(dat)]
dat<-mlogit_dataset<-mlogit.data(dat, shape="long",choice=a,alt.var=b)

#calculate the multinomial logit
mod<-mlogit(q,data=dat)
summary<-summary(mod)

#create a table
summary<-summary$CoefTable

# Write the data to a csv file
fileName <- sprintf("%s_%s.csv", as.integer(Sys.time()), digest::digest(summary))
file<-write.csv(summary,file=fileName)
write.csv(summary,file=fileName)
z<-list(summary, file)
return(z)

}