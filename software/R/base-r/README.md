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

# [base-R](/software/R/base-R)

Container definition files for building R packages in a base R 
environment. 

Note that if you are planning to use R with the tidyverse or geospatial
packages, you should look at our recipes for [R-geospatial](../geospatial) 
or [R-tidyverse](../tidyverse) containers. 

## Build Notes

When building, change `cowsay` and `fortunes`
to whatever packages you want to install. 

See the [rocker/r-ver tags 
page](https://hub.docker.com/r/rocker/r-ver/tags) 
to see which versions of R are available
and adjust the `From` line of the recipe file accordingly.  

## [base-r.def](base-R.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/r-ver:4.1.3** | *DockerHub* |
| *Updated* | 2024-04-18 | *Andrew Owen* |
| *Last tested on HTC* | 2024-04-18 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Ubuntu | |
| *Base image* | **rocker/r-ver:4.1.3** | *DockerHub* |
| *Updated* | 2024-11-15 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |
