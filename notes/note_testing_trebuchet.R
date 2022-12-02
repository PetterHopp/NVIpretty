library(NVIbatch)
use_pkg("extrafont")

.onLoad <- function(libname, pkgname){
  font_families <- extrafont::fonts()
  if (! "Trebuchet" %in% font_families)  {
    font_import(prompt = FALSE, pattern = "trebuc*" )
  }

  #Denne trenger bare å kjøres en gang, eller når du må importere nye fonts

  extrafont::loadfonts(device = "all",
                       quiet = TRUE) #kan også brukes uten device-spesifikasjon
}


theme_set(theme_minimal(base_size = 12, base_family = "Trebuchet"))

test <-list.files("C:/Windows/Fonts", pattern="\\.ttf") # shows arial.ttf 'trebuchet'

Scanning ttf files in C:\windows\Fonts ...
Extracting .afm files from .ttf files...
C:\Windows\Fonts\trebuc.ttf : No FontName. Skipping.
C:\Windows\Fonts\trebucbd.ttf : No FontName. Skipping.
C:\Windows\Fonts\trebucbi.ttf : No FontName. Skipping.
C:\Windows\Fonts\trebucit.ttf : No FontName. Skipping.
Found FontName for 0 fonts.
Scanning afm files in C:/Program Files/R/R-4.0.2/library/extrafontdb/metrics
Warning messages:
1: In system2(ttf2pt1, c(args, shQuote(ttfiles[i]), shQuote(tmpfiles[i])),  :
running command '"C:/Program Files/R/R-4.0.2/library/Rttf2pt1/exec/ttf2pt1.exe" -a -G fAe "C:\Windows\Fonts\trebuc.ttf" "C:\Users\13hopp\AppData\Local\Temp\Rtmpc38n45/fonts/trebuc"' had status 5
2: In system2(ttf2pt1, c(args, shQuote(ttfiles[i]), shQuote(tmpfiles[i])),  :
running command '"C:/Program Files/R/R-4.0.2/library/Rttf2pt1/exec/ttf2pt1.exe" -a -G fAe "C:\Windows\Fonts\trebucbd.ttf" "C:\Users\13hopp\AppData\Local\Temp\Rtmpc38n45/fonts/trebucbd"' had status 5
3: In system2(ttf2pt1, c(args, shQuote(ttfiles[i]), shQuote(tmpfiles[i])),  :
running command '"C:/Program Files/R/R-4.0.2/library/Rttf2pt1/exec/ttf2pt1.exe" -a -G fAe "C:\Windows\Fonts\trebucbi.ttf" "C:\Users\13hopp\AppData\Local\Temp\Rtmpc38n45/fonts/trebucbi"' had status 5
4: In system2(ttf2pt1, c(args, shQuote(ttfiles[i]), shQuote(tmpfiles[i])),  :
running command '"C:/Program Files/R/R-4.0.2/library/Rttf2pt1/exec/ttf2pt1.exe" -a -G fAe "C:\Windows\Fonts\trebucit.ttf" "C:\Users\13hopp\AppData\Local\Temp\Rtmpc38n45/fonts/trebucit"' had status 5
                                                          >
