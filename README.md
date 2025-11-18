<!--
   Copyright 2024, Center for High Throughput Computing, University of Wisconsin - Madison

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->

# CHTC Recipes for Software Installation and Job Submission

Recipes for building software and submitting jobs on [CHTC](https://chtc.cs.wisc.edu). 
Click on the links below to view a list of available options or see the table below 
for software options: 

* [Software](software)
* [HPC Workflows](workflows-hpc)
* [HTC Workflows](workflows-htc)

We welcome contributions and feedback! [See below](#contributions-and-feedback) for more details. 

## Software List

| Software Name | Apptainer | Docker | Local Install | HPC Spack | 
| :--- | :---: | :---: | :---: | :---: |
| [Alphafold](/software/AlphaFold) | X | - | - | - | 
| [Conda](/software/Conda) | X | X | - | - | 
| [Julia](/software/Julia) | X | X | - | - | 
| [Matlab](/software/Matlab) | X | X | - | - | 
| [PALM](/software/PALM) | X | - | - | - | 
| [Python](/software/Python) | X | X | - | - | 
| [PyTorch](/software/PyTorch) | X | X | - | - | 
| [R](/software/R) | X | X | - | - | 
| [SLEAP](/software/SLEAP) | X | - | - | - |
| [SUMO](/software/SUMO) | X | X | - | - | 

## Retrieving Repository Contents from CHTC

You can retrieve the contents of this repository while logged in to CHTC ([Connecting to CHTC](https://chtc.cs.wisc.edu/uw-research-computing/connecting)) following the instructions below.

1. [Whole repository](#whole-repository)
1. [Individual files](#individual-files)
1. [Directory](#directory)

### Whole repository

If you want the whole repository, simply run

```
git clone https://github.com/CHTC/recipes.git
```

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

## Contributions and Feedback

If you are interested in contributing to this repository, or have feedback on how we can improve it, please reach out 
to us at chtc@cs.wisc.edu.
