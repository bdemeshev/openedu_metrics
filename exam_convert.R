library("exams")
library("tidyverse")

devtools::install_github("bdemeshev/exams")

mydir <- "~/Documents/openedu_metrics/moodle3"
setwd(mydir)

exams_skeleton(dir = mydir, encoding = "UTF-8", markup = "markdown")

?exams.skeleton

# латеховские формулы в $...$ и в $$..$$
# для картинок обязательно выставить fig.path = ""

set.seed(1090)



openedu_final_v01 <- c("exercises/swisscapital2.Rmd", "exercises/boxhist.Rmd")
openedu_final_v01 <- c("exercises/swisscapital2.Rmd",  "exercises/v02_q01.Rmd")

exams2pdf(openedu_final_v01, encoding = "UTF-8", template = "templates/plain.tex",
          verbose = TRUE, dir = "pdf_out", tdir = "pdf_out_temp", sdir = "pdf_out_supp")
exams2html(openedu_final_v01, encoding = "UTF-8", template = "plain8")

exams2nops(openedu_final_v01,
           language = "ru", encoding = "UTF-8")

# produces md from Rmd
xweave(openedu_final_v01, encoding = "UTF-8", engine = "knitr")

?xweave
?exams2pdf
?exams2nops

output_dir <- "moodle_out/"

pdfwrite <- make_exams_write_pdf()
a <- xexams(openedu_final_v01, driver = list(write = pdfwrite))

exams2moodle(openedu_final_v01, n = 1, dir = output_dir, encoding = "UTF-8")
# n - number of copies

.libPaths()


