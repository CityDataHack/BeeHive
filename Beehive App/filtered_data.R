reduced_df <- reactive({
  
  filtered <- base2012 %>%
                filter(SiteID %in% input$location)
  # print(filtered)
})