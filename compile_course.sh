#!/bin/bash

# This script will compile all of the material from the modules, slides, and 
# resources into the _site directory for web deployment. It will be deployed
# automatically via netlify whenever changes are pushed to GitHub.

### Compile GitBook on blog

# remove existing _site directory and replace
rm -rf _site
mkdir _site

### CREATE NEW BOOK ###

#TODO: for now cd into the modules section, but ultimately I need to use the 
#here package so this works from base directory
cd modules
Rscript -e 'bookdown::render_book("index.Rmd", bookdown::gitbook(split_by="section+number", number_section=FALSE, css="my_styles.css"), output_dir="../_site")'
rm -r _bookdown_files
cd ..

#copy over everything from the resources directory
cp -R -n -p modules/resources/* _site/resources/

### CREATE NEW SLIDES ###

#TODO: It looks like I cant use the output_dir option because of some
#weird thing about where it expects the libraries, but copying over manually
#works fine
mkdir _site/stat_slides
cd slides
Rscript -e 'rmarkdown::render("module1_slides_understanding_data.Rmd")'
Rscript -e 'rmarkdown::render("module2_slides_distribution_variable.Rmd")'
Rscript -e 'rmarkdown::render("module3_slides_measuring_association.Rmd")'
Rscript -e 'rmarkdown::render("module4_slides_statistical_inference.Rmd")'
Rscript -e 'rmarkdown::render("module5_slides_building_models.Rmd")'
Rscript -e 'rmarkdown::render("module6_slides_model_complications.Rmd")'
Rscript -e 'rmarkdown::render("module7_slides_categorical_outcomes.Rmd")'

#copy over resources, but don't overwrite
cp -R -n -p images ../_site/stat_slides/
cp -R -p libs ../_site/stat_slides/
cp -R -n -p lecture_slides.css ../_site/stat_slides/

#now copy actual slides
cp module1_slides_understanding_data.html ../_site/stat_slides/
cp -R module1_slides_understanding_data_files ../_site/stat_slides/

cp module2_slides_distribution_variable.html ../_site/stat_slides/
cp -R module2_slides_distribution_variable_files ../_site/stat_slides/

cp module3_slides_measuring_association.html ../_site/stat_slides/
cp -R module3_slides_measuring_association_files ../_site/stat_slides/

cp module4_slides_statistical_inference.html ../_site/stat_slides/
cp -R module4_slides_statistical_inference_files ../_site/stat_slides/

cp module5_slides_building_models.html ../_site/stat_slides/
cp -R module5_slides_building_models_files ../_site/stat_slides/

cp module6_slides_model_complications.html ../_site/stat_slides/
cp -R module6_slides_model_complications_files ../_site/stat_slides/

cp module7_slides_categorical_outcomes.html ../_site/stat_slides/
cp -R module7_slides_categorical_outcomes_files ../_site/stat_slides/

#remove all created files
rm *.html
rm -R module*files
