source.f <-  function( 
 # Modifies source function to display R results in console
  Rfile.f,  # any .R file
  echo.status.f=T,  # TRUE shows R code in console 
  max.deparse.length.f=10000 # Characters to display before truncate
  # Executes provided R file and returns R results in console
){
  source(Rfile.f, echo=echo.status.f, max.deparse.length=max.deparse.length.f)
}