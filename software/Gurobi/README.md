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

# [Gurobi](/software/Gurobi)

Container definition files for building Gurobi.

Program overview: https://www.gurobi.com/solutions/gurobi-optimizer/

    The Gurobi Optimizer is a mathematical programming solver available for LP, QP and MIP (MILP, MIQP, and MIQCP) problems.

Refer to CHTC documentation building [Apptainer container images](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc.html) or [Docker container images](https://chtc.cs.wisc.edu/uw-research-computing/docker-build).

CHTC users will need to be on the approved users list for Gurobi to access the license.

**By using these definition files, you are agreeing to the terms and conditions for the use of Gurobi as licensed by CHTC, for use at CHTC.**

## [gurobi.def](gurobi.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian GNU/Linux 11 (bullseye) | |
| *Base image* | **gurobi/optimizer:11.0.3** | *DockerHub* |
| *Updated* | 2024-11-06 | *Amber Lim* |
| *Last tested on HTC* | 2024-11-06 | *Amber Lim* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Dockerfile** | |
| *OS* | Debian GNU/Linux 11 (bullseye) | |
| *Base image* | **gurobi/optimizer:11.0.3** | *DockerHub* |
| *Updated* | 2024-11-06 | *Amber Lim* |
| *Last tested on HTC* | 2024-11-06 | *Amber Lim* |
| *Last tested on HPC* | - | - |
