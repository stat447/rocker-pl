# Image used for PrairieLearn external grading of R questions
# as well as general support of STAT 430 Data Science Programming
# Methods (during 2019-2020) and STAT 447 (since 2021)

# Alton Barbehenn and Dirk Eddelbuettel, 2019-2022

# Before we based our image on prairielearn/centos7-python, 
# and that worked, but it was harder to maintian and a lot 
# than we needed. Now we're using rocker/tidyverse as our
# base because it's more focused and solves the prerequisites
# for us, along with providing many useful R packages. 

FROM eddelbuettel/r2u:22.04

# Needed to properly handle UTF-8
ENV PYTHONIOENCODING=UTF-8

# Install required packahes
RUN echo "192.168.1.114 dirk.eddelbuettel.com" >> /etc/hosts \
    && apt-get update \
    && apt-get install -y \
        curl \
	git \
        pandoc \
        pandoc-citeproc \
        r-cran-bench \
        r-cran-data.table \
        r-cran-devtools \
        r-cran-diffobj \
        r-cran-doparallel \
        r-cran-dygraphs \
        r-cran-flexdashboard \
        r-cran-foreach \
        r-cran-fs \
        r-cran-future.apply \
	r-cran-gapminder \
        r-cran-gh \
        r-cran-git2r \
        r-cran-igraph \
	r-cran-lahman \
        r-cran-lintr \
        r-cran-memoise \
        r-cran-microbenchmark \
	r-cran-nycflights13 \
	r-cran-palmerpenguins \
        r-cran-png \
	r-cran-profmem \
        r-cran-rcpparmadillo \
        r-cran-rex \
        r-cran-rsqlite \
        r-cran-runit \
        r-cran-shiny \
	r-cran-stringdist \
        r-cran-testthat \
        r-cran-tidyverse \
        r-cran-tinytest \
        r-cran-ttdo \
        r-cran-unix \
        r-cran-xts \
	sqlite3 \
        sudo \
        && echo "options(diffobj.brightness=\"dark\")" >> /etc/R/Rprofile.site

# Install plr -- for now (?) from GH; also install visualTest
RUN installGithub.r stat447/plr MangoTheCat/visualTest

RUN useradd ag \ 
	&& mkdir /home/ag \
	&& chown ag:ag /home/ag \
	&& echo "[user]" > /home/ag/.gitconfig \
	&& echo "	name = Autograding User" >> /home/ag/.gitconfig \
	&& echo "	email = ag@nowhere" >> /home/ag/.gitconfig \
	&& chown ag:ag /home/ag/.gitconfig
