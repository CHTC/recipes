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

# Apptainer-in-Apptainer

This recipe provides the definition file for the "parent" Apptainer container,
which has the ability to launch a "child" Apptainer container inside of it.

# Launching inner container

To run the inner container, you need to use the `--unsquash` argument with your `apptainer` command.
For example,

```
apptainer exec --unsquash my_inner_container.sif inner_script.sh
```

## Bare minimum setup

These images have the bare minimum required in order to use Apptainer inside of Apptainer.

* [minimal-ubuntu.def](minimal-ubuntu.def)
* [minimal-rocky.def](minimal-rocky.def)

## With "nice to have" packages

These images have what is required to use Apptainer inside of Apptainer,
as well as some additional "common" programs that are useful to have.
For a full list of additional packages, see the definition file.

* [nice-ubuntu.def](nice-ubuntu.def)
* [nice-rocky.def](nice-rocky.def)

## [minimal-ubuntu.def](minimal-ubuntu.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu 24.04 (Debian) | |
| *Base image* | **ubuntu:24.04** | *DockerHub* |
| *Updated* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HTC* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [minimal-rocky.def](minimal-rocky.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Rocky 9 (RHEL) | |
| *Base image* | **rockylinux:9** | *DockerHub* |
| *Updated* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HTC* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [nice-ubuntu.def](nice-ubuntu.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu 24.04 (Debian) | |
| *Base image* | **ubuntu:24.04** | *DockerHub* |
| *Updated* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HTC* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [nice-rocky.def](nice-rocky.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Rocky 9 (RHEL) | |
| *Base image* | **rockylinux:9** | *DockerHub* |
| *Updated* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HTC* | 2026-04-27 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

