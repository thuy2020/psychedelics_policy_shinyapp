library(shiny)
library(DT)
library(plotly)

shinyUI(fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),
  
  # Add the navbar
  tags$nav(
    class = "navbar navbar-default navbar-custom",
    tags$div(class = "container-fluid",
             tags$div(class = "navbar-left",
                      tags$a(href = "#", tags$img(src = "logo.png", height = "40px"))
             ),
             tags$div(class = "navbar-title", "")
    )
  ),
  
  fluidRow(
    class = "custom-row",
    column(4, # 1/3 of the page for text
           h3("American Psilocylin"),
           HTML("<br><br><br>Survey question: 
                <br>
                <i>'Have you ever, even once, used psilocybin, found on mushrooms?'</i>
                <br><br><br>
                <i> Source</i>: 
                <a href='https://www.samhsa.gov/data/data-we-collect/nsduh-national-survey-drug-use-and-health' target='_blank'>Substance Abuse and Mental Health Services Administration (SAMHSA)</a>
                ")
    ),
    column(8, # 2/3 of the page for charts
           plotlyOutput("plotly_american")
    )
  ),
  
  # Row for OR
  fluidRow(
    class = "custom-row",
    column(4, # 1/3 of the page for text
           h3("Oregon Crime & Psilocybin"),
           HTML("<br><br>
           Associated drugs at time of crime report (not necessarily followed by an arrest), 
           filtered by 'other hallucinogen' type of drug for all Oregon counties.
              <br><br><br>
              
            <i>Source</i>: <a href='https://public.tableau.com/app/profile/andrew.m5202/viz/NIBRSOffenseDashboardv2/OffensesDashboard' target='_blank'>Oregon State Police</a>, 
              <a href='https://app.smartsheet.com/b/publish?EQBCT=56556df65c8545faaa46cdd406927aa4' target='_blank'>smartsheet.com</a>")
    ),
    column(8, # 2/3 of the page for charts
           tabsetPanel(
             tabPanel("Crime", plotlyOutput("plotly_ORcrime")),
             tabPanel("Psilocybin", plotlyOutput("plotly_ORpsilocybin"))
           )
    )
  ),
  
  # Row for CO
  fluidRow(
    class = "custom-row",
    column(4, # 1/3 of the page for text
           h3("Colorado Crime"),
           HTML("<br><br>Associated drugs at time of crime report (not necessarily followed by an arrest), 
             filtered by 'other hallucinogen' type of drug for all Colorado counties.
                <br><br><br>
                <i>Source</i>: <a href='https://coloradocrimestats.state.co.us/tops' target='_blank'>Colorado Crime Stats</a>")
    ),
    column(8, # 2/3 of the page for charts
           plotlyOutput("plotly_COcrime")
    )
  ),
  
  # Next section
  fluidRow(
    class = "custom-row",
    column(4, # 1/3 of the page for text
           h3("Hallucinogens"),
           HTML("<br><br>
           <b>California</b>: Total counts of incidents for ICD-10 codes related to hallucinogenic-substances (such as F16.x) 
           for all California hospital inpatient discharges.
            <br>
           <i>Source</i>: <a href='https://hcai.ca.gov/data/healthcare-utilization/inpatient/' target='_blank'>California Department of Health Care Access and Information</a>
           <br><br>
             <b>Massachusetts</b>: Associated drugs with arrests, total incidences per year, for all Massachusetts counties
            <br>
            <i>Source</i>: <a href='https://ma.beyond2020.com/ma_public/View/dispview.aspx' target='_blank'>Massachusetts State Police CrimeSOLV</a>   
            <br><br>
            <b>Colorado</b>: 
            <br>
            <i>Source</i>: <a href='https://coloradocrimestats.state.co.us/tops' target='_blank'>Colorado Crime Statistics</a>   
                ")
    ),
    column(8, # 2/3 of the page for charts
           tabsetPanel(
             tabPanel("California", plotlyOutput("plotly_CAhallucinogen")),
             tabPanel("Massachusetts", plotlyOutput("plotly_MAhallucinogen")),
             tabPanel("Colorado", plotlyOutput("plotly_COhallucinogens"))
           )
    )
  ),
  
  # Section
  fluidRow(
    class = "custom-row",
    column(4, # 1/3 of the page for text
           h3("Interviews"),
           p("")
    ),
    column(8, # 2/3 of the page for charts
           tabsetPanel(
             tabPanel("Interviews responses", plotlyOutput("plotly_COinterview")),
             tabPanel("Quotes", HTML("
             <br><br><br>
             <i>We do not have psilocybin-related data on-hand to share with you, 
             and it’s a bit difficult to track because a psilocybin-related arrest/recovery shows up in our records management system 
             under “Hallucinogen Possess” or “Hallucinogen MFR”, etc., which could also involve other hallucinogens, 
             meaning a case-by-case review would be required.
<br><br>
What I can share is that anecdotally, psilocybin has not been a significant law enforcement issue in Denver 
either prior to or following the passage of Proposition 122</i>.
<br><br>
- <i>The Denver Police Department</i> -
<br><br><br>
"))
           )
    )
  )
))
