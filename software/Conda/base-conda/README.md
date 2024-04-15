# [base-conda](/software/Conda/base-conda)

Container definition files installing packages using Conda.

If you only need Python and packages installed via `pip`, see our [Python recipes](/software/Python). 

## [base-conda.def](base-conda.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-04-15 | *Andrew Owen* |
| *Last tested on HTC* | 2024-04-15 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

When building, replace `python=3.10` with whatever conda packages you want on the `conda install` line. 