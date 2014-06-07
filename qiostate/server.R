library(googleVis)
library(shiny)
dat <- read.csv('qioqi.csv')
shinyServer(function(input, output) {


output$text <- renderText({
lab <- switch(input$measure,
"Heart Attack PCI" = "Hospital patients with heart attack given percutaneous coronary intervention within 90 minutes of arrival",
"Heart Failure ACE" = "Hospital patients with heart failure and left ventricular systolic dysfunction who were prescribed ACE inhibitor or ARB at discharge",
"Heart Failure Discharge" = "Hospital patients with heart failure discharged home with written instructions or educational material",
"Pneumonia Composite" = "Hospital patients with pneumonia who received recommended hospital care",
"Pneumonia Cultures" = "Hospital patients with pneumonia who had blood cultures collected before antibiotics were administered",
"Pneumonia Dose 6 Hrs" = "Hospital patients with pneumonia who received the initial antibiotic dose within 6 hours of hospital arrival",
"Pneumonia Right Antibiotic" = "Hospital patients with pneumonia who received the initial antibiotic consistent with current recommendations",
"Pneumonia Influenza" = "Hospital patients age 50 and over with pneumonia who received influenza screening or vaccination",
"Pneumonia Pneumovax" = "Hospital patients age 65 and over with pneumonia who received pneumococcal screening or vaccination",
"Surgery Antibiotic Timing" = "Adult surgery patients who received appropriate timing of antibiotics",
"Surgery Right Antibiotic" = "Surgery patients who were given the right kind of antibiotic to help prevent infection",
"Surgery Glucose Controlled" = "Cardiac surgery patients whose blood sugar is kept under good control in the days right after surgery",
"Surgery Hair Removed" = "Surgery patients needing hair removed from the surgical area before surgery, who had hair removed using a safer method",
"Surgery Prevent Clots" = "Surgery patients whose doctors ordered venous thromboembolism prophylaxis to prevent bloods clots after certain types of surgeries",
"Surgery Beta Blocker" = "Surgery patients on Beta-Blocker therapy prior to arrival and during postoperative period",
"Surgery Catheter Removed" = "Surgery patients with urinary catheter removed within two days after surgery",
"Surgery Temperature" = "Surgery patients with perioperative temperature management",
"AMI Deaths" = "Deaths per 1,000 adult hospital admissions with acute myocardial infarction",
"CHF Deaths" = "Deaths per 1,000 adult hospital admissions with congestive heart failure",
"AAA Repair Deaths" = "Deaths per 1,000 adult hospital admissions with abdominal aortic aneurysm repair",
"CABG Deaths" = "Deaths per 1,000 hospital admissions with coronary artery bypass surgery, age 40 and over",
"PTCA Deaths" = "Deaths per 1,000 hospital admissions with percutaneous transluminal coronary angioplasty, age 40 and over",
"Pneumonia Deaths" = "Deaths per 1,000 adult hospital admissions with pneumonia",
"PSI Birth Trauma" = "Birth trauma - injury to neonate per 1,000 selected live births",
"PSI OB Trauma No Instument" = "Obstetric trauma per 1,000 vaginal deliveries without instrument assistance",
"PSI OB Trauma Instrument" = "Obstetric trauma per 1,000 instrument-assisted deliveries",
"PSI Postop Sepsis" = "Postoperative sepsis per 1,000 elective-surgery admissions of length 4 or more days, adults",
"PSI Pneumothorax" = "Hospital admissions with iatrogenic pneumothorax per 1,000 medical and surgical admissions, adults",
"PSI Low Mort Deaths" = "Deaths per 1,000 hospital admissions with expected low-mortality")


paste(lab)
})

output$view <- renderGvis({
var <- switch(input$measure,
"Heart Attack PCI" = "HeartAttackPCI",
"Heart Failure ACE" = "HeartFailureACE",
"Heart Failure Discharge" = "HeartFailureDischarge",
"Pneumonia Composite" = "PneumoniaComposite",
"Pneumonia Cultures" = "PneumoniaCultures",
"Pneumonia Dose 6 Hrs" = "PneumoniaDose6Hrs",
"Pneumonia Right Antibiotic" = "PneumoniaRightAntibiotic",
"Pneumonia Influenza" = "PneumoniaInfluenza",
"Pneumonia Pneumovax" = "PneumoniaPneumovax",
"Surgery Antibiotic Timing" = "SurgeryAntibioticTiming",
"Surgery Right Antibiotic" = "SurgeryRightAntibiotic",
"Surgery Glucose Controlled" = "SurgeryGlucoseControlled",
"Surgery Hair Removed" = "SurgeryHairRemoved",
"Surgery Prevent Clots" = "SurgeryPreventClots",
"Surgery Beta Blocker" = "SurgeryBetaBlocker",
"Surgery Catheter Removed" = "SurgeryCatheterRemoved",
"Surgery Temperature" = "SurgeryTemperature",
"AMI Deaths" = "AMIDeaths",
"CHF Deaths" = "CHFDeaths",
"AAA Repair Deaths" = "AAARepairDeaths",
"CABG Deaths" = "CABGDeaths",
"PTCA Deaths" = "PTCADeaths",
"Pneumonia Deaths" = "PneumoniaDeaths",
"PSI Birth Trauma" = "PSIBirthTrauma",
"PSI OB Trauma No Instument" = "PSIOBTraumaNoInstument",
"PSI OB Trauma Instrument" = "PSIOBTraumaInstrument",
"PSI Postop Sepsis" = "PSIPostopSepsis",
"PSI Pneumothorax" = "PSIPneumothorax",
"PSI Low Mort Deaths" = "PSILowMortDeaths")

gvisGeoChart(dat,locationvar='State',colorvar=var,
 options=list(region="US", displayMode="regions",
 resolution="provinces",
 width=700, height=400,
 #backgroundColor='yellow',
 colorAxis="{colors:['orange', 'blue']}"
)) 
})

output$note <- renderText({
note <- switch(input$measure,
"Heart Attack PCI" = "Blue",
"Heart Failure ACE" = "Blue",
"Heart Failure Discharge" = "Blue",
"Pneumonia Composite" = "Blue",
"Pneumonia Cultures" = "Blue",
"Pneumonia Dose 6 Hrs" = "Blue",
"Pneumonia Right Antibiotic" = "Blue",
"Pneumonia Influenza" = "Blue",
"Pneumonia Pneumovax" = "Blue",
"Surgery Antibiotic Timing" = "Blue",
"Surgery Right Antibiotic" = "Blue",
"Surgery Glucose Controlled" = "Blue",
"Surgery Hair Removed" = "Blue",
"Surgery Prevent Clots" = "Blue",
"Surgery Beta Blocker" = "Blue",
"Surgery Catheter Removed" = "Blue",
"Surgery Temperature" = "Blue",
"AMI Deaths" = "Orange",
"CHF Deaths" = "Orange",
"AAA Repair Deaths" = "Orange",
"CABG Deaths" = "Orange",
"PTCA Deaths" = "Orange",
"Pneumonia Deaths" = "Orange",
"PSI Birth Trauma" = "Orange",
"PSI OB Trauma No Instument" = "Orange",
"PSI OB Trauma Instrument" = "Orange",
"PSI Postop Sepsis" = "Orange",
"PSI Pneumothorax" = "Orange",
"PSI Low Mort Deaths" = "Orange")

paste("Note: ",note," indicates better quality. Green indicates no data.")
})

output$source <- renderText({
source <- switch(input$measure,
"Heart Attack PCI" = "Quality Improvement Organization data",
"Heart Failure ACE" = "Quality Improvement Organization data",
"Heart Failure Discharge" = "Quality Improvement Organization data",
"Pneumonia Composite" = "Quality Improvement Organization data",
"Pneumonia Cultures" = "Quality Improvement Organization data",
"Pneumonia Dose 6 Hrs" = "Quality Improvement Organization data",
"Pneumonia Right Antibiotic" = "Quality Improvement Organization data",
"Pneumonia Influenza" = "Quality Improvement Organization data",
"Pneumonia Pneumovax" = "Quality Improvement Organization data",
"Surgery Antibiotic Timing" = "Quality Improvement Organization data",
"Surgery Right Antibiotic" = "Quality Improvement Organization data",
"Surgery Glucose Controlled" = "Quality Improvement Organization data",
"Surgery Hair Removed" = "Quality Improvement Organization data",
"Surgery Prevent Clots" = "Quality Improvement Organization data",
"Surgery Beta Blocker" = "Quality Improvement Organization data",
"Surgery Catheter Removed" = "Quality Improvement Organization data",
"Surgery Temperature" = "Quality Improvement Organization data",
"AMI Deaths" = "Healthcare Cost and Utilization Project data",
"CHF Deaths" = "Healthcare Cost and Utilization Project data",
"AAA Repair Deaths" = "Healthcare Cost and Utilization Project data",
"CABG Deaths" = "Healthcare Cost and Utilization Project data",
"PTCA Deaths" = "Healthcare Cost and Utilization Project data",
"Pneumonia Deaths" = "Healthcare Cost and Utilization Project data",
"PSI Birth Trauma" = "Healthcare Cost and Utilization Project data",
"PSI OB Trauma No Instument" = "Healthcare Cost and Utilization Project data",
"PSI OB Trauma Instrument" = "Healthcare Cost and Utilization Project data",
"PSI Postop Sepsis" = "Healthcare Cost and Utilization Project data",
"PSI Pneumothorax" = "Healthcare Cost and Utilization Project data",
"PSI Low Mort Deaths" = "Healthcare Cost and Utilization Project data")

paste("Source: ",source)
})



})