<!--
   Copyright 2024, Center for High Throughput Computing, University of Wisconsin - Madison

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->

# R

Container definition files for using the `R` programming langauge, grouped 
by specialty.

- [Adding packages to base R](base-r)
- [Using tidyverse with additional packages](tidyverse)
- [Using R geospatial packages](geospatial)
- [Using `renv` to replicate environment](renv)

These containers are based on the [Rocker](https://rocker-project.org/) pre-built containers. 
For more information about Rocker and the containers they provide, 
see [here](https://rocker-project.org/images/).

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

## How to install packages

There are two ways that you can pass the `R` commands in the container build file.
You may encounter either approach in the container recipe files here.

### 1. Single line command

You can pass a command directly to R for execution with the syntax

```
    R -e "command to execute"
```

For example,

```
    R -e "install.packages(c('cowsay','fortunes'), dependencies=TRUE, repos='http://cran.rstudio.com/')"
```

installs the `cowsay` and `fortunes` packages. 
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

(and similarly for Dockerfiles).

The lines between `cat << EOF` and `EOF` will be written to `install.R`, 
which will then be executed using `Rscript`.

> Note that the second `EOF` must not have any characters before or after it on the same line!

## Using a different base operating system

The base operating system for the Rocker containers is Debian Linux. 
If you want to use a different operating system, you can install R using Conda. 
See our [Conda recipes](/software/Conda) and follow the instructions 
[here](https://docs.anaconda.com/free/working-with-conda/packages/using-r-language/).
