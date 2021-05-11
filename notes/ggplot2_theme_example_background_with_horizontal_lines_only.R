library(openxlsx)
library(ggplot2)
library(NVIdb)

# library(pixiedust)

# Kataloger og filnavn
domene <- "//vetinst.no/dfs-felles/StasjonK/FAG/OKprogrammer/OKstatistikkApp/"

OKaar <- 2020
# Leser inn antall undersøkte og positive
prevalens <- read.xlsx(xlsxFile = paste0(set_dir_NVI("OKprogrammer"), "Rutine", OKaar, "/Rapportering/Antall undersøkte og positive scrapesjuke 2002_dd.xlsx"))

prevalens$examined <- prevalens$sampled - prevalens$unfit -prevalens$pending
prevalens[, c("estimate", "ci025", "ci250", "ci750", "ci975")] <- NA

for (i in 1:dim(prevalens)[1]) {
  resultat <- binom.test(prevalens[i, "Nor98"], prevalens[i, "examined"])
  prevalens[i, "y50"] <- resultat$estimate
  prevalens[i, "y0"] <- resultat$conf.int[1]
  prevalens[i, "y100"] <- resultat$conf.int[2]
  resultat <- binom.test(prevalens[i, "Nor98"], prevalens[i, "examined"], conf.level = 0.50)
  prevalens[i, "y25"] <- resultat$conf.int[1]
  prevalens[i, "y75"] <- resultat$conf.int[2]

}

slaktet <- subset(prevalens, prevalens$hensikt == "slaktet")
slaktet$aar <- as.character(slaktet$aar)

ggplot(slaktet, aes(x = aar)) +
  geom_boxplot(
    fill = "#5c92bf",
    aes(ymin = y0, lower = y25, middle = y50, upper = y75, ymax = y100, width = 0.4),
    stat = "identity"
  ) +
  scale_x_discrete(name = "Year",
                   breaks = c("2002", "2004", "2006", "2008", "2010","2012", "2014", "2016", "2018", "2020")
  ) +
  scale_y_continuous(breaks = c(0, 0.001, 0.002, 0.003, 0.004, 0.005),
                     # labels = percent,
                     labels = c("0 %", "0.1 %", "0.2 %", "0.3 %", "0.4 %", "0.5 %"),
                     limits = c(0, 0.005)
  ) +
  # To be used for theme
  # Font size should be relative and not hardcoded as here
  # Colour of text and horizontal support lines should be updated when Kommunikasjon has given input
  # Width of horizontal support lines should be discussed (relative or absolute)
  theme(axis.text = element_text(size = 12, colour = "black")
  ) +
  theme(axis.title = element_text(size = 15)
  ) +
  #
  theme(axis.ticks = element_blank()
  ) +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(color = "gray60", size = 0.2),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()
  )

