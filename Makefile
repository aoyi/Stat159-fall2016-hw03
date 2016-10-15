# Run "make" to reproduce report

.PHONY: all report eda regression data tests sessionInfo clean

# Set variables
eda_script = code/scripts/eda-script.R
regression_script = code/scripts/regression-script.R

# All target
all: sessionInfo data eda regression report

# Report target: Produce reports by compiling Rmarkdown to pdf 
report: report/report.Rmd regression eda 
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"

# Eda target: Run eda script to calculate summary statistics
eda: data $(eda_script)
	Rscript $(eda_script)

# Regression target: Run regression script to perform linear regression and generate related plots
regression: $(regression_script) data
	Rscript $(regression_script)

# Data target: Download data from the url
data:
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

# Tests target: Run tests
tests: code/test-that.R code/tests/test-regression.R
	Rscript code/test-that.R 

# SessionInfo target: Run sessioninfo script
sessionInfo: code/scripts/session-info-script.R
	Rscript $<

# Clean target: Delete report.pdf
clean:
	rm -f report/report.pdf
