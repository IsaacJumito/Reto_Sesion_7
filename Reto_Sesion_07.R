install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

install.packages("dplyr")
library(dplyr)


dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage WHERE Language ='Spanish'")

class(DataDB)
head(DataDB)

install.packages ("ggplot2")
library(ggplot2)

ggplot(DataDB, aes(x=reorder(CountryCode, Percentage, sum), y=Percentage, fill=IsOfficial)) +
  geom_bar(stat="identity") +
  coord_flip()
