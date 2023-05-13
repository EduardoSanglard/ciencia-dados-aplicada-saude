# Load Libraries and data ----

library(ggplot2)
library(openxlsx)

setwd("C:/Users/Eduardo Sanglard/Documents/IAA/Ciência de Dados Aplicada a Saúde/Atividade2/Cancer")
dataset_file_path = "./dataset_cancer.csv"

df_cancer = read.table(file=dataset_file_path, sep=',', header = T)

# Data Cleaning and preparation ----

# Remove unused columns
df_cancer = subset(df_cancer, select = -c(Cancer.id, Cancer.label, Population.id, Sex, Type, Change.in.number.of.cases.due.to.risk) )

# Rename Columns
names(df_cancer) = c("Population", "Cases_base_in_2020", "Year", "Prediction", "Change_in_number_of_cases", "Change_in_number_of_cases_due_to_population")

# Convert Population and Year columns to factors
df_cancer$Population <- as.factor(df_cancer$Population)
df_cancer$Year <- as.factor(df_cancer$Year)

# Create DF for change ratio
df_cancer_change_ratio = df_cancer[df_cancer$Year == 2025,]
df_cancer_change_ratio = subset(df_cancer_change_ratio, select = c(Population, Change_in_number_of_cases) )
names(df_cancer_change_ratio) = c("Population", "Cases_Increase_Each_5_Years")
