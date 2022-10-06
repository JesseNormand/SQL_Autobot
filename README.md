# SQL_Autobot
Using the following packages I was able to constuct an automated SQL query, report creation, and send email.

library(knitr)
library(rmarkdown)
library(Microsoft365R)
library(odbc)
library(futile.logger)
library(tryCatchLog)
library(dplyr)
library(ggplot2)
library(odbc)
library(scales)

The last component to automating the script is setting up a task in Windows Task Scheduler to auto-run the run.R script. There were definitely some challenges
to get the scripts and connections in sync so feel free to reach out to me with any questions, happy to assist.
