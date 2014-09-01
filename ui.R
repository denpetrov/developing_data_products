# Author: Denis Petrov
# petrovdenis [at] gmail [dot] com
# Date: 2014-06-21

shinyUI (pageWithSidebar (
  
  # Application title
  headerPanel ('Parlament'),
  
  # Note that changes made to the caption in the textInput control 
  # are updated in the year input area immediately as you select.
  
  sidebarPanel (width = 3, 
    selectInput (inputId = 'country', 
                 label = 'Choose a country:', 
                 choices = GetCountriesList (), selected = 1),
    br (),
    selectInput ('year', 'Choose a year:', ''), 
    actionButton ('goButton', 'Update View'), 
    br (), 
    br (),
    p ('Choose a country to look at the parlament parties distribution.',
       'Choose a year from the list. Click on the button "Update View". '),
    p ('Note that for different countries, the lists of years are different.', 
       'You can see a Pie chart, which represents the percentage of seats of ', 
       'each party in the parlament of a chosen country', 
       'for the chosen year. On the same page, you can see a detailed ', 
       'table, which includes the different indices.')
  ),
  
  # Show the caption, pie chart and the corresponding table.
  mainPanel (
    h3 (textOutput ('caption')),
    h4 ('Observations'),
    htmlOutput ('viewchart'), 
    tableOutput ('view')
  )
))
