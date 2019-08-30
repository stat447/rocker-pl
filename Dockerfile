# Image used for PrairieLearn external grading of R questions
# as well as general support of STAT 430 Data Science Programming Methods

# Alton Barbehenn and Dirk Eddelbuettel, 2019

# Before we based our image on prairielearn/centos7-python, 
# and that worked, but it was harder to maintian and a lot 
# than we needed. Now we're using rocker/tidyverse as our
# base because it's more focused and solves the prerequisites
# for us, along with providing many useful R packages. 

FROM rocker/r-ubuntu:18.04

# From prairielearn/centos7-python
# Needed to properly handle UTF-8
ENV PYTHONIOENCODING=UTF-8

# Install required libraries -- using prebuild binaries where available
RUN apt-get update && apt-get install -y \
      r-cran-data.table \
      r-cran-devtools \
      r-cran-doparallel \
      r-cran-dygraphs \
      r-cran-foreach \
      r-cran-fs \
      r-cran-future.apply \
      r-cran-igraph \
      r-cran-memoise \
      r-cran-microbenchmark \
      r-cran-rcpparmadillo \
      r-cran-rex \
      r-cran-runit \
      r-cran-shiny \
      r-cran-stringdist \
      r-cran-testthat \
      r-cran-tidyverse \
      r-cran-tinytest \
      r-cran-xts \
      sudo

# Install additional R packages from CRAN (on top of the ones pre-built as r-cran-*)
RUN install.r bench diffobj flexdashboard lintr unix

# Install ttdo -- for now (?) from GH
RUN installGithub.r eddelbuettel/ttdo

RUN useradd ag
