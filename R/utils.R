#### UTILITY FUNCTIONS ----
# The utility functions are functions reused within the package to avoid rewriting of code. They are not intended for use in the R-scripts,
# and are therefore not exported to Namespace.
#


### set_name_vector ----
#' @title set_name_vector
#' @description Ensures that all elements in a vector are named.
#' @details Used to name all elements in vectors with column names that should be added to data frames
#'     Thereby it can easily be differentiated between standard column names (vector elements) and
#'     wanted column names in the generated tables (names). The user can input a named vector to the function.
#'     This is considered easier for the user to understand than inputting two vectors.
#'
#'     This function is used in different add-functions before calling add_new_variable
#'
#' @param colname_vector A unnamed, partly named or fully named vector of character variables input in add-functions

#' @return A named vector where previously unnamed elements have been named with the element value as name.
#'
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#'
#' @examples
#' \dontrun{
#' new_columns <- c("name11" = "column1", "name2" = "column2", "column3")
#'   new_columns <- set_name_vector(new_columns)
#' }
#' @noRd

# Function that ensure that all elements in a vector are named
# For elements that aren't named, the vector value are used as name
set_name_vector <- function(colname_vector) {
  # Existing names to the vector name
  name <- names(colname_vector)

  # vector values to unnamed vector
  column <- unname(colname_vector)

  # Check if any elements are named
  if (!is.null(name)) {
    # if some elements are named, move element value to unnamed elements
    for (i in 1:length(name)) {
      if (name[i] == "") {name[i] <- column[i]}
    }

    # if no elements are named, set element values as names
  } else {name <- column }

  return(stats::setNames(colname_vector, name))
}
