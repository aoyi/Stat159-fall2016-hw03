
data_set <- read.csv("data/Advertising.csv")
data_output_file <- "data/eda-output.txt"

output_stats <- function(data, name, file) {
  data_min <- min(data)
  data_max <- max(data)
  data_median <- median(data)
  data_avg <- mean(data)
  data_sd <- sd(data)
  cat("Summary Statistics for", name, "\n\n", file = file, append = TRUE)
  cat(sprintf("Minimum: %0.2f", data_min), "\n", file = file, append = TRUE)
  cat(sprintf("Maximum: %0.2f", data_max), "\n", file = file, append = TRUE)
  cat(sprintf("Median : %0.2f", data_median), "\n", file = file, append = TRUE)
  cat(sprintf("Mean   : %0.2f", data_avg), "\n", file = file, append = TRUE)
  cat(sprintf("Std Dev: %0.2f", data_sd), "\n\n", file = file, append = TRUE)
}

cor_matrix <- cor(data_set[2:5], data_set[2:5])
save(cor_matrix, file = "data/correlation-matrix.RData")

sink(file = data_output_file)
output_stats(data_set$TV, "TV", data_output_file)
output_stats(data_set$Radio, "Radio", data_output_file)
output_stats(data_set$Newspaper, "Newspaper", data_output_file)
output_stats(data_set$Sales, "Sales", data_output_file)

write.table(cor_matrix, file ="data/eda-output.txt", append = TRUE, sep = " ")

sink()

histogram_generator <- function (data, var_name) {
  file_path <- paste("images/histogram-",var_name,".png", sep = "")
  png(file_path)
  hist(data, main = paste("Histogram of", var_name, "Advertising"), xlab = paste(var_name, "Advertising"), col = "pink")
  dev.off()
}

histogram_generator(data_set$TV, "TV")
histogram_generator(data_set$Newspaper, "Newspaper")
histogram_generator(data_set$Radio, "Radio")
histogram_generator(data_set$Sales, "Sales")

scatterplot_generator <- function (data1, data2, var_name1, var_name2) {
    file_path <- paste("images/scatterplot-", var_name1, "-", var_name2, ".png", sep = "")
    png(file_path)
    plot(data1, data2, main = paste("Scatterplot of", var_name1, "Advertising and", var_name2), 
                       xlab = paste(var_name1, "Advertising"), 
                       ylab = var_name2, 
                       col = "blue")
    dev.off()
  }

scatterplot_generator(data_set$TV, data_set$Sales, "TV", "Sales")
scatterplot_generator(data_set$Newspaper, data_set$Sales, "Newspaper", "Sales")
scatterplot_generator(data_set$Radio, data_set$Sales, "Radio", "Sales")


