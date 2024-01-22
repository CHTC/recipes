# R

Container definition files for using the `R` programming langauge, grouped 
by specialty.

- [Adding packages to base R](base-r)
- [Using tidyverse with additional packages](tidyverse)
- [Using R geospatial packages](geospatial)

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
    R -e "install.packages('cowsay', dependencies=TRUE, repos='http://cran.rstudio.com/')"
```

installs the `cowsay` package. 
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
