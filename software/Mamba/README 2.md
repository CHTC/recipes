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

# [base-mamba](/software/Mamba/base-mamba)

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
