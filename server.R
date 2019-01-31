#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    values <- reactiveValues()
    observe({
        input$calculateBMI
        values$bmi <- isolate({
            input$wt_in_kg/(input$hg_in_cm/100 * input$hg_in_cm/100)
        })
    })

    # Display your current values
    output$current_height <- renderText({
        input$calculateBMI
        paste("Current Height in CM :", isolate(input$hg_in_cm))
    })
    
    output$current_weight <- renderText({
        input$calculateBMI
        paste("Current Weight in KG : ", isolate(input$wt_in_kg))
    })
    
    output$status_indicator <- renderText({
        if(input$calculateBMI == 0) ""
        else {
            if (values$bmi < 18.5)
            {
                values$status_indicator = "Underweight"
            }
            else if (values$bmi >= 18.5 & values$bmi <= 24.9)
            {
                values$status_indicator="Normal weight"
            }
            else if (values$bmi >= 24.9 & values$bmi <= 29.9)
            {
                values$status_indicator="Overweight"
            }
            else
            {
                values$status_indicator="Obesity"
            }
            print(values$status_indicator)
        }
    })
    
    # Display your BMI
    output$BMI_result <- renderText({
        if(input$calculateBMI == 0) ""
        else
            print(values$bmi)
    })
})