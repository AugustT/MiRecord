#install.packages('shinydashboard')
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Species Awards", tabName = "species", icon = icon("leaf")),
    menuItem("Records", icon = icon("map-marker"), tabName = "records"),
    menuItem("Leagues", icon = icon("rocket"), tabName = "leagues")
  )
)

body <- dashboardBody(
  tags$head(
    includeCSS(path = "www/custom.css")
  ),
  
  tabItems(
    tabItem(tabName = "species",
            htmlOutput('userstats'),
            htmlOutput('hline'),
            htmlOutput('medals')
    ),
    
    tabItem(tabName = "records",
            h2("Records tab content", style = 'color: #000000'),
            div(class = 'timeseries_holder',
                dygraphOutput('timeseries'))
    ),
    
    tabItem(tabName = "leagues",
            h2("Leagues tab content", style = 'color: #000000')
    )
  )
)

header <- dashboardHeader(
  title = "MiRecord",
  dropdownMenuOutput("notificationsMenu"),
  dropdownMenuOutput("progressMenu")
)

# Put them together into a dashboardPage
dashboardPage(
  skin = 'black',
  header,
  sidebar,
  body
)