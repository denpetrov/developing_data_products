# Author: Denis Petrov
# petrovdenis [at] gmail [dot] com
# Date: 

library (shiny)
library (googleVis)  # gvisPieChart ()

# Define server logic required to summarize and view the selected dataset
shinyServer ( function (input, output, session) 
{
  # Get the list of years of the chosen country
  outVar = reactive (
    {
      my.country <- input$country
      years.u <- unique (ds.countries$year[ds.countries$country == my.country])
      ret.v <- sort (years.u)
      return (ret.v)
    }
  )
  
  observe (
    {
      choices.r <- outVar()
      updateSelectInput (session, "year", choices = choices.r, 
                         selected = choices.r [1])
    }
  )
  
  # Set the text on the top of the main panel
  
  GetText <- reactive (
    {
      my.country <- input$country
      my.year <- input$year
      
      if (my.year == '')
      {
        my.year <- ds.countries$year [ds.countries$country == my.country] [1]
      }
      text.display <- paste (input$country, ' (', my.year, ')', sep = '')
      return (text.display)
    }
  )
  
  output$caption <- renderText (
    {
      input$goButton
      isolate (
        GetText ()
        # paste (input$country, ' (', input$year, ')', sep = '')
      )
    }
  )
  
  
  # Return the requested dataset
  datasetInput <- reactive (
  {
    my.country <- input$country
    my.year <- input$year
    
    df.ret <- NULL
    
    if (my.year == '')
    {
      my.year <- ds.countries$year [ds.countries$country == my.country] [1]
    }
    
    r.sel <- ds.countries$country == my.country & ds.countries$year == my.year
    df.ret <- ds.countries[r.sel, flds.view]
    return (df.ret)
  }
  )
  
  output$view <- renderTable (
    {
      input$goButton
      isolate (datasetInput ())
    }, 
    include.rownames = FALSE  # exclude row names from the output
  )
  
  # Return the subset to plot the Pie chart
  dataView <- reactive (
    {
      my.year <- as.integer (input$year)
      my.country <- input$country
      
      df.plot <-NULL
      
      if (input$year == '')
      {
        my.year <- ds.countries$year [ds.countries$country == my.country] [1]
      }
      
      df.plot <- ds.countries [ds.countries$country == my.country & 
                                   ds.countries$year == my.year, flds.plot]
      return (df.plot)
    }
  )
  
  output$viewchart <- renderGvis (
    {
      input$goButton
      isolate (gvisPieChart (dataView ()))
    }
  )  
}
)
