# GENERATE PALETTES BASED ON NVI'S GRAPHICAL PROFILE
# Source: Grafisk profil for Veterinærinstituttet versjon 2024

# GENERATE PALETTE WITH NVI'S PROFILE COLOURS ----
# palette_NVI <- c("Jord" = "#59CD8B", "Luft" = "#D7F4FF", "Vann" = "#1C4FB9",
#                  "Hvit" = "#F7FDFF", "Svart" = "#091A3E",
#                  "Lys_jord" = "#BCEED1", "Mørk_luft" = "#95D9F3", "Lyst_vann" = "#C7D9FF",
#                  "Mat" = "#FF5447", "Lys_mat" = "#FFDAD4")
palette_NVI <- c("#59CD8B", "#D7F4FF", "#1C4FB9",
                 "#F7FDFF", "#091A3E",
                 "#BCEED1", "#95D9F3", "#C7D9FF",
                 "#FF5447", "#FFDAD4")

# Save palette
usethis::use_data(name = palette_NVI, overwrite = TRUE, internal = FALSE)

# GENERATE PALETTE FOR GRAPHS ----
# palette colours in profile from autumn 2024
# Uses version without named colours as else problem for ggplot2
# palette_graph <- c("Jord" = "#59CD8B", "Luft" = "#D7F4FF", "Vann" = "#1C4FB9",
#                    "Svart" = "#091A3E",
#                    "Lys jord" = "#BCEED1", "Mørk luft" = "#95D9F3", "Lyst vann" = "#C7D9FF",
#                    "Mat" = "#FF5447", "Lys mat" = "#FFDAD4",
#                    "Gul" = "#F5D34A", "Lys gul" = "#FBECB2", "Lilla" = "#9A55D2", "Lys lilla" = "#DEC2F5",
#                    "Orange" = "#FCA446", "Lys orange" = "#F9D3A9")
palette_graph <- c("#59CD8B", "#D7F4FF", "#1C4FB9",
                   "#091A3E",
                   "#BCEED1", "#95D9F3", "#C7D9FF",
                   "#FF5447", "#FFDAD4",
                   "#F5D34A", "#FBECB2", "#9A55D2", "#DEC2F5",
                   "#FCA446", "#F9D3A9")
# Save palette
usethis::use_data(name = palette_graph, overwrite = TRUE, internal = FALSE)

# GENERATE PALETTES WITH COLOUR GRADIENTS
# Luft
palette_gradient_lightblue <- c("#D7F4FF", "#99E2FF", "#5CD1FF", "#1FC0FF", "#00A2E0", "#0076A3")
usethis::use_data(name = palette_gradient_lightblue, overwrite = TRUE, internal = FALSE)
palette_gradient_air <- palette_gradient_lightblue
usethis::use_data(name = palette_gradient_air, overwrite = TRUE, internal = FALSE)
palette_gradient_luft <- palette_gradient_lightblue
usethis::use_data(name = palette_gradient_luft, overwrite = TRUE, internal = FALSE)

# Vann
palette_gradient_darkblue <- c("#D3DFF8", "#9EB8F0", "#6892E8", "#336BE0", "#1C4FB9", "#143985")
usethis::use_data(name = palette_gradient_darkblue, overwrite = TRUE, internal = FALSE)
palette_gradient_water <- palette_gradient_darkblue
usethis::use_data(name = palette_gradient_water, overwrite = TRUE, internal = FALSE)
palette_gradient_vann <- palette_gradient_darkblue
usethis::use_data(name = palette_gradient_vann, overwrite = TRUE, internal = FALSE)

# Jord
palette_gradient_green <- c("#C0ECD3", "#8DDDAF", "#59CD8B", "#36B46C", "#288550", "#1A5634")
usethis::use_data(name = palette_gradient_green, overwrite = TRUE, internal = FALSE)
palette_gradient_earth <- palette_gradient_green
usethis::use_data(name = palette_gradient_earth, overwrite = TRUE, internal = FALSE)
palette_gradient_jord <- palette_gradient_green
usethis::use_data(name = palette_gradient_jord, overwrite = TRUE, internal = FALSE)

# Mat
palette_gradient_red <- c("#FFC6C2", "#FF8D85", "#FF5447", "#FF1B0A", "#CC0E00", "#8F0A00")
usethis::use_data(name = palette_gradient_red, overwrite = TRUE, internal = FALSE)
palette_gradient_food <- palette_gradient_red
usethis::use_data(name = palette_gradient_food, overwrite = TRUE, internal = FALSE)
palette_gradient_mat <- palette_gradient_red
usethis::use_data(name = palette_gradient_mat, overwrite = TRUE, internal = FALSE)

# Gul
palette_gradient_yellow <- c("#FCF0C0", "#F8E286", "#F5D34A", "#F2C512", "#BD990A", "#836A07")
usethis::use_data(name = palette_gradient_yellow, overwrite = TRUE, internal = FALSE)
palette_gradient_gul <- palette_gradient_yellow
usethis::use_data(name = palette_gradient_gul, overwrite = TRUE, internal = FALSE)

# Grey
palette_gradient_grey <- c("#DCDFE5", "#B9BFCB", "#969FB1", "#737F97", "#576175", "#091A3E")
usethis::use_data(name = palette_gradient_grey, overwrite = TRUE, internal = FALSE)
palette_gradient_graa <- palette_gradient_grey
usethis::use_data(name = palette_gradient_graa, overwrite = TRUE, internal = FALSE)

# # GENERATE PALETTES FOR TABLES
# # Blue
# palette_table_blue <- c("header_fill" = "#95D9F3",
#                         "line1_fill" = "#F7FDFF",
#                         "line2_fill" = "#D7F4FF",
#                         "text" = "#091A3E", "headertext" = "#091A3E", "bodytext" = "#091A3E")
# usethis::use_data(name = palette_table_blue, overwrite = TRUE, internal = FALSE)
