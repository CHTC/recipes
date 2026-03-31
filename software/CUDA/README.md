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

# CUDA

Container definition files for using NVIDIA CUDA libraries in a container.

Our recipes are based off of [NVIDIA's CUDA containers](https://hub.docker.com/r/nvidia/cuda), which come prepackaged with the CUDA runtime libraries. These images do **not** include Python by default, so our recipes install Python and pip before installing any Python packages.

If you need PyTorch with CUDA preinstalled, see our [PyTorch recipes](../PyTorch/).

If you do not need to add any other packages, you can directly use NVIDIA's CUDA containers in your jobs by adding the following line:

```
container_image = docker://nvidia/cuda:12.6.3-runtime-ubuntu22.04
```

## Choosing an image variant

NVIDIA publishes CUDA images in three variants. Choose the one that fits your workload:

| Variant | Description |
| ------- | ----------- |
| `base`  | CUDA runtime only (`libcudart`). Smallest image. |
| `runtime` | Adds cuBLAS, cuDNN, and NCCL. Good for running pre-built GPU code. |
| `devel` | Adds headers, static libraries, and the `nvcc` compiler. Required for compiling CUDA C/C++ code. |

See the [nvidia/cuda DockerHub page](https://hub.docker.com/r/nvidia/cuda/tags) for a full list of available tags and operating system choices.

## Installing packages

CUDA base images can be quite gnarly in size (upwards of 5-10 GB for the `devel` variants). **If you are installing additional packages using Apptainer on CHTC, request 25 GB or more of disk space in your submit file for your build. The build process is disk-heavy!**

```
request_disk = 25 GB
```

To install Python packages, add/modify the `python3 -m pip install` command in the provided files.

> We encourage you to use the `python3 -m pip install` command instead of `pip install`,
> as this will ensure that you are always installing the packages into the version of Python that you are using.

If installing multiple packages, it is generally best to place all packages within the same
`python3 -m pip install` command in case they share dependencies. For example,

```
python3 -m pip install package1 package2 package3
```

To specify specific package versions, you can use the built-in `pip` syntax `packagename==version`.
For example,

```
python3 -m pip install package1==1.0 package2==3.2.1 package3
```

## [cuda.def](cuda.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu 22.04 LTS | |
| *Base image* | **nvidia/cuda:12.6.3-runtime-ubuntu22.04** | *DockerHub* |
| *Updated* | 2026-03-31 | *Daniel Morales* |
| *Last tested on HTC* | 2026-03-31 | *Daniel Morales* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Ubuntu 22.04 LTS | |
| *Base image* | **nvidia/cuda:12.6.3-runtime-ubuntu22.04** | *DockerHub* |
| *Updated* | 2026-03-31 | *Daniel Morales* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |
