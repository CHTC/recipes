# R

Container definition files for using the `R` programming langauge, grouped 
by specialty.

- [Adding packages to base R](base-r)
- [Using tidyverse with additional packages](tidyverse)
- [Using R geospatial packages](geospatial)

These containers are based on the [Rocker](https://rocker-project.org/) pre-built containers. 
For more information about Rocker and the containers they provide, 
see [here](https://rocker-project.org/images/).

## How to install packages

There are two ways that you can pass the `R` commands in the `%post` section
of the definition file.
You may encounter either approach in the container recipe files here.

### 1. Single line command

You can pass a command directly to R for execution with the syntax

```
    R -e "command to execute"
```

For example,

```
    R -e "install.packages(c('cowsay','swirl'), dependencies=TRUE, repos='http://cran.rstudio.com/')"
```

installs the `cowsay` and `swirl` packages. 
This approach is useful for simple commands, but does not handle nested quotations well.

### 2. Create an install script

You can create a short install script written in `R` that you can execute
using `Rscript`.
This uses a special syntax:

```
    cat << EOF > install.R
command1
command2
..
command3
EOF

    Rscript install.R
```

The lines between `cat << EOF` and `EOF` will be written to `install.R`, which you
can then execute using `Rscript`.

> Note that the second `EOF` must be at the beginning of the line.

## Choosing the version of R

These recipes are based on the Rocker container images on DockerHub: https://hub.docker.com/u/rocker.
Generally, you can change the "tag" in the `From` line to specify the version of R that you want to use.
For example,

```
# Apptainer .def file
From: rocker/r-ver:4.1
# Dockerfile
FROM rocker/r-ver:4.1
```

will build the container using the `r-ver` container with R version 4.1.

## Using a different base operating system

The base operating system for the Rocker containers is Debian Linux. 
If you want to use a different operating system, you can install R using Conda. 
See our [Conda recipes](/software/Conda) and follow the instructions [here](https://docs.anaconda.com/free/working-with-conda/packages/using-r-language/).