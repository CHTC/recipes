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