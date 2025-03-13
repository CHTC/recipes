# Multi-Node Container Jobs on HPC

This recipe provides a template for building and running multi-node (Apptainer)
container jobs on the HPC system.

So far, this recipe has only been tested for OpenMPI and Ubuntu OS.
In principle, a container using other version of MPI or OS could be made to
accomplish the same goal, but for now it is up to the user to figure that out.
(If you do figure it out, we'd love to know about it!)

This recipe uses a multi-stage container build and uses
[Spack](https://spack.io/) to compile OpenMPI with the correct options for
CHTC's HPC system.

## How to build the container

> **Provided files**:
>
> * [multi-node.def](multi-node.def) - *Apptainer definition file*
>

First, you need to build the container customized for your software deployment.

### Customize the definition file

The provided definition file ([multi-node.def](multi-node.def)) is functional
as-is if all you need is OpenMPI and a bare-bones Ubuntu OS (though in that
case, using the OpenMPI module we provide is probably good enough too).
The real utility of this approach is the ability to install the system libraries
and programs you want inside of the container while still being able to run
across multiple nodes.

There are several ways you can customize the definition file to build the
container you want.

#### Install packages using `apt`

#### Install packages using Spack

#### Manually compile programs

### Build the container

Using the definition file that you customized, follow the instructions in the
guide on our website to build the Apptainer container on the HPC system:
[Using Apptainer Containers on HPC](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-hpc).

Once built, we recommend that you move the generated `.sif` file to a location
in your `/home` directory.

## How to run a multi-node container job

> **Provided files**:
>
> * [multi-node.sbatch](multi-node.sbatch) - *Slurm submission script for
                                             launching multi-node container job*
> * [multi-node.sh](multi-node.sh) - *Script for executing parallelized
                                     code inside of the container job*
>

Adapt and use the provided files to launch a multi-node job that uses your
customized container as the software environment.

### SBATCH script

There are three main things to consider editing in the sbatch script.

1. The `#SBATCH` options controlling the Slurm job submission. 

   Feel free to edit these as you see fit.

2. The `container_path` and `executable_path` values.

   These values are used when launching the container.
   The `container_path` is the location of the multi-node container.
   The `executable_path` is the location of the script that you want
   to run inside of the container environment.

3. The `export TMPDIR` command.

   If using multiple nodes, then you should use the `export TMPDIR` 
   command that points to your `/scratch` directory.

   If running on a single node, you can speed up disk usage by using
   the `export TMPDIR` command that points to the `/local` directory.

   > The `/local` directory is only accessible on the specific machine
   > running the command. For multi-node jobs, that means that each
   > machine has distinct `/local` directory that is inaccessible to
   > the other machines running the job.

You should not need to edit the `srun` command or the `apptainer` command,
with the exception of binding in shared group directories. 
In that case, mimic the other `--bind` options and add the additional path
you want your script to have access to.

For example, if your script needs to access `/home/groups/my_group`, you would 
insert `--bind /home/groups/my_group \` into the list of other `--bind` lines.

### Executable script

The contents of the executable script (the script specified by `executable_path` in
the sbatch script) contains the commands that you want to run inside of the container
environment.

Add whatever commands you want to run to the end of the provided `multi-node.sh` file.

Keep in mind that commands that are not MPI-enabled will be duplicated by each of the 
nodes in the job. 
*Instructions for how to avoid this behavior are a work in progress.*

**NOTE**: You should not use any `srun`/`mpirun`/etc. commands inside of the executable script!



