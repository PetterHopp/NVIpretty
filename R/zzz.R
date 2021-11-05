# # library(NVIbatch)
# # remotes::install_version("Rttf2pt1", version = "1.3.8")
# # use_pkg("extrafont")
#
# # For DESCRIPTION
# # Imports:
# #   Rttf2pt1 (>= 0.8.5),
# # Rttf2pt1 (<= 1.3.8),
# # extrafont
#
#
# # fOR ZZZ
# .onLoad <- function(libname, pkgname){
#   font_families <- extrafont::fonts()
#   if (!"Trebuchet MS" %in% font_families)  {
#     extrafont::font_import(prompt = FALSE, pattern = "trebuc*" )
#   }
#
#   #Denne trenger bare å kjøres en gang, eller når du må importere nye fonts
#
#   extrafont::loadfonts(device = "win",
#                        quiet = TRUE) #kan også brukes uten device-spesifikasjon
# }
#
# # fOR ggplot
# theme_set(theme_minimal(base_size = 12, base_family = "Trebuchet"))
#
#
# # For testing code
# test_onload
#
# font_families <- extrafont::fonts()
# expect_true("Trebuchet" %in% font_families)
#
# wf <- windowsFonts()
# names(wf[wf=="Trebuchet MS"])
# [1] "Trebuchet MS"
#
#
# # For finding .ttf-files
# test <-list.files("C:/Windows/Fonts", pattern="\\.ttf") # shows arial.ttf 'trebuchet'
#
#
# # remove.packages(pkgs = c("extrafont", "extrafontdb", "Rttf2pt1"))
