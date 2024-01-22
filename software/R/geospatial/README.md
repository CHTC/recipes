# [R-Geospatial](/software/R/geospatial)

Container definition files for building R packages in a base R 
environment. 

Note that if you are planning to use R with the tidyverse (without 
geospatial packages), you should look at our recipes 
for [R-tidyverse](../tidyverse) containers. 

## [geospatial.def](geospatial.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/geospatial:4.1.3** | *DockerHub* |
| *Updated* | June 19, 2023 | *Christina Koch* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |

### Build Notes

When building, change `tidymodels` and `lolcow`
to whatever packages you want to install. 

See the [rocker/r-ver tags 
page](https://hub.docker.com/r/rocker/geospatial/tags) 
to see which versions of R are available
and adjust the `From:` line of the definition file accordingly.  

If using geospatial packages *and* tidyverse, see the 
`tidy-geo.def` definition file. 
