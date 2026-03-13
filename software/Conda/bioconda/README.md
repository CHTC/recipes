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

# [bioconda](/software/Conda/bioconda)

Container definition files installing packages using Conda and the Bioconda channel.

If you only need Python and packages installed via `pip`, see our [Python recipes](/software/Python). 

## Build Notes

Before building, be sure to modify the `conda install` line to specify whatever packages you want to install!

## [bioconda.def](bioconda.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **condaforge/miniforge3:latest** | *DockerHub* |
| *Updated* | 2026-03-11 | *Andrew Owen* |
| *Last tested on HTC* | 2026-03-11 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **condaforge/miniforge3:latest** | *DockerHub* |
| *Updated* | 2026-03-11 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |
