#install.packages('shinydashboard')
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Species Awards", tabName = "species", icon = icon("leaf")),
    menuItem("Locations", icon = icon("map-marker"), tabName = "locations"),
    menuItem("Leagues", icon = icon("rocket"), tabName = "leagues")
  )
)

body <- dashboardBody(
  tags$head(
    includeCSS(path = "www/custom.css")
  ),
  
  tabItems(
    tabItem(tabName = "species",
            h2("Species tab content", style = 'color: #000000'),
            htmlOutput('userstats'),
            htmlOutput('hline'),
            htmlOutput('medals')
    ),
    
    tabItem(tabName = "locations",
            h2("Locations tab content", style = 'color: #000000')
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