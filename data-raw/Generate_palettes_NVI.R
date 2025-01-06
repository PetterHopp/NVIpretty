# GENERATE PALETTES BASED ON NVI'S GRAPHICAL PROFILE
# Source: Grafisk profil for Veterinærinstituttet versjon 2020



# GENERATE PALETTE WITH NVI'S PROFILE COLOURS 2024 - today's date ----
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
# palette colours in profile from autumn 2024
palette_graph <- c("Jord" = "#59CD8B", "Luft" = "#D7F4FF", "Vann" = "#1C4FB9",
                   "Svart" = "#091A3E",
                   "Lys jord" = "#BCEED1", "Mørk luft" = "#95D9F3", "Lyst vann" = "#C7D9FF",
                   "Mat" = "#FF5447", "Lys mat" = "#FFDAD4",
                   "Gul" = "#F5D34A", "Lys gul" = "#FBECB2", "Lilla" = "#9A55D2", "Lys lilla" = "#DEC2F5",
                   "Orange" = "#FCA446", "Lys orange" = "#F9D3A9")

# Save palette
usethis::use_data(name = palette_graph, overwrite = TRUE, internal = FALSE)

# palettes with colour gradients
# Luft
palette_gradient_lightblue <- c("Luft" = "#D7F4FF", "#99E2FF", "#5CD1FF", "#1FC0FF", "#00A2E0", "#0076A3")
usethis::use_data(name = palette_gradient_lightblue, overwrite = TRUE, internal = FALSE)
palette_gradient_air <- palette_gradient_lightblue
usethis::use_data(name = palette_gradient_air, overwrite = TRUE, internal = FALSE)
palette_gradient_luft <- palette_gradient_lightblue
usethis::use_data(name = palette_gradient_luft, overwrite = TRUE, internal = FALSE)

# Vann
palette_gradient_darkblue <- c("#D3DFF8", "#9EB8F0", "#6892E8", "#336BE0", "Vann" = "#1C4FB9", "#143985")
usethis::use_data(name = palette_gradient_darkblue, overwrite = TRUE, internal = FALSE)
palette_gradient_water <- palette_gradient_darkblue
usethis::use_data(name = palette_gradient_water, overwrite = TRUE, internal = FALSE)
palette_gradient_vann <- palette_gradient_darkblue
usethis::use_data(name = palette_gradient_vann, overwrite = TRUE, internal = FALSE)

# Jord
palette_gradient_green <- c("#C0ECD3", "#8DDDAF", "Jord" = "#59CD8B", "#36B46C", "#288550", "#1A5634")
usethis::use_data(name = palette_gradient_green, overwrite = TRUE, internal = FALSE)
palette_gradient_earth <- palette_gradient_green
usethis::use_data(name = palette_gradient_earth, overwrite = TRUE, internal = FALSE)
palette_gradient_jord <- palette_gradient_green
usethis::use_data(name = palette_gradient_jord, overwrite = TRUE, internal = FALSE)

# Mat
palette_gradient_red <- c("#FFC6C2", "#FF8D85", "Mat" = "#FF5447", "#FF1B0A", "#CC0E00", "#8F0A00")
usethis::use_data(name = palette_gradient_red, overwrite = TRUE, internal = FALSE)
palette_gradient_food <- palette_gradient_red
usethis::use_data(name = palette_gradient_food, overwrite = TRUE, internal = FALSE)
palette_gradient_mat <- palette_gradient_red
usethis::use_data(name = palette_gradient_mat, overwrite = TRUE, internal = FALSE)

# Gul
palette_gradient_yellow <- c("#FCF0C0", "#F8E286", "Gul" = "#F5D34A", "#F2C512", "#BD990A", "#836A07")
usethis::use_data(name = palette_gradient_yellow, overwrite = TRUE, internal = FALSE)
palette_gradient_gul <- palette_gradient_yellow
usethis::use_data(name = palette_gradient_gul, overwrite = TRUE, internal = FALSE)

# Grey
palette_gradient_grey <- c("#DCDFE5", "#B9BFCB", "#969FB1", "#737F97", "#576175", "Svart" = "#091A3E")
usethis::use_data(name = palette_gradient_grey, overwrite = TRUE, internal = FALSE)
palette_gradient_graa <- palette_gradient_grey
usethis::use_data(name = palette_gradient_graa, overwrite = TRUE, internal = FALSE)


# GENERATE PALETTE WITH NVI'S PROFILE COLOURS 2020 - 2024 ----
# see page 11
# The hex codes are used to generate the palette. The cmyk codes are not in agreement with the hex codes.
palette_NVI_old <- c("blue" = "#00a6eb", "green" = "#00a14a", "red" = "#de2212",
                         "bodytext" = "#68676c", "headingblue" = "#004e9a",
                         "background" = "#133e4d")

# Save palette
usethis::use_data(name = palette_NVI_old, overwrite = TRUE, internal = FALSE)

# Old palette for 2020-2024
# see page 51
# The hex codes are used to generate the palette. The cmyk codes are not in agreement with the hex codes.
# black 70% (cmyk) is chosen for bodytext
palette_graph_old <- c("#6fb2d3", "#579e65", "#c4796d", "#aeafb2", "#5c92bf",
                        "#dac266", "#df94be", "#a8ba6c", "#d28e32", "#5a6b9a",
                        "#886b9a", "#98a762", "#cd692c")

# Save palette
usethis::use_data(name = palette_graph_old, overwrite = TRUE, internal = FALSE)

