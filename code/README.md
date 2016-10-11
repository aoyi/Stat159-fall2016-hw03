# Code README

This directory contains three folders and one file.

`functions` folder contains `regression-functions.R` which contains the functions to calculate RSS, TSS, RSE, R-Square and F-Statistics. 

`scripts` folder contains 3 scripts:

`eda-script.R` contains code to perform basic data analysis, including calculate basic statistics for each variable, compute the correlation matrix and generating historgrams.

`regression-script.R` is used to generate linear and multiple regression objects and generate related regression graphs. 

`session-info-script.R` is used to generate `session-info.txt` which includes the info about the version of R, platform, operating system and used R packages. 

`tests` folder contains the tests we write to test functions included in `regression-functions.R` using `testthat` package. 