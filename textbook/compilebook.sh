#!/usr/bin/env Rscript

bookdown::render_book("index.Rmd", bookdown::pdf_book(number_section=FALSE))
bookdown::render_book("index.Rmd", 
                      bookdown::html_chapters(split_by="section+number", number_section=FALSE, toc=FALSE)) 
#bookdown::render_book("index.Rmd", 
#                      bookdown::gitbook(split_by="section+number", number_section=FALSE)) 