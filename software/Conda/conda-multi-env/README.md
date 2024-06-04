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

# [conda-multi-env](/software/Conda/conda-multi-env)

Container definition file for setting up multiple conda environments within a single container.

## Creating a Conda environment

The example container files follow the following procedure for creating two different conda environments.
Modify the example or follow the process below to create your own container with multiple conda environments.

### 1. Enable conda commands

To create environments when building on top of the `continuumio/miniconda3` container, you first need to enable (additional) conda commands with

```
. activate
```

### 2. Create an environment

Use the command

```
conda create -y -n <environment_name> python=<python_version>
```

where you replace `<environment_name>` with your desired name for the environment 
and replace `<python_version>` with the version of python that you want the environment to have.

### 3. Activate and install packages in the environment

After creating the environment, you have to activate the environment with

```
conda activate <environment_name>
```

Then you can install packages using Conda, or using python's pip package:

```
conda install <package1> <package2> <...>
# and/or
python3 -m pip install <package1> <package2> <...>
```

### 4. Creating additional Conda environments

To create additional environments, first deactivate the current environment with 

```
conda deactivate
```

and then repeat steps 2-4. 

## Using the container

The first command to run when using the container is

```
source activate
```

> If you encounter an error saying something like `command 'source' not found`, try replacing `source activate` with `. activate`,
> or with `. /opt/conda/bin/activate`.

Then you can use the conda commands to activate and deactivate the environments you created:

```
conda activate your_environment_name
```

Now you can run commands that utilize packages installed in the environment. 
When you are done using that environment, run 

```
conda deactivate
```

It is generally a good idea to deactivate one environment before activating a different environment.

## [conda-multi-env.def](conda-multi-env.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-15 | *Andrew Owen* |
| *Last tested on HTC* | 2024-05-15 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-15 | *Andrew Owen* |
| *Last tested on HTC* | 2024-05-15 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

