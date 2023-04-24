# recipes

Recipes for building software and submitting jobs on [CHTC](https://chtc.cs.wisc.edu).

## Software

CHTC is moving towards using containers for most software installations.
Containers allow users to have fine control over the libraries and dependencies that their software needs to function.
Containers are also useful for ensuring portability to other systems and, thus, reproducibility.
The [software](/software/) directory hosts container build files for Apptainer (f.k.a. Singularity) and Docker.

### CHTC container guides

- [Using Apptainer (Singularity) Environments](https://chtc.cs.wisc.edu/uw-research-computing/singularity-htc)
- [Using Software Installed in a Docker Container](https://chtc.cs.wisc.edu/uw-research-computing/docker-jobs)
- [Building a Docker Container Image](https://chtc.cs.wisc.edu/uw-research-computing/docker-build)
- [Explore and Test Docker Containers](https://chtc.cs.wisc.edu/uw-research-computing/docker-test)

## Workflows

The HTC system is best used for running *many* independent calculations, but organizing and submitting these calculations can be difficult.
Thankfully, [HTCondor](https://research.cs.wisc.edu/htcondor) has several builtin methods for submitting many jobs at a time, but it is still up to the user to organize the requisite files in order to leverage these tools.
The [workflows](/workflows/) directory hosts example file structures for organizing large workflows that can take advantage of HTCondor's built in methods.

> Note: Always test new workflows for a small (2-5) number of jobs before attempting to use the new workflow at full scale.

### CHTC workflow guides

- [Submitting Multiple Jobs Using HTCondor](https://chtc.cs.wisc.edu/uw-research-computing/multiple-jobs)
- [Submitting Multiple Jobs in Individual Directories](https://chtc.cs.wisc.edu/uw-research-computing/multiple-job-dirs)
- [Workflows with HTCondor's DAGMan](https://chtc.cs.wisc.edu/uw-research-computing/dagman-workflows)


