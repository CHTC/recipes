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

# [conda-env-yaml](/software/Conda/conda-env-yaml)

Container definition file for installing packages using conda and an `environment.yml` file.

## Overview

**Who would need this?** Conda is a widely used package managers for both python-based and non-python packages, and contains software from many fields of study. Because of it's simplicity to manage software dependencies, many researchers might be familiar with installing conda packages on their laptop or a single server (e.g. a lab server). However, if you want to reproduce that environment in one of your HTCondor job, you must first use convert it into a container. How do you do this then?

**Overview** The idea is to generate a `yml` file from your existing `conda environment`, transfer this file to the access point, and use it to build a container image file. The container image file can then be called in your HTCondor submit script, and activated it in your script.

> [!NOTE] 
> For more information about conda files and conda yml files, [visit the conda documentation](https://docs.conda.io/projects/conda/en/stable/user-guide/getting-started.html)

> [!TIP] 
> If you do not intend to move your **existing** conda environment *and/or* environment only contains 1 or a few packages installed from conda, you may want to instructions on how to use conda-base instead: [here](../base-conda/README.md). That will skip the whole exporting to yaml process, and go directly into building the Apptainer container using the `conda-base.def` definition file template in a build job.

## Set up

This guide assumes that you already have a conda environment that you want to export. 
If you do not, then you can create one by opening a Terminal window on your laptop and entering the following commands:

```
# assumes conda is installed previously
conda create -n MyEnvironment
conda activate MyEnvironment
conda install -c channel package1 package2 package2
conda deactivate
```

Replace MyEnvironment with the environment name you want, and channel and packages with those you wish. 

Then, follow the steps in the sections below to create your container.

## 1. The environment file

This recipe uses an `environment.yaml` file to provide the list of conda packages to install.
To create such a file, follow these steps:

1. Activate the conda environment you want to replicate.

   ```
   conda activate MyEnvironment 
   ```
    
   You can confirm the environment is activated by running `conda env list` - the active environment is marked by an asterisk (`*`).

2. Export the conda environment using the following command:

   ```
   conda env export --from-history > environment.yaml
   ```

3. Copy the `environment.yaml` to the location where you will be running **your container build command**.
   **This recipe assumes that the `environment.yaml` file is in the same directory as the container build file!**
   If you are using Docker to build the container on your device, move the file to the same directory as your Dockerfile.
   
   If you are using Apptainer on HTC to build the container, transfer the file to login server, and then include the file in
   the `transfer_input_files` line of your `build.sub` submit file.

For more information on the `environment.yaml` file, see the [Conda documentation](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#exporting-an-environment-file-across-platforms).

> [!TIP] 
> An example `build.sub` submit file can be found at [documentation](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc.html#start-an-interactive-build-job). If you don't know how to copy a local file to the server, visit [this page](https://chtc.cs.wisc.edu/uw-research-computing/transfer-files-computer)

(Docker Instructions TBD)

## 2. Build Apptainer container on CHTC

Login to CHTC as normal, following the instructions [here](https://chtc.cs.wisc.edu/uw-research-computing/connecting).

Fetch a copy of the `conda-env-yaml.def` template by running the following command:

```
wget https://github.com/CHTC/recipes/raw/refs/heads/main/software/Conda/conda-env-yaml/conda-env-yaml.def
```

> [!NOTE]
> If you used a name different from `environment.yaml`, you will need to edit the `conda-env-yaml.def` file you downloaded. Use a command line editor such as `nano` or `vi` to open the `conda-env-yaml.def` file, then and replace `environment.yaml` with the name of the `.yaml` file you are using.

## 3. Naming the environment

By default the name of the environment that will be created will be the same as the environment you used to create the `environment.yaml` file.
If you want the environment name to be different, you can override it by replacing the line.

> [!TIP]
> Alternatively, you can edit the `conda-env-yaml.def` file to change how the environment is named.
> Open the file and make the following change:
>
> ```diff
> - conda env create -f /environment.yaml
> + conda env create -n your_environment_name -f /environment.yaml
> ```
>
> where `your_environment_name` should be replaced with the name you want to use.

Make sure you save any changes before proceeding.

## 4. Prepare interactive build job

Next  modify your generic `build.sub` file and ensure the `transfer_input_files=` line mentions the files needed to build the container:

- `environment.yaml` (or whatever name you chose for this file)
- `conda-env-yaml.def`

For example: 

```
transfer_input_files = environment.yaml, conda-env-yaml.def
```

Save your changes before proceeding.

## 5. Submit interactive build job

Submit the interactive build job by running the command 

```
condor_submit -i build.sub
```

This should start within a couple of minutes.
You will see something like `Welcome to interactive1_1@build4000.chtc.wisc.edu` after it has started, and then you will be able to run commands again.

Confirm that the files you need were successfully transferred by running

```
ls
```

## 6. Build Apptainer container

Now run

```
apptainer build yourEnvironmentName.sif conda-env-yaml.def
```

where you can change `yourEnvironmentName` to whatever you wish.

This step may take a while.
The output should look like what you are used to seeing when you normally do `conda install` commands.

> [!TIP]
> If the build command fails, there should be an error message explaining why it failed.
> There are many reasons a build could fail, so if you are having trouble, feel free to [ask for help](https://chtc.cs.wisc.edu/uw-research-computing/get-help.html).

## 7. Test Apptainer container

A successful build does not necessarily mean that the container does what you want.

Run the following to interactively test the container:

```
apptainer shell -e yourEnvironmentName.sif
```

Next, check that the software you want to use has been installed.

* For python packages, you can run `python3` and then manually `import` packages.
* For other packages, you can run `commandname -h` or `commandname --help` to show the help text.

When you have finished testing, exit the interactive container session by running

```
exit
```

If something went wrong during your testing, you can edit `conda-env-yaml.def` or `environment.yaml` then try building the container again.

## 8. Relocate container image file

When you are satisfied the container is built correctly, move the new file to your large file staging directory with:

```
mv yourEnvironmentName.sif /staging/netid/
```

When you are finished, quit the interactive build job by running

```
exit
```

## 9. Using the Apptainer image

First, edit your submit file to add the path to your container image (`.sif`), like so:

```
container_image = file:///staging/netid/yourEnvironmentName.sif
```

When using this container, run the following commands in order to activate the environment:

```
source activate
conda activate your_environment_name
```

For HTC jobs, you should add these lines to the top of your executable `.sh` file.

## Potential issues during apptainer build job

You might see that a package cannot be found in the current channels listed:

```
PackagesNotFoundError: The following packages are not available from current channels:
  - PACKAGE
 Current channels:

  - https://conda.anaconda.org/conda-forge
  - https://repo.anaconda.com/pkgs/main
```

If that's the case, open your environment.yaml and add the channel in the list, for example, if you package is from the bioconda channel you would add it to the list

```
channels:
  - conda-forge
  - bioconda <---- LINE TO ADD
```

Then retype the `apptainer build` command.

## [conda-env-yaml.def](conda-env-yaml.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-09 | *Andrew Owen* |
| *Last tested on HTC* | 2024-05-09 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-09 | *Andrew Owen* |
| *Last tested on HTC* | 2024-05-09 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

