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

# [FEBio](/software/FEBioStudio/FEBio)

Container definition files for installing FEBio, as part of FEBio Studio.

## Build Notes

Make sure that you place the installer file in the same directory as the `.def` or `Dockerfile` before building the container.

Then, make sure that you update the name of installer in the container definition file (change `FEBIO_INSTALLER="<installer_file_name>"` to use the correct name).

## [febio.def](febio.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Ubuntu 20.04 | |
| *Base image* | **opensciencegrid/osgvo-ubuntu-20.04** | *hub.opensciencegrid.org* |
| *Updated* | 2024-06-11 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Ubuntu 20.04 | |
| *Base image* | **opensciencegrid/osgvo-ubuntu-20.04** | *hub.opensciencegrid.org* |
| *Updated* | 2024-06-11 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |