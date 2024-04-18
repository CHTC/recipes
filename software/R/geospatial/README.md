# [R-Geospatial](/software/R/geospatial)

Container definition files for building `R` packages in a geospatial `R` 
environment. 

Note that if you are planning to use R with the tidyverse (without 
geospatial packages), you should look at our recipes 
for [R-tidyverse](../tidyverse) containers. 
(`rocker/geospatial` includes tidyverse packages by default.)

## [geospatial.def](geospatial.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/geospatial:4.1.3** | *DockerHub* |
| *Updated* | 2024-04-18 | *Andrew Owen* |
| *Last tested on HTC* | 2024-03-06 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

When building, change `cowsay` and `swirl`
to whatever packages you want to install. 

See the [rocker/r-ver tags page](https://hub.docker.com/r/rocker/geospatial/tags) 
to see which versions of R are available
and adjust the `From:` line of the definition file accordingly.  

