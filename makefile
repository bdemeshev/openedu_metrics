# will make all archives for open edu econometrics
# week_01.zip contains everything for week_01
# lab_05.zip contains only lab_05 (R files + datasets)

all: archives/week_01.zip archives/lab_10.zip

archives/week_01.zip: week_01/week_01_ols_addon.pdf week_01/week_01_ols.pdf
	zip archives/week_01.zip week_01/week_01_ols_addon.pdf week_01/week_01_ols.pdf



archives/lab_10.zip: week_15/lab_10/lab_10_before.R week_15/lab_10/lab_10_after.R datasets/flats_moscow.txt datasets/flats_moscow_description.txt
	zip archives/lab_10.zip week_15/lab_10/lab_10_before.R week_15/lab_10/lab_10_after.R datasets/flats_moscow.txt datasets/flats_moscow_description.txt
