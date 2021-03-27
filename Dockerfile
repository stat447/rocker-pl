# Image used for PrairieLearn external grading of R questions
# as well as general support of STAT 430 Data Science Programming Methods

# Alton Barbehenn and Dirk Eddelbuettel, 2019-2020

# Before we based our image on prairielearn/centos7-python, 
# and that worked, but it was harder to maintian and a lot 
# than we needed. Now we're using rocker/tidyverse as our
# base because it's more focused and solves the prerequisites
# for us, along with providing many useful R packages. 

FROM rocker/r-ubuntu:20.04

# Needed to properly handle UTF-8
ENV PYTHONIOENCODING=UTF-8

# Install required libraries -- using prebuild binaries where available
RUN apt-get update && apt-get install -y \
        curl \
	git \
	r-cran-data.table \
	r-cran-devtools \
        r-cran-diffobj \
	r-cran-doparallel \
	r-cran-dygraphs \
	r-cran-foreach \
	r-cran-fs \
	r-cran-future.apply \
	r-cran-gh \
	r-cran-git2r \
	r-cran-igraph \
	r-cran-memoise \
	r-cran-png \
	r-cran-rcpparmadillo \
	r-cran-rex \
	r-cran-rsqlite \
	r-cran-runit \
	r-cran-shiny \
	r-cran-stringdist \
	r-cran-testthat \
	r-cran-tidyverse \
	r-cran-tinytest \
	r-cran-xts \
	sqlite3 \
        sudo \
        && echo "options(diffobj.brightness=\"dark\")" >> /etc/R/Rprofile.site

# Install additional R packages from CRAN (on top of the ones pre-built as r-cran-*)
RUN install.r bench flexdashboard microbenchmark lintr ttdo unix

# Install plr -- for now (?) from GH; also install visualTest
RUN installGithub.r stat430dspm/plr MangoTheCat/visualTest

RUN useradd ag \ 
	&& mkdir /home/ag \
	&& chown ag:ag /home/ag \
	&& echo "[user]" > /home/ag/.gitconfig \
	&& echo "	name = Autograding User" >> /home/ag/.gitconfig \
	&& echo "	email = ag@nowhere" >> /home/ag/.gitconfig \
	&& chown ag:ag /home/ag/.gitconfig
