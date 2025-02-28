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

# [base-julia](/software/Julia/manifest-julia)

Container definition files for building Julia packages in a base Julia environment using existing `Project.toml` and `Manifest.toml` files.

## [manifest-julia.def](manifest-julia.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bookworm" | |
| *Base image* | **julia:1.10** | *[DockerHub](https://hub.docker.com/layers/library/julia/1.10.2-bookworm/images/sha256-9e937d5a591b59f2680e7c5d665bf96ad80029034f22638564ae59ad52b472b6?context=explore)* |
| *Updated* | 2025-02-28 | *Amber Lim* |
| *Last tested on HTC* | 2025-02-28 | *Amber Lim* |
| *Last tested on HPC* | - | - |

### Build Notes

You will need to transfer your existing `Project.toml` and `Manifest.toml` files in your submit file for the build job.

Make sure that the version numbers in the `%files` section are consistent with the version you select in the `From:` line.

When testing, use the `-C` flag to avoid a read-only system error that occurs when using the `apptainer shell` command. These errors do not propagate into jobs using the Julia container. i.e., use `apptainer shell -C julia.sif`.

