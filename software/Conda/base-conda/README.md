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

# [base-conda](/software/Conda/base-conda)

Container definition files installing packages using Conda.

If you only need Python and packages installed via `pip`, see our [Python recipes](/software/Python). 

## Build Notes

When building, replace `python=3.10` with whatever conda packages you want on the `conda install` line. 

## [base-conda.def](base-conda.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-04-15 | *Andrew Owen* |
| *Last tested on HTC* | 2024-04-15 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-10 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |