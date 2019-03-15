#!/usr/bin/env Rscript

### Compile PDF of book 
bookdown::render_book("index.Rmd", bookdown::pdf_book(number_section=FALSE),
                      output_dir=".")

### Compile GitBook on blog

# remove existing stat_book
rm -r ~/Professional/blog/stat_book
#create new stat_book
bookdown::render_book("index.Rmd", 
                      bookdown::gitbook(split_by="section+number", number_section=FALSE),
                      output_dir="~/Professional/blog/stat_book")
                      
rm -r _bookdown_files