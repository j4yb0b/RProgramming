pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  id <- sprintf("%03d", id)
  file <- paste0(directory, "/", id, ".csv")
  pol_data <- do.call(rbind, lapply(file, read.csv))
  
  round(mean(pol_data[, pollutant], na.rm = TRUE), 3)
}