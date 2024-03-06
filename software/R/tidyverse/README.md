# [Packages with Tidyverse](/software/R/tidyverse)

Container definition files for using the `R` tidyverse environment 
or adding packages to the tidyverse. 

If you are planning to use `R` with geospatial
packages, you should look at our recipes for [R-geospatial](../geospatial) 
containers. 

## [tidyverse.def](tidyverse.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/tidyverse:4.1.3** | *DockerHub* |
| *Updated* | 2024-01-22 | *Andrew Owen* |
| *Last tested on HTC* | 2024-03-06 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

If you *only* want to use tidyverse packages, comment out 
the `%post` and `R -e` lines and then build the container. 

When building, change `cowsay` and `fortunes`
to whatever packages you want to install. 

See the [rocker/tidyverse tags page](https://hub.docker.com/r/rocker/tidyverse/tags) 
to see which versions of `R` are available
and adjust the `From:` line of the definition file accordingly.  
