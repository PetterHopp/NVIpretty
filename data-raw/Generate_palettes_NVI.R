# GENERATE PALETTES BASED ON NVI'S GRAPHICAL PROFILE
# Source: Grafisk profil for Veterinærinstituttet versjon 2020



# GENERATE PALETTE WITH NVI'S PROFILE COLOURS ----
# see page 11
# The hex codes are used to generate the palette. The cmyk codes are not in agreement with the hex codes.
palette_NVI_profile <- c("blue" = "#00a6eb", "green" = "#00a14a", "red" = "#de2212",
                         "bodytext" = "#68676c", "headingblue" = "#004e9a",
                         "background" = "#133e4d")

# Save palette
usethis::use_data(name = palette_NVI_profile, overwrite = TRUE, internal = FALSE)

palette_NVI <- c("Jord" = "#59CD8B", "Luft" = "#D7F4FF", "Vann" = "#1C4FB9",
                    "Hvit" = "#F7FDFF", "Svart" = "#091A3E",
                    "Lys jord" = "#BCEED1", "Mørk luft" = "#95D9F3", "Lyst vann" = "#C7D9FF",
                    "Mat" = "#FF5447", "Lys mat" = "#FFDAD4")
                    
# Save palette
usethis::use_data(name = palette_NVI, overwrite = TRUE, internal = FALSE)


# GENERATE PALETTE FOR TABLE (GREY) ----
# see page 47
# The cmyk codes are used to generate the palette.
palette_table_grey <- c("black1" = "#191919", "black2" = "#4d4d4d", "black3" = "#808080",
                        "black4" = "#b3b3b3", "black5" = "#e6e6e6",
                        "bodytext" = "#383838", "heading" = "#ffffff")

# Save palette
usethis::use_data(name = palette_table_grey, overwrite = TRUE, internal = FALSE)



# GENERATE PALETTE FOR TABLE (BLUE) ----
# see page 48
# The hex codes are used to generate the palette. The cmyk codes are not in agreement with the hex codes.
# black 70% (cmyk) is chosen for bodytext
palette_table_blue <- c("blue1" = "#4b7c95", "blue2" = "#6a9cb6", "blue3" = "#8eb6cc",
                        "blue4" = "#b3d1e2", "blue5" = "#dae9f1",
                        "bodytext" = "#4d4d4d", "heading" = "#ffffff")

# Save palette
usethis::use_data(name = palette_table_blue, overwrite = TRUE, internal = FALSE)

# GENERATE PALETTE FOR GRAPHS ----
# see page 51
# The hex codes are used to generate the palette. The cmyk codes are not in agreement with the hex codes.
# black 70% (cmyk) is chosen for bodytext
palette_graph <- c("#6fb2d3", "#579e65", "#c4796d", "#aeafb2", "#5c92bf",
                   "#dac266", "#df94be", "#a8ba6c", "#d28e32", "#5a6b9a",
                   "#886b9a", "#98a762", "#cd692c")

# Save palette
usethis::use_data(name = palette_graph, overwrite = TRUE, internal = FALSE)

palette_graph2 <- c("Jord" = "#59CD8B", "Luft" = "#D7F4FF", "Vann" = "#1C4FB9",
             "Svart" = "#091A3E",
             "Lys jord" = "#BCEED1", "Mørk luft" = "#95D9F3", "Lyst vann" = "#C7D9FF",
             "Mat" = "#FF5447", "Lys mat" = "#FFDAD4",
             "Gul" = "#F5D34A", "Lys gul" = "#FBECB2", "Lilla" = "#9A55D2", "Lys lilla" = "#DEC2F5",
             "Orange" = "#FCA446", "Lys orange" = "#F9D3A9")

# Save palette
usethis::use_data(name = palette_graph2, overwrite = TRUE, internal = FALSE)

# palette with saturated colours
palette_graph3 <- c("Jord" = "#27ff84", "Luft" = "#D7F4FF", "Vann" = "#0045d5",
               "Svart" = "#001747",
               "Lys jord" = "#abffce", "Mørk luft" = "#89deff", "Lyst vann" = "#C7D9FF",
               "Mat" = "#FF5447", "Lys mat" = "#FFDAD4",
               "Gul" = "#ffd940", "Lys gul" = "#ffeeae", "Lilla" = "#9f28ff", "Lys lilla" = "#dfb8ff",
               "Orange" = "#ffa443", "Lys orange" = "#ffd3a3")
# Save palette
usethis::use_data(name = palette_graph3, overwrite = TRUE, internal = FALSE)

