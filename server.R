# Author: Denis Petrov
# petrovdenis [at] gmail [dot] com
# Date: 2014-06-21

library (shiny)
suppressPackageStartupMessages (library (googleVis))  # gvisPieChart ()

# Define server logic required to summarize and view the selected dataset
shinyServer ( function (input, output, session) 
{
  # Get the list of years of the chosen country
  GetYears = reactive (
    {
      # Reactive:
      #   input$country: chosen country.
      # 
      # Returns:
      #   list of years for the selected country.
      sel.country <- input$country
      years.u <- unique (ds.countries$year[ds.countries$country == sel.country])
      ret.v <- sort (years.u)
      return (ret.v)
    }
  )
  
  # Update the list of years
  observe (
    {
      choices.r <- GetYears ()
      updateSelectInput (session, "year", choices = choices.r, 
                         selected = choices.r [1])
    }
  )
  
  # Set the text on the top of the main panel
  
  GetText <- reactive (
    {
      # Reactive:
      #   input$country: chosen country.
      #   input$year: chosen year.
      # 
      # Returns:
      #   text to represent as a header.
      sel.country <- input$country
      sel.year <- input$year
      
      if (sel.year == '')
      {
        sel.year <- ds.countries$year [ds.countries$country == sel.country] [1]
      }
      text.display <- paste (input$country, ' (', sel.year, ')', sep = '')
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
  
  
  # Return the requested data
  GetData <- reactive (
    {
      # Reactive:
      #   input$country: chosen country.
      #   input$year: chosen year.
      # 
      # Returns:
      #   data.frame of selected country and year of elections.
      sel.country <- input$country
      sel.year <- input$year
      
      df.ret <- NULL
      
      if (sel.year == '')
      {
        sel.year <- ds.countries$year [ds.countries$country == sel.country] [1]
      }
      
      r.sel <- ds.countries$country == sel.country & 
        ds.countries$year == sel.year
      df.ret <- ds.countries [r.sel, flds.view]
      return (df.ret)
    }
  )
  
  # update the table
  output$view <- renderTable (
    {
      input$goButton
      isolate (GetData ())
    }, 
    include.rownames = FALSE  # exclude row names from the output
  )
  
  # update pie chart
  output$viewchart <- renderGvis (
    {
      input$goButton
      isolate (gvisPieChart (GetData () [, flds.plot]))
    }
  )  
}
)
