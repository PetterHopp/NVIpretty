
formatExcelsheet <- function (data, workbook, sheet, wrapHeadlineText = FALSE) {
  addWorksheet(wb = workbook, sheetName = sheet)
  writeData(wb = workbook, sheet = sheet, data, withFilter = TRUE)
  freezePane(wb = workbook, sheet = sheet, firstRow = TRUE)
  styleBold <- createStyle(textDecoration = "bold", wrapText = wrapHeadlineText)
  addStyle(wb = workbook, sheet = sheet, style = styleBold, rows = 1, cols = 1:dim(data)[2] )
}


makeHeader <- function(data) {
  header <- colnames(data)
  header <- snakecase::to_any_case(header, case="sentence", abbreviations = c("ID"))
  header <- gsub("id","ID",header)
  header <- gsub("Id","ID",header)
  header <- gsub("Aar","År",header)
  header <- gsub("avist","åvist",header)
  header <- gsub("rsokt","rsøkt",header)
  header <- gsub("Prov","Prøv",header)
  colnames(data) <- header
  return(data)
}

makeHeader2 <- function(data) {
  header <- colnames(data)
  header <- snakecase::to_any_case(header, case="sentence", abbreviations = c("ID"))
  header <- gsub("id","ID",header)
  header <- gsub("Id","ID",header)
  header <- gsub("Aar","År",header)
  header <- gsub("avist","åvist",header)
  header <- gsub("rsokt","rsøkt",header)
  header <- gsub("Prov","Prøv",header)
  return(header)
}

mExportDataUI <- function(id, 
                         text=list(Filetype="Filtype", Download="Last ned"),
                         Choices=setNames(c("xlsx","csv"), c("Excel (xlsx)","Tekst (csv)")),
                         Selected = NULL
                         ) { 
  ns <- NS(id)
  
  tagList(
    selectInput(inputId = ns("exportFiltype"), 
                label = text$Filetype,
                choices = Choices,
                # choices = c("Excel (xlsx)"="xlsx",
                #             "Tekst (csv)"="csv"),
                selected = Selected
                ),
    
    downloadButton(ns("data2download"), label = text$Download)
  )
}

x <- list(Data=iris)
class(x)

mExportData <- function(input, output, session, 
                        data2export, 
                        colDef=NULL,
                       Filename=NULL, 
                       Sheetname=NULL) {

  ns <- session$ns
  
  # Makes header 
  # The intention is to make a readable header
  # snakecase - sentence is used as standard
  # Modification of single or all columns can be given as input in colDef$DisplayText
  Header <- reactive({
    # Use colnames as starting point
    # if (class(data2export)=="list") {header <- colnames(data2export()$Data)}
    # if (class(data2export)=="data.frame") {header <- colnames(data2export)}
    header <- colnames(data2export())
    # Change column names to snakecase - sentence
    header <- snakecase::to_any_case(header, case="sentence", abbreviations = c("ID"))
    
    # Modifies the header in accord with information given in colDef$DisplayText
    if (!is.null(colDef$DisplayText)) {
      # If the input is written with =-signs, make a translation table for the selected variables
      # For the remaining columnnames, the original names transformed using snakecase are collected from header$V1
      if(length(grep("=",colDef$DisplayText))>0) {
        # Transform vector with translation information to a translation table in a dataframe 
        translationTable <- unlist(strsplit(grep("=", colDef$DisplayText, value = TRUE),"=", fixed = TRUE))
        translationTable <- stats::setNames(as.data.frame(matrix(translationTable, ncol = 2, byrow = TRUE), stringsAsFactors = FALSE),c("V1","V2"))
        # Transform header to dataframe and join with translation table
        header <- plyr::join(setNames(as.data.frame(header, stringsAsFactors = FALSE), c("V1")),translationTable, by = "V1", type = "left")
        # Use standard translation for all remaining variables
        header[which(is.na(header$V2)),"V2"] <- header[which(is.na(header$V2)),"V1"]
        # Transform header to vector with the header names
        header <- header$V2
        
        
        # If the input is written without =-signs, the vector is assumed to be used as header as is 
      } else {
        # if the number of elements are correct, use the vector as header
        # If the vector contains NA, the standard names are used (snakecase - sentence)
        if (length(colDef$DisplayText)==length(header)) {
          header <- snakecase::to_any_case(header, case="sentence", abbreviations = c("ID"))
          header[which(!is.na(colDef$DisplayText))] <- colDef$DisplayText[which(!is.na(colDef$DisplayText))]
        } else {
          # In this case the standard names are used (snakecase - sentence)
          warning("Setting new column names failed. The vector with new column names were too short or too long.")
        }
      }
    }
    header
  })
  
  output$data2download <- downloadHandler(filename = function () {
    paste0(Filename(),".",input$exportFiltype)
  },
  content = function(file) {
    if (input$exportFiltype=="csv") {
      write.csv2(data2export(), file, row.names = FALSE)
    }
    if (input$exportFiltype=="xlsx") {
      options("openxlsx.dateFormat" = "dd/mm/yyyy")
      wb <- createWorkbook()
      # data2excel <- makeHeader(data2export())
      # formatExcelsheet(data2excel2(), wb, Sheetname)
      formatExcelsheet(setNames(data2export(),Header()), wb, Sheetname())
      saveWorkbook(wb, file = file)
    }
  },
  contentType = input$exportFiltype)

}


