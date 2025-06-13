# Remove NOTE when running CMD check and checking dependencies
# Namespaces in Imports field not imported from:
#   'grid'
# All declared Imports should be used.


ignore_unused_imports <- function() {
  grid::grid.layout # Used in vignette NVI_colour_palettes
}
