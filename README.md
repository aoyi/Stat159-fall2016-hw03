# UC Berkeley Statistics 159 Fall 2016 Homework 3

## Introduction

In this homework, our objective is to reproduce the multiple regression analysis introduced in Chapter 3, Linear Regression, from the book "An Introduction to Statistical Learning" by Gareth James, Deniela Witten, Trevor Hastie and Robert Tibshirani. To replicate the result, we mainly apply computational toolkit in r such as lm and summary function and combine them with key elements for reproducible work such as makefile and git. The requirement for this project can be found at https://github.com/ucb-stat159/stat159-fall-2016/blob/master/hws/hw03/stat159-hw03-multiple-regression.pdf. 

## Structure

The structure of this project is listed as following:

```
stat159-fall2016-hw03/
    .gitignore
    README.md
    LICENSE
    Makefile
    session-info.txt
    code/
        README.md
        test-that.R
        functions/
            regression-functions.R
        scripts/
            eda-script.R
            regression-script.R
            session-info-script.R
    data/
    	README.md
    	Advertising.csv
    	eda-output.txt
        correlation-matrix.RData
    	regression.RData
    images/
        histogram-sales.png
        histogram-tv.png
        histogram-radio.png
        histogram-newspaper.png
        scatterplot-matrix.png
        scatterplot-tv-sales.png
        scatterplot-radio-sales.png
        scatterplot-newspaper-sales.png
        residual-plot.png
        scale-location-plot.png
        normal-qq-plot.png
    report/
    	report.Rmd
    	report.pdf
```

## Reproduction Steps

To reproduce the report:

1. Clone this project

2. Run `make` in the terminal to regenerate all the output files, graphs and report. 

3. Run `make tests` to test functions included in code/functions/regression_functions.R

## Contributor

Aoyi Shan

UC Berkeley Class of 2017

Statistics, B.A. | Business Administration, B.S.

Email: aoyi95@berkeley.edu

## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/)
