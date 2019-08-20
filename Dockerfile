# Image used for PrairieLearn external grading of R questions.

# Alton Barbehenn, 2019

# Before we based our image on prairielearn/centos7-python, 
# and that worked, but it was harder to maintian and a lot 
# than we needed. Now we're using rocker/tidyverse as our
# base because it's more focused and solves the prerequisites
# for us, along with providing many useful R packages. 

FROM rocker/r-apt:bionic

# From prairielearn/centos7-python
# Needed to properly handle UTF-8
ENV PYTHONIOENCODING=UTF-8

# Install required libraries
RUN apt-get update && \
	apt-get install -y libcurl4-openssl-dev \
		libssl-dev \
		libxml2-dev
	
# Install desired R packages (on top of the ones preloaded)
RUN install.r data.table \
		tinytest

RUN useradd ag
