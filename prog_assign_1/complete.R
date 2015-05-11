complete <- function(directory, id = 1:332) {
  id <- sprintf("%03d", id)
  file <- paste0(directory, "/", id, ".csv")
  
  do.call(rbind, lapply(file, function(x) {
    pol_data <- read.csv(x)
    data.frame(id = unique(pol_data$ID), nobs = nrow(pol_data[complete.cases(pol_data), ]))
  }))
}