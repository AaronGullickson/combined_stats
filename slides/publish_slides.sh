Rscript -e 'rmarkdown::render("module1_slides_understanding_data.Rmd")'
Rscript -e 'rmarkdown::render("module2_slides_distribution_variable.Rmd")'
Rscript -e 'rmarkdown::render("module3_slides_measuring_association.Rmd")'
Rscript -e 'rmarkdown::render("module4_slides_statistical_inference.Rmd")'
Rscript -e 'rmarkdown::render("module5_slides_building_models.Rmd")'



#copy over stuff, but don't overwrite
cp -R -n -p images ~/Professional/blog/stat_slides/
cp -R -n -p libs ~/Professional/blog/stat_slides/
cp -R -n -p lecture_slides.css ~/Professional/blog/stat_slides/

#now copy actual slides
cp module1_slides_understanding_data.html ~/Professional/blog/stat_slides/
cp -R module1_slides_understanding_data_files ~/Professional/blog/stat_slides/

cp module2_slides_distribution_variable.html ~/Professional/blog/stat_slides/
cp -R module2_slides_distribution_variable_files ~/Professional/blog/stat_slides/

cp module3_slides_measuring_association.html ~/Professional/blog/stat_slides/
cp -R module3_slides_measuring_association_files ~/Professional/blog/stat_slides/

cp module4_slides_statistical_inference.html ~/Professional/blog/stat_slides/
cp -R module4_slides_statistical_inference_files ~/Professional/blog/stat_slides/

cp module5_slides_building_models.html ~/Professional/blog/stat_slides/
cp -R module5_slides_building_models_files ~/Professional/blog/stat_slides/

#remove all created files
rm *.html
rm -R module*files

