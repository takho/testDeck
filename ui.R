library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Body Mass Index (BMI) Calculator"),
    sidebarPanel(
       numericInput("wt", "Your weight", 1 , min=0, max=400, step =1),    
       selectInput("wtunit", "Weight Unit", c("pound", "kg")),
       numericInput("height", "Your height", 1 , min=0, max=200, step =1),  
       selectInput("heightunit", "Height Unit", c("inch", "cm"))
    ),
   mainPanel(
        h3("Your BMI is"),
        verbatimTextOutput("bmi") ,
        h4("Comment"),             
        verbatimTextOutput("omsg")      
     )
))

