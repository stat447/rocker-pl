## rocker-pl

This is a Docker image intended to be paired with PrairieLearn to externally grade R-based problems
for use in the [STAT 430 course Data Science Programming Methods](https://stat430.com) at the
University of Illinois at Urbana-Champiagn (UIUC). In the previous iteration, a CentOS7-based
container was used with Python3.6 was used to directly extend the existing examples. We now drive R
directly from PrairieLearn evaluating code in this container.  The container is however perfectly
generic and can be used for general R work as well.

It is based on the [Rocker](https://rocker-project.org) container `r-ubuntu` in order to take
advantage of the prebuilt Ubuntu binaries.

## R Packages Installed

See the Dockerfile for full details but we include

- tidyverse and data.table for data manipulation;
- RUnit, testthat and tinytest for testing;
- microbenchmark, rbenchmark and bench for timing;
- shiny, flexdashboard, dygraphs for shiny;

and more.

## Authors

Alton Barbehenn and Dirk Eddelbuettel

## License

GPL (>= 2)
