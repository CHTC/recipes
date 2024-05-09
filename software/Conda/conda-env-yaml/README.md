# [conda-env-yaml](/software/Conda/conda-env-yaml)

Container definition file for installing packages using conda and an `environment.yml` file.

## The environment file

This recipe uses an `environment.yaml` file to provide the list of conda packages to install.
To create such a file, follow these steps:

1. Activate the conda environment you want to replicate.
2. Export the conda environment using the following command:

   ```
   conda env export --from-history > environment.yaml
   ```

3. Copy the `environment.yaml` to the location where you will be running your container build command.
   **This recipe assumes that the `environment.yaml` file is in the same directory as the container build file!**
   If you are using Docker to build the container on your device, move the file to the same directory as your Dockerfile.
   If you are using Apptainer on HTC to build the container, transfer the file to login server, and then include the file in
   the `transfer_input_files` line of your `build.sub` submit file.

For more information on the `environment.yaml` file, see the [Conda documentation](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#exporting-an-environment-file-across-platforms).

## Naming the environment

By default the name of the environment that will be created will be the same as the environment you used to create the `environment.yaml` file.
If you want the environment name to be different, you can override it by replacing the line

```
conda env create -f /environment.yaml
```

with 

```
conda env create -n your_environment_name -f /environment.yaml
```

## Activating the environment

When using this container, run the following commands in order to activate the environment:

```
source activate
conda activate your_environment_name
```

For HTC jobs, you should add these lines to the top of your executable `.sh` file.

## [conda-env-yaml.def](conda-env-yaml.def)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-19 | *Andrew Owen* |
| *Last tested on HTC* | 2024-05-19 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

## [Dockerfile](Dockerfile)

| | | |
| ---: | :--- | :--- |
| *Type* | **Apptainer** | |
| *OS* | Debian "bullseye" | |
| *Base image* | **continuumio/miniconda3:latest** | *DockerHub* |
| *Updated* | 2024-05-19 | *Andrew Owen* |
| *Last tested on HTC* | 2024-05-19 | *Andrew Owen* |
| *Last tested on HPC* | - | - |

