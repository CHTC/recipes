# Nextflow recipes

This directory has container recipes for Nextflow.

- [base](./base)

  This recipe installs Nextflow, Apptainer, and their dependencies from scratch using Ubuntu as the base image.
  
- [NXF_Docker](./NXF_Docker)

  This recipe installs Apptainer on top of the official [docker://nextflow/nextflow](https://hub.docker.com/r/nextflow/nextflow) container.

> [!WARNING]
> Certain environment variables must be set and certain directories created at the start of every HTCondor job using these containers!
> See the executable `.sh` script in each recipe as an example.
