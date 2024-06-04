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

# [SUMO](/software/SUMO)

Container definition files for the SUMO program.

Program overview: https://sumo.dlr.de/docs/index.html

> "Simulation of Urban MObility" (SUMO) is an open source, highly portable, microscopic and continuous 
> traffic simulation package designed to handle large networks. It allows for intermodal simulation 
> including pedestrians and comes with a large set of tools for scenario creation.

## [sumo.def](sumo.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu | |
| *Base image* | **ubuntu:22.04** | *DockerHub* |
| *Updated* | 2024-01-23 | *Andrew Owen* |
| *Last tested on HTC* | 2023-04-24 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

Installation instructions adapted from https://sumo.dlr.de/docs/Installing/Linux_Build.html.

The `chmod 777 /tmp` command was included to ensure `apt-get` functioned properly within the Apptainer build.

## [sumo.dockerfile](sumo.dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Ubuntu | |
| *Base image* | **ubuntu:22.04** | *DockerHub* |
| *Updated* | 2024-01-23 | *Andrew Owen* |
| *Last tested on HTC* | 2023-05-02 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

Installation instructions adapted from https://sumo.dlr.de/docs/Installing/Linux_Build.html.
