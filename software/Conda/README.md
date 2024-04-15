# Conda

Recipes for software installed using [Conda](https://docs.conda.io/en/latest/).

- [Adding packages to base conda](base-conda)
- [Installing packages using a requirements file](conda-requirements)
- [Installing PyTorch using conda](conda-pytorch)

These containers are based on the official Miniconda containers provided on [DockerHub](https://hub.docker.com/r/continuumio/miniconda3).

## How to install packages

Using the `continuumio` Miniconda containers, you install the packages directly via the `conda install` command.
Modify the example definition files to provide the packages that you want to use, in one line.

For example, the [PyTorch definition file](conda-pytorch/conda-pytorch.def) installs multiple packages and specifies several different channels to use:

```
    conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
```

You do not need to create or activate a conda environment using these containers (since the container is the "environment").

**Once the container has been built, you will not be able to install conda packages**.
Remember that containers on CHTC are executed read-only; any installation commands must be added to the container definition file before building the container.

## Using the containers

For non-interactive HTCondor jobs, you do not need to activate an environment to use the conda packages, nor should you try.
This means that your executable can be a `.sh` or `.py` or script file, so long as their is a proper shebang (the first line, starting with `#!`).

For interactive HTCondor jobs, you will need to first run `condor activate` in order to use the conda packages.