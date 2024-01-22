# [base-R](/software/R/base-R)

Container definition files for building R packages in a base R 
environment. 

Note that if you are planning to use R with the tidyverse or geospatial
packages, you should look at our recipes for [R-geospatial](../geospatial) 
or [R-tidyverse](../tidyverse) containers. 

## [base-r.def](base-R.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/r-ver:4.1.3** | *DockerHub* |
| *Updated* | June 19, 2023 | *Christina Koch* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |

### Build Notes

When building, change `here` and `lolcow`
to whatever packages you want to install. 

See the [rocker/r-ver tags 
page](https://hub.docker.com/r/rocker/r-ver/tags) 
to see which versions of R are available
and adjust the `From:` line of the definition file accordingly.  