# recipes

Recipes for building software and submitting jobs on [CHTC](https://chtc.cs.wisc.edu).

## Accessing Contents from CHTC

First, identify the repository path to the file or directory that you are interested in using.
For example, the simple example definition file `simple_apptainer.def` is located in [/software/guide\_examples](/software/guide_examples), and so the repository path is `/software/guide_examples/simple_apptainer.def`.
The first half of the URL will be `https://github.com/CHTC/recipes/raw/main/`, with the second half being the repository path.

While logged in to CHTC ([Connecting to CHTC](https://chtc.cs.wisc.edu/uw-research-computing/connecting)), you can copy just the definition file using the command

```
wget https://github.com/CHTC/recipes/raw/main/software/guide_examples/simple_apptainer.def
```

To copy the directory structure from a [workflows](/workflows/) directory, locate the `.tar.gz` file within the directory of interest.  
Then, in a similar fashion to above, use the repository path to generate the URL.
For example, 

```
wget https://github.com/CHTC/recipes/raw/main/workflows/simple_DAG/simple_DAG.tar.gz
```

## Software

CHTC is moving towards using containers for most software installations.
Containers allow users to have fine control over the libraries and dependencies that their software needs to function.
Containers are also useful for ensuring portability to other systems and, thus, reproducibility.
The [software](/software/) directory hosts container build files for Apptainer (f.k.a. Singularity) and Docker.

### Quick links

- [guide\_examples](/software/guide_examples)

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

### Quick links

- TBD

### CHTC workflow guides

- [Submitting Multiple Jobs Using HTCondor](https://chtc.cs.wisc.edu/uw-research-computing/multiple-jobs)
- [Submitting Multiple Jobs in Individual Directories](https://chtc.cs.wisc.edu/uw-research-computing/multiple-job-dirs)
- [Workflows with HTCondor's DAGMan](https://chtc.cs.wisc.edu/uw-research-computing/dagman-workflows)


