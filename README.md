## rocker-pl

This is a Docker image intended to be paired with PrairieLearn to externally grade R-based problems
for use in the [STAT 430](https://stat430.com) (2018-2021) and [STAT 447](https://stat430.com))
courses on _Data Science Programming Methods_ at the University of Illinois at Urbana-Champiagn
(UIUC). In the previous course iteration, a CentOS7-based container was used via Python. We now
drive R directly from PrairieLearn evaluating code in this container. However, the container is
however perfectly generic and can be used for general R work as well.

It is based on the [Rocker](https://rocker-project.org) container `r-ubuntu` in order to take
advantage of the prebuilt Ubuntu binaries.

### R Packages Installed

See the Dockerfile for full details but we include

- tidyverse and data.table for data manipulation;
- RUnit, testthat and tinytest for testing;
- microbenchmark, rbenchmark and bench for timing;
- shiny, flexdashboard, dygraphs for shiny;

and more. We also include a few command-line applications such as `git` and `sqlite3`.

### Authors

Alton Barbehenn and Dirk Eddelbuettel

### License

GPL (>= 2)
