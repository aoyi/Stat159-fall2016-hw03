
data_set <- read.csv("data/Advertising.csv")
data_output_file <- "data/eda-output.txt"

multi_reg <- lm(Sales ~ TV + Radio + Newspaper, data = data_set)
lm_sales_TV <- lm(Sales ~ TV, data = data_set)
lm_sales_Radio <- lm(Sales ~ Radio, data = data_set)
lm_sales_Newspaper <- lm(Sales ~ Newspaper, data = data_set)
save(multi_reg, lm_sales_Newspaper, lm_sales_Radio, lm_sales_TV, file = "data/regression.RData")
summary(multi_reg)

png("images/residual-plot.png")
plot(multi_reg, which = 1)
dev.off()

png("images/normal-qq-plot.png")
plot(multi_reg, which = 2)
dev.off()

png("images/scale-location-plot.png")
plot(multi_reg, which = 3)
dev.off()

scatterplot_generator <- function (data1, data2, var_name1, var_name2) {
  file_path <- paste("images/scatterplot-", var_name1, "-", var_name2, ".png", sep = "")
  png(file_path)
  plot(data1, data2, main = paste("Scatterplot of", var_name1, "Advertising and", var_name2), 
       xlab = paste(var_name1, "Advertising"), 
       ylab = var_name2, 
       pch = 19,
       col = "blue")
  reg_obj <- lm(data2 ~ data1)
  abline(reg_obj, col = "red", lwd = 2)
  dev.off()
}

scatterplot_generator(data_set$TV, data_set$Sales, "TV", "Sales")
scatterplot_generator(data_set$Newspaper, data_set$Sales, "Newspaper", "Sales")
scatterplot_generator(data_set$Radio, data_set$Sales, "Radio", "Sales")

