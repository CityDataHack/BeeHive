
  output$PublicTransportAccessIndex <- renderValueBox({
    valueBox(
      format(reduced_df()$PTALBY), "Public Transport Access Index", icon = icon("list"),
      color = "purple"
  )
})

  output$GreenSpaceIndex <- renderValueBox({
    valueBox(
      format(reduced_df()$GreenSpaceIndex, na.rm = T), "Green Space Index", icon = icon("list"),
      color = "purple"
    )
  })

output$SchoolsAccessIndex <- renderValueBox({
  valueBox(
    format(reduced_df()$SchoolsAccessIndex, na.rm = T), "Schools Access Index", icon = icon("list"),
    color = "purple"
  )
})

output$SupermarketsAccessIndex <- renderValueBox({
  valueBox(
    format(reduced_df()$SupermarketsAccessIndex, na.rm = T), "Supermarkets Access Index", icon = icon("list"),
    color = "purple"
  )
})

output$SafetyIndex <- renderValueBox({
  valueBox(
    format(reduced_df()$SafetyIndex, na.rm = T), "Safety Index ", icon = icon("list"),
    color = "purple"
  )
})

output$ActiveTravelPlanIndex <- renderValueBox({
  valueBox(
    format(reduced_df()$ActiveTravelPlanIndex, na.rm = T), "Active Travel Plan Index ", icon = icon("list"),
    color = "green"
  )
})

output$GeneralAccessibilityIndex <- renderValueBox({
  valueBox(
    format(reduced_df()$GeneralAccessibilityIndex, na.rm = T), "General Accessibility Index", icon = icon("list"),
    color = "red"
  )
})

