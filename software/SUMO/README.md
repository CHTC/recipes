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
| *Updated* | April 24, 2023 | *Andrew Owen* |
| *Last tested on HTC* | April 24, 2023 | *Andrew Owen* |
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
| *Updated* | May 2, 2023 | *Andrew Owen* |
| *Last tested on HTC* | May 2, 2023 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

Installation instructions adapted from https://sumo.dlr.de/docs/Installing/Linux_Build.html.
