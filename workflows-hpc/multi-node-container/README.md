# Multi-Node Container Jobs on HPC

This recipe provides a template for running multi-node (Apptainer) container jobs on the HPC system.

So far, this recipe has only been tested for OpenMPI and Ubuntu OS.
In principle, a container using other version of MPI or OS could be made to accomplish the same goal,
but for now it is up to the user to figure that out.
(If you do figure it out, we'd love to know about it!)

## Building the container

> **Provided files**: 
> 
> * [multi-node.def](multi-node.def) - *Apptainer definition file*
>

### Customizing the definition file

The provided definition file is functional as is if all you need is OpenMPI and a bare-bones Ubuntu OS
(though in that case, using the OpenMPI module we provide is probably good enough too).
The real utility of this approach is the ability to install the system libraries and programs you want
inside of the container while still being able to run across multiple nodes.

There are several ways you can customize the definition file to build the container you want.

#### 
