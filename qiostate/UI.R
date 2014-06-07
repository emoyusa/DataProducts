shinyUI(fluidPage(
headerPanel("Hospital Quality Measures by State, 2010"),
sidebarLayout(position='right',
sidebarPanel(
selectInput("measure", "Choose a measure:",
choices = c("Heart Attack PCI","Heart Failure ACE","Heart Failure Discharge","Pneumonia Composite","Pneumonia Cultures","Pneumonia Dose 6 Hrs",
"Pneumonia Right Antibiotic","Pneumonia Influenza","Pneumonia Pneumovax","Surgery Antibiotic Timing","Surgery Right Antibiotic",
"Surgery Glucose Controlled","Surgery Hair Removed","Surgery Prevent Clots","Surgery Beta Blocker","Surgery Catheter Removed",
"Surgery Temperature","AMI Deaths","CHF Deaths","AAA Repair Deaths","CABG Deaths","PTCA Deaths","Pneumonia Deaths",
"PSI Birth Trauma","PSI OB Trauma No Instument","PSI OB Trauma Instrument","PSI Postop Sepsis","PSI Pneumothorax","PSI Low Mort Deaths")
)
),

mainPanel(
h4(textOutput("text")),
htmlOutput("view"),
h5(textOutput("note")),
h5(textOutput("source"))
)
)
))