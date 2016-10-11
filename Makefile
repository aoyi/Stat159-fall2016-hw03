# Run "make" to reproduce report

.PHONY: data all clean

OUTPUT_PDF = report.pdf
OUTPUT_HTML = report.html

all: clean sessionInfo data eda regression report

report: report/report.Rmd regression eda function 
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"

eda: data code/scripts/eda-script.R
	Rscript code/scripts/eda-script.R

regression: code/scripts/regression-script.R data
	Rscript code/scripts/regression-script.R

data:
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests: code/test-that.R code/tests/test-regression.R
	Rscript code/test-that.R 

sessionInfo: code/scripts/session-info-script.R
	Rscript code/scripts/session-info-script.R

function: code/functions/regression-functions.R
	Rscript code/functions/regression-functions.R

clean:
	rm -f report/$(OUTPUT_PDF) report/$(OUTPUT_HTML)
