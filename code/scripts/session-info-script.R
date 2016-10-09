
library(xtable)


sink(file = session-info.txt)

cat(sessionInfo())

sink()