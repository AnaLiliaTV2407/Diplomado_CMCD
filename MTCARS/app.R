
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel(title=h3("Motor Trend Car Road Tests", style="background-color: turquoise;", align="center")
               ),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          selectInput(inputId = "var","1. Selecciona la  variable X del conjunto de datos Mtcars",
                      choices = c("mpg"=1, "cyl"=2, "disp"=3, "hp"=4,
                                  "drat"=5, "wt"=6, "qsec"=7, "vs"=8,
                                  "am"=9, "gear"=10, "carb"=11)
                      ),
          br(),
          selectInput(inputId = "var2","2. Selecciona la variable  Y del conjunto de datos Mtcars",
                      choices = c("mpg"=1, "cyl"=2, "disp"=3, "hp"=4,
                                  "drat"=5, "wt"=6, "qsec"=7, "vs"=8,
                                  "am"=9, "gear"=10, "carb"=11)
          ),
          style="background-color: turquoise;",
          br(),
          sliderInput("bins", "3. Selecione el numero de barras para el histograma", min = 2, 
                      max =25, value=15),
          br(),
          radioButtons(inputId = "color", "4. Selecciona el color del histograma",
                       choices = c("Red","Blue", "Green", "Pink1","Yellow", "Orange"), selected = "Red"),
          radioButtons(inputId = "type", label="5. Seleccione el tipo de documento",
                       choices = list("png","pdf"))
          
        ),

        # Para las pestañas
        mainPanel(
          style="background-color: turquoise;",
          tabsetPanel(type="tab",
                      tabPanel("Grafico", plotOutput("myhist"),br(), downloadButton(outputId = "down",label = "Descargar el Grafico")),
                      tabPanel("Grafico de correlacion", plotOutput("myhist2"),br(), downloadButton(outputId = "down1",label = "Descargar el Grafico")),
                      tabPanel("Data", tableOutput("data")),
                      tabPanel("Summary", verbatimTextOutput("summary")),
                      tabPanel("Estructura", verbatimTextOutput("str"))
                      
                     
                      )
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  #Funcion colm para el primer grafico 
  colm<-reactive({
    as.numeric(input$var)
  })
  #funcion colm para el segundo grafico y para que me deje poner el nombre en los ejes
  colm2<-reactive({
    as.numeric(input$var2)
  })
  
  
  #seccion para la salida del summary
  output$summary<-renderPrint({
    summary(mtcars)
    
  })
  
  
  #Seccion para la salida de la estructura de los datos
  output$str<-renderPrint({
    str(mtcars)
  })
  
  
  #Sección para la salida de la base de datos
  output$data<-renderTable({
    #colm<-as.numeric(input$var)
    mtcars[colm()]
  })
  
#Seccion para la salida del  histograma
    output$myhist<- renderPlot({
      #colm<-as.numeric(input$var)
      hist(mtcars[,colm()], breaks=seq(0, max(mtcars[,colm()]), l=input$bins+1), col=input$color, 
           main="Histograma de la base de datos Mtcars", xlab=names(mtcars[colm()]))
    })
    
    x<-reactive({
      mtcars[,as.numeric(input$var)]
              })
    y<-reactive({
      mtcars[,as.numeric(input$var2)]
    })
    
    #seccion para la salida del plot
    output$myhist2<- renderPlot({
      #colm<-as.numeric(input$var)
      plot(x(),y(), 
           main="Grafico de Correlacion del dataset Mtcars",
           xlab=names(mtcars[colm()]), ylab=names(mtcars[colm2()]),
           col=c("red","blue"),pch=3,lwd=5)
           
    })
    

    
    #Controlador de descarga
    output$down<-downloadHandler(
      #Especificar el nombre del archivo
      filename = function(){
        #mtcars.png
        #mtcars.pdf
        paste("mtcars", input$type, sep = ".")
      }, 
      
      content=function(file)
        {
        #Abrir el dispositivo, #Crear el grafico #cerrar el Dispositivo
        #png()
        #pdf()
        if(input$type == "png")
          png(file)
        else
          pdf(file)
        #output$myhist<- renderPlot({
          #colm<-as.numeric(input$var)
        hist(mtcars[,colm()], breaks=seq(0, max(mtcars[,colm()]), l=input$bins+1), col=input$color, 
             main="Histograma de la base de datos Mtcars", xlab=names(mtcars[colm()]))
        #})
        dev.off()
      }
      
                              )
    #Controlador de descarga 2 
    output$down1<-downloadHandler(
      #Especificar el nombre del archivo
      filename = function(){
        #mtcars.png
        #mtcars.pdf
        paste("mtcars", input$type, sep = ".")
      }, 
      
      content=function(file)
      {
        #Abrir el dispositivo, #Crear el grafico #cerrar el Dispositivo
        #png()
        #pdf()
        if(input$type == "png")
          png(file)
        else
          pdf(file)
        plot(x(),y(), 
             main="Grafico de Correlacion del dataset Mtcars",
             xlab=names(mtcars[colm()]), ylab=names(mtcars[colm2()]),
               col=c("red","blue"), pch=3,lwd=5) #lwd ancho del borde
        dev.off()
      }
      
    )
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
