# [Packages with Tidyverse](/software/R/tidyverse)

Container definition files for using the R tidyverse environment 
or adding packages to the tidyverse. 

If you are planning to use R with geospatial
packages, you should look at our recipes for [R-geospatial](../geospatial) 
containers. 

## [tidyverse.def](tidyverse.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/tidyverse:4.1.3** | *DockerHub* |
| *Updated* | June 19, 2023 | *Christina Koch* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |

### Build Notes

If you *only* want to use tidyverse packages, comment out 
the `%post` and `install2.r` lines and then build the container. 

When building, change `tidymodels` and `lolcow`
to whatever packages you want to install. 

See the [rocker/tidyverse tags 
page](https://hub.docker.com/r/rocker/tidyverse/tags) 
to see which versions of R are available
and adjust the `From:` line of the definition file accordingly.  
