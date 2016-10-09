all: eda regression report

report: report/report.Rmd data/regression.RData data/correlation-matrix.RData images/residual-plot.png function 
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"

eda: code/scripts/eda-script.R data/Advertising.csv
	Rscript code/scripts/eda-script.R

regression: code/scripts/regression-script.R data/Advertising.csv
	Rscript code/scripts/regression-script.R

data:
	data/curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests: code/test-that.R code/tests/test-regression.R
	Rscript code/test-that.R code/tests/test-regression.R

sessionInfo: session-info.txt
	Rscript session-info.txt

function: code/functions/regression-functions.R
	Rscript code/functions/regression-functions.R

clean:
	rm -f report/report.pdf report/report.html
