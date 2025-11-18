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

# [conda-pytorch](/software/Conda/conda-pytorch)

Example definition file for installing PyTorch using conda.
This recipe is especially useful for 

* installing older versions of PyTorch, which may not have official containers on DockerHub
* installing PyTorch in combination with other conda packages

## Choosing a CUDA Version

* Our recipes use CUDA 12.9, since they are compatible with most of our GPU machines.
* You may consider using CUDA 13 instead. However, note that they will not be backwards compatible with older machines. We recommend using `gpus_minimum_capability = 8.0` in your HTCondor submit files when using jobs with containers with CUDA 13.


## [conda-pytorch.def](conda-pytorch.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu 24.04.02 LTS | |
| *Base image* | **condaforge/miniforge3:25.3.0-3** | *DockerHub* |
| *Updated* | 2025-11-18 | *Amber Lim* |
| *Last tested on HTC* | 2025-11-18 | *Amber lim, Matthew Feickert* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Dockerfile** | |
| *OS* | Ubuntu 24.04.02 LTS | |
| *Base image* | **condaforge/miniforge3:25.3.0-3** | *DockerHub* |
| *Updated* | 2025-11-18 | *Amber Lim, Matthew Feickert* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |