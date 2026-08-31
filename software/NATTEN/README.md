<!--
   Copyright 2026, Center for High Throughput Computing, University of Wisconsin - Madison

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

# NATTEN

Container definition files for the NATTEN program.

Program overview: [https://natten.org/](https://natten.org/)

> NATTEN is an open-source project dedicated to providing infrastructure for multi-dimensional sparse attention methods, specifically Neighborhood Attention (NA), a sliding window self-attention mechanism, and its extensions (dilated NA, causal NA, strided NA)

Requires PyTorch, CUDA Toolkit, and cmake to install.

Adapted from [https://natten.org/install/#build-natten-libnatten](https://natten.org/install/#build-natten-libnatten) (accessed 2026-04-28).

## Notes

Two environment variables are used to control the compilation of the `libnatten` library during the container build.

* `NATTEN_CUDA_ARCH` - semi-colon delineated list of NVIDIA GPU architectures by their [hardware compute capability](https://en.wikipedia.org/wiki/CUDA#GPUs_supported).
* `NATTEN_N_WORKERS` - number of threads to use; best to set to the number of CPU cores requested for the build job.

You should request RAM in a ratio of 5GB for every 1 CPU core. 

> [!CAUTION]
> This build took an hour using 4 CPUs and 20GB of RAM.

## [natten.def](natten.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **nvcr.io/nvidia/pytorch:26.03-py3** | *NVIDIA NGC Catalog* |
| *Updated* | April 29, 2026 | *Andrew Owen* |
| *Last tested on HTC* | April 29, 2026 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Ubuntu | |
| *Base image* | **nvcr.io/nvidia/pytorch:26.03-py3** | *NVIDIA NGC Catalog* |
| *Updated* | April 29, 2026 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |
