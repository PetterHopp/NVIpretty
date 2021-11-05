library(NVIbatch)
remotes::install_version("Rttf2pt1", version = "1.3.8")
use_pkg("extrafont")

library(remotes)
library(extrafont)
loadfonts(device = "win")
fonts()

.onLoad <- function(libname, pkgname){
  font_families <- extrafont::fonts()
  if (!"Trebuchet MS" %in% font_families)  {
    extrafont::font_import(prompt = FALSE, pattern = "trebuc*" )
  }

  #Denne trenger bare å kjøres en gang, eller når du må importere nye fonts

  extrafont::loadfonts(device = "win",
                       quiet = TRUE) #kan også brukes uten device-spesifikasjon
}


theme_set(theme_minimal(base_size = 12, base_family = "Trebuchet"))

test <-list.files("C:/Windows/Fonts", pattern="\\.ttf") # shows arial.ttf 'trebuchet'


# remove.packages(pkgs = c("extrafont", "extrafontdb", "Rttf2pt1"))
