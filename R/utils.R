#### UTILITY FUNCTIONS ----
# The utility functions are functions reused within the package to avoid
# rewriting of code. They are not intended for use in the R-scripts,
# and are therefore not exported to NAMESPACE.
#


### set_name_vector ----
#' @title Ensures that all elements in a vector are named
#' @description Keeps names for named elements in a vector and gives names to
#'     unnamed elements in a vector.
#' @details Used to name all elements in vectors with column names that should
#'     be added to data frames. Thereby it can easily be differentiated between
#'     standard column names (vector elements) and wanted column names in the
#'     generated tables (names). The user can input a named vector to the
#'     function. This is considered easier for the user to understand than
#'     inputting two vectors.
#'
#'     This function is used in different add-functions before calling
#'     add_new_variable.
#'
#' @param x [\code{character}]\cr
#'     A vector of character variables.

#' @return A named vector where previously unnamed elements have been named with
#'     the element value as name.
#'
#' @author Petter Hopp Petter.Hopp@@vetinst.no
#' @keywords internal
#' @examples
#' new_columns <- c("name11" = "column1", "name2" = "column2", "column3")
#' new_columns <- set_name_vector(new_columns)
#'
set_name_vector <- function(x) {
  new_names <- x
  new_names[which(names(x) != "")] <- names(x[which(names(x) != "")])
  x <- stats::setNames(x, new_names)
  return(x)
}

# set_name_vector <- function(colname_vector) {
#   # Existing names to the vector name
#   name <- names(colname_vector)
#
#   # vector values to unnamed vector
#   column <- unname(colname_vector)
#
#   # Check if any elements are named
#   if (!is.null(name)) {
#     # if some elements are named, move element value to unnamed elements
#     for (i in 1:length(name)) {
#       if (name[i] == "") {name[i] <- column[i]}
#     }
#
#     # if no elements are named, set element values as names
#   } else {name <- column }
#
#   return(stats::setNames(colname_vector, name))
# }
