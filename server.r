function(input, output, session) {
  
  output$notificationsMenu <- renderMenu({

    # msgs <- apply(messageData, 1, function(row) {
    #   messageItem(from = row[["from"]], message = row[["message"]])
    # })
    #
    # # This is equivalent to calling:
    # #   dropdownMenu(type="messages", msgs[[1]], msgs[[2]], ...)
    # dropdownMenu(type = "messages", .list = msgs)

    dropdownMenu(
      type = "notifications",
      notificationItem(
        text = "5 new species",
        icon("leaf")
      ),
      notificationItem(
        text = "2 new locations",
        icon("map-marker"),
        status = "success"
      ),
      notificationItem(
        text = "Up 3 places",
        icon = icon("rocket"),
        status = "warning"
      )
    )

  })
  
  output$userstats <- renderUI({
    
    div(style = 'width:760px;
                 height:100px;
                 margin: 0 auto 24px auto;',
        div(class = 'expandingprofile',
            div(class =  'profile-number-container',
                div(class =  'profile-number', '125'),
                div('Species Recorded')),
            div(class =  'profile-number-container',
                div(class =  'profile-number', '23'),
                div('Locations Visited')),
            div(class =  'profile-number-container',
                div(class =  'profile-number', '15'),
                div('Recorder Level')),
            div(class =  'profile-number-container',
                div(class =  'profile-number', '5694'),
                div('Recorder Points'))
            ))
    
  })
  
  output$hline <- renderUI({
    
    div(style = 'background-color: rgba(255, 255, 255, 0.56);
                  width: 90%;
                  height: 3px;
                  position: relative;
                  margin: 0 auto 15px;')
    
  })
  
  output$medals <- renderUI({
    
    medals <- sample(list.files('www/species_icons/', recursive = TRUE, all.files = TRUE), 10)

    medalDiv <- lapply(medals, FUN = function(medal){
      
      percentage <- round(runif(1, 1, 100))
      
      div(class = 'medalcontainer',
          div(style = paste('position: absolute; bottom: 0; height:',
                            paste0(runif(1,0,100), '%;')),
              div(class = 'medalprogressdiv')),
          img(class = 'speciesmedal',
              src = file.path('species_icons', medal),
              style = 'margin: 10px; position: relative;'),
          br(),
          div(gsub('.png', '', basename(medal)), style = 'color: white; position: relative; margin-bottom: 10px;')
        )
      })
      
    do.call(tagList, medalDiv)
    
  })

  output$progressMenu <- renderMenu({

    # msgs <- apply(messageData, 1, function(row) {
    #   messageItem(from = row[["from"]], message = row[["message"]])
    # })
    #
    # # This is equivalent to calling:
    # #   dropdownMenu(type="messages", msgs[[1]], msgs[[2]], ...)
    # dropdownMenu(type = "messages", .list = msgs)

    dropdownMenu(
      type = "tasks",
      icon = icon('star'),
      badgeStatus = "success",
      taskItem(
        value = 90, color = "aqua",
        "Record 5 birds"
      ),
      taskItem(
        value = 17, color = "aqua",
        "Record 3 days in a row"
      ),
      taskItem(
        value = 75, color = "aqua",
        "Be the king of 5 locations"
      ),
      taskItem(
        value = 80, color = "aqua",
        "Vist 3 locations in a day"
      )
    )

  })
  
  output$speciesIcons <- renderUI({

    # A loop that goes through the list of all teh
    # species groups and selects the colour of icon
    # depending on the number of species the user has
    # recorded. Each image should be in a float left div
    # and underneath should havea  progress bar

    # pogress bars like this
    tags$div(
      class = "progress",
      tags$div(
        class = "progress-bar progress-bar-success",
        style = "width: 40%"
      )
    )

  })
}
