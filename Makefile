# Run "make" to reproduce report

.PHONY: data all clean function tests

eda_script = code/scripts/eda-script.R
regression_script = code/scripts/regression-script.R

all: sessionInfo data eda regression report

report: report/report.Rmd regression eda function 
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"

eda: data $(eda_script)
	Rscript $(eda_script)

regression: $(regression_script) data
	Rscript $(regression_script)

data:
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests: code/test-that.R code/tests/test-regression.R
	Rscript code/test-that.R 

sessionInfo: code/scripts/session-info-script.R
	Rscript $<

function: code/functions/regression-functions.R
	Rscript $<

clean:
	rm -f report/report.pdf
