# Rocker-pl

This is a docker image intended to be paired with PrairieLearn to externally grade R based problems. In previous iterations, a CentOS7 and Python3.6 approach was used to directly extend the existing examples. This docker image is being developed for use in University of Illinois at Urbana-Champiagn's (UIUC) STAT 480 course. 

I'm using the rocker/tidyverse image as a base because it should have all of the required libraries (like libxml2 and libcurl) set up to enable all the packages we want for the course. 


## R Packages Installed

- tidyverse
- data.table
- tidytest
