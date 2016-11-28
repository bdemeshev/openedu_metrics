# library("exams")
# devtools::install_github("bdemeshev/exams")

library("exams")
library("tidyverse")
library("stringr")


mydir <- "~/Documents/openedu_metrics/moodle_exam"
setwd(mydir)

# exams_skeleton(dir = mydir, encoding = "UTF-8", markup = "markdown")

# латеховские формулы в $...$ и в $$..$$
# для картинок обязательно выставить fig.path = ""

set.seed(42)

# openedu_final_v01 <- c("exercises/swisscapital2.Rmd", "exercises/boxhist.Rmd")
# openedu_final_v01 <- c("exercises/swisscapital2.Rmd",  "exercises/v02_q01.Rmd")

all_rmd <- list.files("exercises/")

openedu_final_v01 <- str_subset(all_rmd, pattern = "^v01")
openedu_final_v01 <- paste0("exercises/", openedu_final_v01)

dir.create("moodle_out")
output_dir <- "moodle_out/"
exams2moodle(openedu_final_v01, n = 1, dir = output_dir, encoding = "UTF-8")
# n - number of copies



dir.create("pdf_out")
dir.create("pdf_out_temp")
dir.create("pdf_out_supp")


exams2pdf(openedu_final_v01, encoding = "UTF-8", template = "templates/plain.tex",
          verbose = TRUE, dir = "pdf_out", tdir = "pdf_out_temp", sdir = "pdf_out_supp")
exams2html(openedu_final_v01, encoding = "UTF-8", template = "templates/plain.tex")

exams2nops(openedu_final_v01,
           language = "ru", encoding = "UTF-8")

# produces md from Rmd
xweave(openedu_final_v01, encoding = "UTF-8", engine = "knitr")





