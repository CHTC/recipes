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

## Build Notes

Installation command taken from the [PyTorch website](https://pytorch.org/get-started/locally/) using the options "Stable, Linux, Conda, Python, CUDA 12.1".

## [conda-pytorch.def](conda-pytorch.def)

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
| *Type* | **Dockerfile** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-10 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |