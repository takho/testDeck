library(shiny)

shinyServer(
    function(input, output) {
      #  wt <- { if ( 1 == 1) {wt <-50 } }
         
         BMI <- function(wt, wtunit, height, heightunit) {
            if (wtunit == "pound")
                 { lwt <- 0.454 * wt  }
            else { lwt <- wt   }  
            if (heightunit == "inch")
                 { lheight <- 2.54 * height /100  }
            else { lheight  <- height / 100   }  
            lwt / lheight^2            
         }

         mesg <- function (bmi) {
             if (bmi >= 30 )
               { print("You are obese")}
             else {
                if (bmi >= 25 & bmi <= 29.9 )
                  { print("You are overweight")}
                else {
                    if (bmi >= 18.5 & bmi <= 24.9 )
                      { print("You have normal weight")}
                    else {print("You are underweight")}
                }
             }
        }
 
        output$bmi <- renderPrint( {BMI(input$wt, input$wtunit, input$height, input$heightunit)} )
        output$omsg <- renderPrint( {mesg(BMI(input$wt, input$wtunit, input$height, input$heightunit) )} )
      
   }
)


