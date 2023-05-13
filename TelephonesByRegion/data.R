library(datasets)
library(ggplot2)
library(reshape2)
library(dplyr)
library(melt)


df_worldphones <- WorldPhones
summary(df_worldphones)

dim(df_worldphones)

df_worldphones <- melt(df_worldphones,id.vars=c(),value.name="value",
                                       variable.name="Region")


dim(df_worldphones)
names(df_worldphones) = c("Year", "Region", "Value")
