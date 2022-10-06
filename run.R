###############################
#Automation script
#Load libraries

library(knitr)
library(rmarkdown)
library(Microsoft365R)
library(odbc)
library(futile.logger)
library(tryCatchLog)

#Catch errors
options(keep.source = TRUE)
options("tryCatchLog.write.error.dump.file" = TRUE)
flog.appender(appender.file("error.log"))
flog.threshold(ERROR)

#Wrap error capture
mainCode <- function() {
  
Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/quarto/bin/tools")

my_outlook <- Microsoft365R::get_business_outlook()
knit( "Automated_Data_Pull.Rmd")
render("Automated_Data_Pull.Rmd", output_format = "html_document")
my_outlook$create_email()$ 
  set_body("Good evening, 
           
           Attached is your data pull for tomorrows meeting.
           
           Autobot.")$ 
  set_recipients(to="###.com")$ 
  set_subject("Autobot")$ 
  add_attachment("Automated_Data_Pull.html")$ 
  send()
}

#run function
tryCatchLog::tryCatchLog(mainCode())
