corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  pol_data <- lapply(files, read.csv)
  pol_data <- lapply(pol_data, function(x) x[complete.cases(x), ])
  pol_data <- pol_data[lapply(pol_data, nrow) > threshold]
  
  vapply(pol_data, function(x) cor(x[, c("sulfate", "nitrate")])[2], numeric(1))
}