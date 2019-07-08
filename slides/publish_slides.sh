Rscript -e 'rmarkdown::render("module1_slides_understanding_data.Rmd")'
Rscript -e 'rmarkdown::render("module2_slides_distribution_variable.Rmd")'

#copy over stuff, but don't overwrite
cp -R -n -p images ~/Professional/blog/stat_slides/
cp -R -n -p libs ~/Professional/blog/stat_slides/
cp -R -n -p lecture_slides.css ~/Professional/blog/stat_slides/

#now copy actual slides
cp module1_slides_understanding_data.html ~/Professional/blog/stat_slides/
cp -R module1_slides_understanding_data_files ~/Professional/blog/stat_slides/

cp module2_slides_distribution_variable.html ~/Professional/blog/stat_slides/
cp -R module2_slides_distribution_variable_files ~/Professional/blog/stat_slides/
