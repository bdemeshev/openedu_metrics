# will make all archives for open edu econometrics
# week_01.zip contains everything for week_01
# lab_05.zip contains only lab_05 (R files + datasets)

all: archives/week_01.zip archives/lab_07.zip archives/lab_01.zip archives/lab_10.zip archives/lab_02.zip

archives/week_01.zip: week_01/week_01_ols_addon.pdf week_01/week_01_ols.pdf
	zip archives/week_01.zip week_01/week_01_ols_addon.pdf week_01/week_01_ols.pdf

archives/lab_01.zip: week_03/lab_01/script_01_a_after.R week_03/lab_01/script_01_b_after.R
	zip archives/lab_01.zip week_03/lab_01/script_01_a_after.R week_03/lab_01/script_01_b_after.R

archives/lab_02.zip: week_03/lab_02/lab_02_after.R week_03/lab_02/lab_02_before.R datasets/flats_moscow_description.txt datasets/flats_moscow.txt
	zip archives/lab_02.zip week_03/lab_02/lab_02_after.R week_03/lab_02/lab_02_before.R datasets/flats_moscow_description.txt datasets/flats_moscow.txt

archives/lab_07.zip: week_11/lab_07/lab_07_before.R week_11/lab_07/lab_07_after.R datasets/titanic3.csv
	zip archives/lab_07.zip week_11/lab_07/lab_07_before.R week_11/lab_07/lab_07_after.R datasets/titanic3.csv

archives/lab_10.zip: week_15/lab_10/lab_10_before.R week_15/lab_10/lab_10_after.R datasets/flats_moscow.txt datasets/flats_moscow_description.txt
	zip archives/lab_10.zip week_15/lab_10/lab_10_before.R week_15/lab_10/lab_10_after.R datasets/flats_moscow.txt datasets/flats_moscow_description.txt
