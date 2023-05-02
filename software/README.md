# [software](/software/)

Definition files for building containers for use on CHTC.
CHTC is moving towards using containers for most software installations. 
Containers allow users to have fine control over the libraries and dependencies that their software needs to function.
Containers are also useful for ensuring portability to other systems and, thus, reproducibility. 

## Organization

The [software](/software/) directory is organized by the top level software program, that is, the main program that 
the container is intended for.
For example, the container for SUMO also has Python installed, but Python is a required dependency of SUMO.
Therefore SUMO is the top level program, and so the container for SUMO is hosted in [software/SUMO](/software/SUMO/) 
and not in [software/Python](/softare/Python/).

## Building and Using Containers on CHTC

The [CHTC](https://chtc.cs.wisc.edu) website has several guides pertaining to building and using containers on the 
HTC system.
Both Apptainer and Docker containers can be used with the HTC system, and containers can be built during an 
interactive session.
(At this time, container technology is not implemented on the HPC system.)

***NOTE**: Docker containers CANNOT be pushed to DockerHub from the HTC system.
If you are building a container that you wish to host on DockerHub (which is required for running containers using 
HTCondor), you will need to build the container on your own computer.*

### Apptainer

* [Using Apptainer \(Singularity\) Environments](https://chtc.cs.wisc.edu/uw-research-computing/singularity-htc)

#### Building an Apptainer container

The following can be completed from within an interactive job on the HTC system 
([Compiling or Testing Code with an Interactive Job](https://chtc.cs.wisc.edu/uw-research-computing/inter-submit)).

1. Write an `image.def` file

   You can write a container image definition file (`.def`) from scratch, or copy and modify a `.def` file from 
   this repository to suit your purposes.

2. Build the container

   The container image can be built from the `image.def` file with the command
   ```
   apptainer build image.sif image.def
   ```
   where the name of the container image is provided first (`image.sif`).
   
3. Save the container

   Check the size of the container image file (`.sif`) with the command `ls -lh`. 
   If the `.sif` file is larger than 100 MB, consider moving the file to a `/staging` directory for later use 
   ([Managing Large Data in HTC Jobs](https://chtc.cs.wisc.edu/uw-research-computing/file-avail-largedata)).
   Otherwise the `.sif` file will be transferred to your `/home` directory when you exit the interactive job.
   
#### Using an Apptainer container

On the HTC system, you will need to provide instructions within the submit file (for example, `container.sub`) 
for using your desired container.

1. Transfer the `.sif` file

   If the container image file (`.sif`) is located in your `/home` directory in the same folder as the submit file, 
   you can simply use
   ```
   transfer_input_files = image.sif
   ```
   Otherwise, if the container image file is located in a staging directory, you can use the `file` plugin, like so:
   ```
   transfer_input_files = file:///staging/yourUsername/image.sif
   ```
   
2. Set `container_image`

   Simply set the name of your container image file (`.sif`) as the `container_image`:
   ```
   container_image = image.sif
   ```

Now when you run a job using `condor_submit container.sub`, HTCondor will automatically run the container for you,
and the executable that you provided in the submit file will be run within that container.
Otherwise, the calculation will be no different than a "regular" job.

### Docker

* [Building a Docker Container Image](https://chtc.cs.wisc.edu/uw-research-computing/docker-build)
* [Explore and Test Docker Containers](https://chtc.cs.wisc.edu/uw-research-computing/docker-test)
* [Running HTC Jobs Using Docker Containers](https://chtc.cs.wisc.edu/uw-research-computing/docker-jobs)

#### Building a Docker container

The following can be completed from within an interactive job on the HTC system 
([Compiling or Testing Code with an Interactive Job](https://chtc.cs.wisc.edu/uw-research-computing/inter-submit)).

***NOTE**: Docker containers CANNOT be pushed to DockerHub from the HTC system.
If you are building a container that you wish to host on DockerHub (which is required for running containers using 
HTCondor), you will need to build the container on your own computer.*

1. Write a `Dockerfile` file

   You can write a container image definition file (`Dockerfile`) from scratch, or copy and modify a `.dockerfile` file 
   from this repository to suit your purposes.
   The file must be named `Dockerfile` for the build command to work.
   
2. Build the container

   The container image can be built from the `Dockerfile` file using the command
   ```
   docker build -t yourDockerUsername/imageName:tag .
   ```
   where you provide your Docker username, the name for the image itself, as well as a tag (typically a version number).
   
3. Save the container

   If you are building the container on your own computer, you should be able to push the container to DockerHub with
   with the command
   ```
   docker push yourDockerUsername/imageName:tag
   ```
   where the username, image name, and tag are the same as you used in the `docker build` step.
   
#### Using a Docker container

On the HTC system, you will need to provide instructions within the submit file (for example, `container.sub`) 
for using your desired container.

**The container must be in a public repository on DockerHub.**
   
1. Set `container_image`

   Simply use the DockerHub convention for naming your desired container as the `container_image`:
   ```
   container_image = yourDockerUsername/imageName:tag
   ```

Now when you run a job using `condor_submit container.sub`, HTCondor will automatically pull the specified container
from DockerHub and run the container for you, and the executable that you provided in the submit file will be run 
within that container.
Otherwise, the calculation will be no different than a "regular" job.
