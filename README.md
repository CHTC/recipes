# recipes

Recipes for building software and submitting jobs on [CHTC](https://chtc.cs.wisc.edu).


## Software

CHTC is moving towards using containers for most software installations.
Containers allow users to have fine control over the libraries and dependencies that their software needs to function.
Containers are also useful for ensuring portability to other systems and, thus, reproducibility.
The [software](/software/) directory hosts container build files for Apptainer (f.k.a. Singularity) and Docker.


### Quick links

- [guide\_examples](/software/guide_examples)


## Workflows

The HTC system is best used for running *many* independent calculations, but organizing and submitting these calculations can be difficult.
Thankfully, [HTCondor](https://research.cs.wisc.edu/htcondor) has several builtin methods for submitting many jobs at a time, but it is still up to the user to organize the requisite files in order to leverage these tools.
The [workflows](/workflows/) directory hosts example file structures for organizing large workflows that can take advantage of HTCondor's built in methods.

> Note: Always test new workflows for a small (2-5) number of jobs before attempting to use the new workflow at full scale.


### Quick links

- TBD


## Retrieving Repository Contents from CHTC

You can retrieve the contents of this repository while logged in to CHTC ([Connecting to CHTC](https://chtc.cs.wisc.edu/uw-research-computing/connecting)) following the instructions below.


### Individual files

Individual files can be retrieved using the URL `https://github.com/CHTC/recipes/raw/main/` in combination with the relative path to the file within the repository.

First, identify the repository path to the file or directory that you are interested in using.
Next, combine the first half of the URL with the relative path to the desired file to yield the full URL.
Finally, use the `wget` command with the full URL to download the file directly to the server you are logged in to.

For example, the simple example definition file `simple_apptainer.def` is located in [/software/guide\_examples](/software/guide_examples).
Thus, the repository path is `/software/guide_examples/simple_apptainer.def`.
The full URL is then given by `https://github.com/CHTC/recipes/raw/main/software/guide_examples/simple_apptainer.def`.
The command to retrieve the file is

```
wget https://github.com/CHTC/recipes/raw/main/software/guide_examples/simple_apptainer.def
```


### Directory

At this time, GitHub does not have a mechanism for retrieving a sub-directory of a repository.
Therefore, for cases where a user may want to have an entire directory, we have prepared compressed tarballs for easy retrieval.

Follow the instructions above to retrieve the `.tar.gz` file within the directory of interest. 
Then unpack the compressed directory using the `tar` command.

For example, the [workflows/simple_DAG](/workflows/simple_DAG) directory includes the compressed file `simple_DAG.tar.gz`.
Retrieve the file using the command

```
wget https://github.com/CHTC/recipes/raw/main/workflows/simple_DAG/simple_DAG.tar.gz
```

and then unpack the compressed directory with

```
tar -xzf simple_DAG.tar.gz
```


## See Also

### CHTC container guides

- [Using Apptainer (Singularity) Environments](https://chtc.cs.wisc.edu/uw-research-computing/singularity-htc)
- [Using Software Installed in a Docker Container](https://chtc.cs.wisc.edu/uw-research-computing/docker-jobs)
- [Building a Docker Container Image](https://chtc.cs.wisc.edu/uw-research-computing/docker-build)
- [Explore and Test Docker Containers](https://chtc.cs.wisc.edu/uw-research-computing/docker-test)


### CHTC workflow guides

- [Submitting Multiple Jobs Using HTCondor](https://chtc.cs.wisc.edu/uw-research-computing/multiple-jobs)
- [Submitting Multiple Jobs in Individual Directories](https://chtc.cs.wisc.edu/uw-research-computing/multiple-job-dirs)
- [Workflows with HTCondor's DAGMan](https://chtc.cs.wisc.edu/uw-research-computing/dagman-workflows)

