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

# [numpy](/software/Python/numpy)

Container definitions file that installs numpy in a Python3 environment.

If you are planning to use the scipy package, consider our recipe for [scipy](../scipy).

## Build Notes

If including additional python packages, it is best to include them on the same 
line as numpy:

```
python3 -m pip install numpy package2 package3
```

See the [python DockerHub page](https://hub.docker.com/_/python/tags) to see 
which versions of Python and operating systems are available and adjust the 
"from" line of the definition file accordingly.

## [numpy.def](numpy.def)

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