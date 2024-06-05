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

# [base-python](/software/Python/base-python)

Container definitions files for building Python packages in a base python
environment.

If you are planning to use numpy or scipy packages, consider our recipes for [numpy](../numpy) or [scipy](../scipy).

## Build Notes

When building, change `cowsay` and `tqdm` to whatever packages you want to install.

See the [python DockerHub page](https://hub.docker.com/_/python/tags) to see 
which versions of Python and operating systems are available and adjust the 
"from" line of the definition file accordingly.

## [base-python.def](base-python.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian GNU/Linux 12 (bookworm) | |
| *Base image* | **python:3.11** | *DockerHub* |
| *Updated* | 2024-03-06 | *Andrew Owen* |
| *Last tested on HTC* | 2024-03-06 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Debian GNU/Linux 12 (bookworm) | |
| *Base image* | **python:3.11** | *DockerHub* |
| *Updated* | 2024-05-10 | *Andrew Owen* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |