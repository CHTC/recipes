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

To build a container customized for your software deployment, you'll need to provide
instructions in the definition file.

### Structure of the definition file

The provided definition file takes advantage of Apptainer's "multi-stage build".
In this case, there are two stages: build and final. 

In the build stage, the official Spack container is used to install OpenMPI
and its dependencies as necessary for running on the CHTC's HPC system.
Once OpenMPI is compiled, there is no longer any need for Spack.

In the final stage, the compiled OpenMPI is copied into a fresh Ubuntu 22.04
container.
OS packages necessary for OpenMPI are installed, and the user has the opportunity
to provide further installation commands for their particular software, 
which can be compiled using OpenMPI. 

The final, resulting container image file will not contain Spack or any of its
dependencies beyond what is necessary to run OpenMPI and its dependencies.

### Customize the definition file

The provided definition file ([multi-node.def](multi-node.def)) is functional
as-is if all you need is OpenMPI and a bare-bones Ubuntu OS (though in that
case, using the OpenMPI module we provide is probably good enough too).
The real utility of this approach is the ability to install the system libraries
and programs you want inside of the container while still being able to run
across multiple nodes.

There are several ways you can customize the definition file to build the
container you want.

#### Install packages using the OS package manager

The `apt` package manager is used to install OS libraries in both the build and
the final stage within the definition file.
You can add additional libraries to these lists. 

Using the OS package manager is recommended when you need access to the header
files of libraries for compiling additional programs.

It is recommended to duplicate the full list of `apt` packages in both stages
of the definition file.
While this may not be necessary, it ensures that OpenMPI is compiled in a 
similar environment as the software installed in the final stage.

#### Install packages using Spack

The `spack` package manager is used to install OpenMPI and the necessary dependencies
for running on CHTC's HPC system. 
It can also be used to easily install other programs available throught the Spack ecosystem.
To add packages for Spack to install, you'll need to modify the `spack: specs:` section. 
For more information on package "specs", see our guide [Install Software Using Spack](https://chtc.cs.wisc.edu/uw-research-computing/hpc-spack-install#d-adding-package-specifications-to-the-environment).

Using Spack is recommended for installing large programs with many dependencies,
or programs with complicated installation process.
It is not recommended if you need access to the header files for compiling additional programs.

#### Manually compile programs

Towards the end of the final stage in the definition file is a section for 
manually compiling your programs.
Add the Linux commands for compiling your programs here,
and as long as the necessary dependencies are present and the commands are
noninteractive (do not have prompts to the user), 
they should work.

Manually compiling programs is recommended for installing programs from GitHub
or other sources. 
For complex programs, consider seeing if there is a corresponding Spack package.

Manually compiled programs should be installed into the `/opt` directory in the container.
If your program(s) require environment modifications, it is recommended to 
append the relevant commands to the `/etc/bashrc` file.
Then in your executable script, begin with sourcing said file to apply the environment modifications.

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



