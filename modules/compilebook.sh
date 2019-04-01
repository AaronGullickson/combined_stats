#!/bin/bash

### Compile PDF of book 
if [ -f stat_book.pdf ]; then
    rm stat_book.pdf
fi
#Rscript -e 'bookdown::render_book("index.Rmd", bookdown::pdf_book(number_section=FALSE), output_dir=".")'

### Compile GitBook on blog

# remove existing stat_book
rm -r ~/Professional/blog/stat_book
#create new stat_book
Rscript -e 'bookdown::render_book("index.Rmd", bookdown::gitbook(split_by="section+number", number_section=FALSE), output_dir="~/Professional/blog/stat_book")'

#a little cleanup
rm -r _bookdown_files