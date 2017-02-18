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

openedu_final <- c("exercises/v02_q01.Rmd", "exercises/v02_q02.Rmd", "exercises/v02_q03.Rmd")
# openedu_final <- c("exercises/swisscapital2.Rmd",  "exercises/v02_q01.Rmd")

all_rmd <- list.files("exercises/")

openedu_final <- str_subset(all_rmd, pattern = "^v02")
openedu_final <- paste0("exercises/", openedu_final)

dir.create("moodle_out")
output_dir <- "moodle_out/"
exams2moodle(openedu_final, n = 1, dir = output_dir, encoding = "UTF-8")
# n - number of copies



dir.create("pdf_out")
dir.create("pdf_out_temp")
dir.create("pdf_out_supp")


exams2pdf(openedu_final, encoding = "UTF-8", template = "templates/solution.tex",
          verbose = TRUE, dir = "pdf_out", tdir = "pdf_out_temp", sdir = "pdf_out_supp")



# exams2html(openedu_final, encoding = "UTF-8", template = "templates/plain.tex")

# exams2nops(openedu_final,
#           language = "ru", encoding = "UTF-8")

# produces md from Rmd
# xweave(openedu_final, encoding = "UTF-8", engine = "knitr")





