library(shiny)

#reading in windfarm image
wfarm <- base64enc::dataURI(file="www/UKwindfarm (1).png", mime="image/png")
img(src=wfarm)

habitats <- read.csv("www/habitats.csv")


#define ui ----

ui <- fluidPage(titlePanel("title panel"),
                
                sidebarLayout(
                  sidebarPanel("MySidebar", h3("a button"), actionButton(inputId = "my_submitstatus", label="Submit"), position = "left", checkboxGroupInput(inputId = "my_checkgroup", 
                                                                                                                                                             h3("Checkbox group"), 
                                                                                                                                                             choices = list("Woodland" = 1, 
                                                                                                                                                                            "Grassland" = 2, 
                                                                                                                                                                            "Urban" = 3),
                                                                                                                                                             selected = 1)),
                               
                
                    mainPanel(
                    p("This website will be to help planners asssess potential windfarm development areas in Cumbria, and achieve a", strong("balance"),"between different", em("interest groups"), "and other users"
                  ),
                  img(src=wfarm), plotOutput(outputId = "habitats_plot"))))
                  
                  

#define server ----

server <- function(input, output) {output$habitats_plot <- renderPlot(
  hist(habitats[,1])
)

                                                
  
}

#run the app ----

shinyApp(ui = ui, server = server)

