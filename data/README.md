# Data README

This data folder contains four files. Advertising.csv is our original data set on which the linear model is applied. The data file can be downloaded at http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv, credited to Gareth James, Deniela Witten, Trevor Hastie and Robert Tibshirani.

Eda-output is the file that contains all the summary statistics of TV, newspaper, radio, sales and the correlation matrix. It is saved via sink() by running the `code/scripts/eda-script.R` file. 

regression.RData includes the regression objects we obtained by running the linear and multiple regression model in binary format. This file is produced via save() from the `code/scripts/regression-script.R` file. 

correlation-matrix.RData includes the correlation matrix between all variables in binary format. It is produced via save() from the `code/scripts/eda-script.R` file. 