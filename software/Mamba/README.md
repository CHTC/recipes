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

# Mamba

Recipes for software installed using [Mamba](https://mamba.readthedocs.io/en/latest/) via [Miniforge](https://github.com/conda-forge/miniforge).

- [Adding packages to base Mamba](base-mamba)

These containers are based on the official Miniforge containers provided on [DockerHub](https://hub.docker.com/r/condaforge/miniforge3).

## Why Mamba and Miniforge instead of Conda and Miniconda?

Mamba and Miniforge are drop-in replacements for Conda and Miniconda that offer meaningful improvements, especially in containerized HTC workflows.

### Faster dependency resolution

Conda's dependency solver is written in Python and can take minutes (or longer) to resolve complex environments. Mamba re-implements the solver in C++ using [libsolv](https://github.com/openSUSE/libsolv) — the same SAT-based solver used by Linux package managers like `dnf` and `zypper`. The result is dependency resolution that is typically **10–100× faster** than Conda.

### Parallel downloads

Mamba downloads packages in parallel rather than sequentially. Combined with faster solving, this makes container builds significantly quicker.

### conda-forge by default

Miniforge configures `conda-forge` as the **default channel**, not Anaconda's `defaults` channel. The `conda-forge` channel is:

- **Larger**: tens of thousands of packages across all domains
- **More up-to-date**: community-maintained with frequent releases
- **License-safe**: no Anaconda Terms of Service restrictions (see below)

### No licensing restrictions

Anaconda's Terms of Service restricts commercial and large-organization use of the `defaults` channel bundled with Miniconda. Miniforge uses only `conda-forge`, which carries no such restrictions. This is relevant for CHTC users at UW-Madison and other institutions.

### Fully compatible with Conda

Mamba accepts the same commands as Conda (`mamba install`, `mamba env create`, etc.). Any Conda recipe can be converted by replacing `conda` with `mamba` in the install commands and swapping the base image.

## How to install packages

Using the `condaforge/miniforge3` containers, install packages with `mamba install`:

```
    mamba install python=3.10 numpy scipy
```

You can still use `conda install` in these containers — Mamba is an accelerated implementation of the same interface.

You do not need to create or activate a conda environment using these containers (since the container is the "environment").

**Once the container has been built, you will not be able to install packages**.
Remember that containers on CHTC are executed read-only; any installation commands must be added to the container definition file before building the container.

## Using the containers

For non-interactive HTCondor jobs, you do not need to activate an environment to use the installed packages.
Your executable can be a `.sh` or `.py` script file, as long as there is a proper shebang (the first line, starting with `#!`).

For interactive HTCondor jobs, you may need to first run `conda activate` in order to use the packages.

# Base-mamba

Container definition files installing packages using Mamba (via Miniforge).

If you only need Python and packages installed via `pip`, see our [Python recipes](/software/Python).

## Build Notes

When building, replace `python=3.10` with whatever packages you want on the `mamba install` line.
You can specify multiple packages and channels in a single command:

```
    mamba install python=3.10 numpy scipy -c conda-forge
```

Since Miniforge already defaults to `conda-forge`, the `-c conda-forge` flag is typically not needed.
Add additional channels with `-c <channel>` as needed (e.g., `-c bioconda`).

## [base-mamba.def](base-mamba.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bookworm" | |
| *Base image* | **condaforge/miniforge3:latest** | *DockerHub* |
| *Updated* | 2026-03-31 | *CHTC* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Debian "bookworm" | |
| *Base image* | **condaforge/miniforge3:latest** | *DockerHub* |
| *Updated* | 2026-03-31 | *CHTC* |
| *Last tested on HTC* | - | - |
| *Last tested on HPC* | - | - |