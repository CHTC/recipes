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

# OpenMPI

Container definition files for OpenMPI. Typically used as a base recipe for additional software that requires OpenMPI.

> [!WARNING]
> This definition file is intended for software stacks requiring OpenMPI on CHTC's High Throughput Computing system. For multi-node containers on the High Performance Computing system, see [multi-node containers](https://github.com/CHTC/recipes/tree/main/workflows-hpc/multi-node-container).

## How to install packages

To install additional system packages (i.e., `gfortran`), add the packages to the `apt-get install -y` lines.

To install packages from source, download the source code (typically `wget`, `curl`, or `git clone`) and follow installation instructions. Be sure to install prerequisite packages first.

## [openmpi-5.0.10.def](openmpi-5.0.10.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu 24.04 | |
| *Base image* | **ubuntu:24.04** | *DockerHub* |
| *Updated* | 2026-06-02 | *Amber Lim* |
| *Last tested on HTC* | 2026-06-02 | *Amber lim* |
| *Last tested on HPC* | - | - |

## Additional resources

- [Apptainer and MPI applications](https://apptainer.org/docs/user/main/mpi.html)