# [SUMO](/software/SUMO)

Container definition files for the SUMO program.

Program overview: https://sumo.dlr.de/docs/index.html

## [sumo.def](sumo.def)

Base image: **ubuntu:22.04** (Docker)

Installation instructions adapted from https://sumo.dlr.de/docs/Installing/Linux_Build.html.

The `chmod 777 /tmp` command was included to ensure `apt-get` functioned properly within the Apptainer build.

| | | |
| ---: | :--- | :--- |
| *Type* | Apptainer||
| *Updated* | April 24, 2023 | *Andrew Owen* |
| *Last tested on HTC* | April 24, 2023 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [sumo.dockerfile](sumo.dockerfile)

Base image: **ubuntu:22.04** (Docker)

Installation instructions adapted from https://sumo.dlr.de/docs/Installing/Linux_Build.html.

| | | |
| ---: | :--- | :--- |
| *Type* | Docker||
| *Updated* | May 2, 2023 | *Andrew Owen* |
| *Last tested on HTC* | May 2, 2023 | *Andrew Owen* |
| *Last tested on HPC* | - | - |
