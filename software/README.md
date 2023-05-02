# [software](/software/)

Definition files for building containers for use on CHTC.
CHTC is moving towards using containers for most software installations. 
Containers allow users to have fine control over the libraries and dependencies that their software needs to function.
Containers are also useful for ensuring portability to other systems and, thus, reproducibility. 

## Organization

The [software](/software/) directory is organized by the top level software program, that is, the main program that the container is intended for.
For example, the container for SUMO also has Python installed, but Python is a required dependency of SUMO.
Therefore SUMO is the top level program, and so the container for SUMO is hosted in [software/SUMO](/software/SUMO/) and not in [software/Python](/softare/Python/).

## Building and Using Containers on CHTC

The [CHTC](https://chtc.cs.wisc.edu) website has several guides pertaining to building and using containers on the HTC system.
Both Apptainer and Docker containers can be used with the HTC system, and containers can be built during an interactive session.
(At this time, container technology is not implemented on the HPC system.)

### Apptainer

* [Using Apptainer \(Singularity\) Environments](https://chtc.cs.wisc.edu/uw-research-computing/singularity-htc)

### Docker

* [Building a Docker Container Image](https://chtc.cs.wisc.edu/uw-research-computing/docker-build)
* [Explore and Test Docker Containers](https://chtc.cs.wisc.edu/uw-research-computing/docker-test)
* [Running HTC Jobs Using Docker Containers](https://chtc.cs.wisc.edu/uw-research-computing/docker-jobs)
