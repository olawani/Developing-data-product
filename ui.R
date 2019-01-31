#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("BMI Calculator"),
    
    sidebarLayout(
        sidebarPanel( 
            numericInput("wt_in_kg",label = h4("Enter your weight (in KG)"),min = 40, max = 200, 50),
            numericInput("hg_in_cm",label = h4("Enter your height (in CM)"),min = 50, max = 250, 160),
            actionButton("calculateBMI", label = "Your BMI is")    
        ),
        mainPanel
        (
            tabPanel("BMI Calculator",
                     p(h4("Entered Weights & Heights:")),
                     textOutput("current_height"),
                     textOutput("current_weight"),
                     p(h4("Your BMI is displayed below:")),
                     textOutput("BMI_result"),
                     p(h4("Your BMI classification is:")),
                     textOutput("status_indicator")
            )
        )
    )
))
