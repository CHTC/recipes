<!--
   Copyright 2026, Center for High Throughput Computing, University of Wisconsin - Madison

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

# [ORCA](/software/ORCA)

> [!CAUTION]
> Do not share ORCA, or software/containers that contain ORCA, on public systems such as GitHub or DockerHub.
> 
> This recipe is intended to make it easier to set-up ORCA, reproducibly, for an individual.

Container definition files for the ORCA program.

> Big thanks to [Craig Waitt](https://github.com/cwaitt) for doing the initial prototyping!

Program overview: https://www.faccts.de/orca/

> ORCA is a powerful and versatile quantum chemistry software package, primarily developed by the group of Prof. Frank Neese.
> ... ORCA provides cutting-edge methods in the field of electronic structure theory, including density functional- as well as correlated wave function-based methods.

## Getting ORCA

ORCA is a *licensed* software, however, it is free of charge for academic users. 
You will need to register with their [user forum](https://orcaforum.kofo.mpg.de/app.php/portal) in order to download the software.

Be sure to select the Linux version of the software for download, e.g., `orca_6_1_1_linux_x86-64_shared_openmpi418_nodmrg.tar.xz`. 

> [!WARNING]
> The academic version of ORCA is licensed for *individual* users; do not share with your colleagues or lab members. 
> (Your PI may register for a group license, in which case it is okay to share with lab members.)

### Reorganization

To make it easier to work with, it is a good idea to reorganize the code into shorter names.

|  | Compressed name | Decompressed name |
| --- | --- | --- |
| Before | `orca_6_1_1_linux_x86-64_shared_openmpi418_nodmrg.tar.xz` | `orca_6_1_1_linux_x86-64_shared_openmpi418_nodmrg` |
| After | `orca.tar.gz` | `orca` |

To do this, you'll need to decompress, rename the directory, then recompress the data.

```bash
# Extract 
tar -xf orca_6_1_1_linux_x86-64_shared_openmpi418_nodmrg.tar.xz

# Rename
mv orca_6_1_1_linux_x86-64_shared_openmpi418_nodmrg orca

# Recompress
tar -czf orca.tar.gz orca
```

## Using this recipe

1. **If using Apptainer**, use the `orca.def` recipe to build a `.sif` file that contains the ORCA code and license. *Do not share the container image with others!*
2. **If using Docker and a *private* repository**, you can use the `Dockerfile.private` recipe. *Do not share the container image with others!*
3. **If using Docker and a *public* repository**, use the `Dockerfile` recipe. 

In the case of options 1 or 2, you can invoke the ORCA commands directly.

In the case of option 3, you will need to send the ORCA files along with the container as described in the next section.

> [!TIP]
> You can only use the Apptainer recipe on the HPC system, but it may be easier to use the provided system modules instead of a container for better multi-node support. See the [HPC Software guide](https://chtc.cs.wisc.edu/uw-research-computing/hpc-software) for more information.

### Building the container images

For options 1 or 2, you will need to have the ORCA code `.tar.xz` file in the same directory as the `.def` or `Dockerfile` when you build the container. 

**Be sure to update the ORCA `.tar.xz` filename in the definition file to match your version.**

For option 3, you do not need to have the ORCA code file when you build the container.

### Using the container to provide dependencies

For option 3, you will need to send the ORCA code along with the job.
We recommend you keep the files in their zipped form for this part.

In your submit file, you will use something like this:

```
container_image = docker://YOUR_DOCKER_ADDRESS/orca-dependencies:v0
```

You will also need to include the ORCA code in your input transfer:

```
transfer_input_files = orca.tar.gz, water.inp
```

For your executable script, you will need to include instructions to

* decompress the ORCA code
* add the ORCA commands to the environment's PATH
* add the ORCA libraries to the library path

Here is an example executable script:

**run_orca.sh**

```bash
#!/bin/bash

# Extract/decompress
tar -xzf orca.tar.gz

# Add to PATH, library
export PATH="${PWD}/orca:${PATH}"
export LD_LIBRARY_PATH="${PWD}/orca/lib:${LD_LIBRARY_PATH}"

# Run your ORCA command
orca water.inp
```

Be sure to run a single test before you submit many such jobs.

## [orca.def](orca.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian | |
| *Base image* | **ubuntu:24.04** | *DockerHub* |
| *Updated* | 2026-07-15 | *Andrew Owen* |
| *Last tested on HTC* | 2026-07-15 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## Dockerfile

| | | |
| ---: | :--- | :--- |
| *Type* | **Docker** | |
| *OS* | Debian | |
| *Base image* | **ubuntu:24.04** | *DockerHub* |
| *Updated* | 2026-07-15 | *Andrew Owen* |
| *Last tested on HTC* | 2026-07-15 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

