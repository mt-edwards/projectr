all: communicate

import:
	Rscript -e 'knitr::knit("notebooks/1_import/01_Import.Rmd", output = "notebooks/1_import/import.R", tangle = TRUE)'
	Rscript notebooks/1_import/import.R

tidy: import
	Rscript -e 'knitr::knit("notebooks/2_tidy/02_Tidy.Rmd", output = "notebooks/2_tidy/tidy.R", tangle = TRUE)'
	Rscript notebooks/2_tidy/tidy.R

explore: tidy
	Rscript -e 'knitr::knit("notebooks/3_explore/03_Explore.Rmd", output = "notebooks/3_explore/explore.R", tangle = TRUE)'
	Rscript notebooks/3_explore/explore.R

model: tidy
	Rscript -e 'knitr::knit("notebooks/4_model/04_Model.Rmd", output = "notebooks/4_model/model.R", tangle = TRUE)'
	Rscript notebooks/4_model/model.R
	
communicate:
	 echo "Communicating"
	
clean:
	rm data/*.feather
	rm notebooks/*/*.html
