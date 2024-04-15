# [conda-pytorch](/software/Conda/conda-pytorch)

Example definition file for installing PyTorch using conda.
This recipe is especially useful for 

* installing older versions of PyTorch, which may not have official containers on DockerHub
* installing PyTorch in combination with other conda packages

## [conda-pytorch.def](conda-pytorch.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-04-15 | *Andrew Owen* |
| *Last tested on HTC* | 2024-04-15 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

### Build Notes

Installation command taken from the [PyTorch website](https://pytorch.org/get-started/locally/) using the options "Stable, Linux, Conda, Python, CUDA 12.1".