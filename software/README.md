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

# [software](/software)

This folder contains "recipes" for building software in different ways in CHTC -- 
as a container (Docker or Apptainer), a local build, or using Spack. We **strongly**
recommend reading through the initial guides linked below 
([Getting Started](#getting-started)) to have the needed 
context for using the installation recipes and templates in this folder. 

## Recipe List

| Software Name | Apptainer | Docker | Local Install | HPC Spack | 
| :--- | :---: | :---: | :---: | :---: |
| [Alphafold](/software/AlphaFold) | X | - | - | - | 
| [Conda](/software/Conda) | X | X | - | - | 
| [Julia](/software/Julia) | X | - | - | - | 
| [Matlab](/software/Matlab) | X | X | - | - | 
| [PALM](/software/PALM) | X | - | - | - | 
| [Python](/software/Python) | X | X | - | - | 
| [PyTorch](/software/PyTorch) | X | - | - | - | 
| [R](/software/R) | X | - | - | - | 
| [SLEAP](/software/SLEAP) | X | - | - | - |
| [SUMO](/software/SUMO) | X | - | - | - | 

## Getting Started

If you are new to CHTC, we recommend going through these guides to orient yourself. 

### HTC (job submission with HTCondor)

- [Software Overview]() (*coming soon!*)
- [Container Hello World]() (*coming soon!*)

In general, for the HTC system, we recommend using containers (Docker or Apptainer)
when possible, with local installs as an alternative. 

### HPC (job submission with SLURM)

- [Software Overview](https://chtc.cs.wisc.edu/uw-research-computing/hpc-software)

In the tables above, Apptainer recipes, local installs or Spack installs should 
all work on the HPC cluster. At this time, Apptainer recipes are not guaranteed 
to work successfully across multiple nodes. 

## Other Related User Guides

### GPU templates (HTC System)

- [Template job submissions using GPUs in CHTC](https://github.com/CHTC/templates-GPUs)

### All HTC container guides

- [Using Apptainer Containers](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc)
- [Building Apptainer Containers](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-build)
- [Apptainer Advanced Example - SUMO](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc-advanced-example)
- [Using Software Installed in a Docker Container](https://chtc.cs.wisc.edu/uw-research-computing/docker-jobs)
- [Building a Docker Container Image](https://chtc.cs.wisc.edu/uw-research-computing/docker-build)
- [Explore and Test Docker Containers](https://chtc.cs.wisc.edu/uw-research-computing/docker-test)

### HPC Spack Guides

- [Install Software Using Spack](https://chtc.cs.wisc.edu/uw-research-computing/hpc-spack-install)

### HPC Container Guides

- [Use Apptainer Containers on HPC](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-hpc)
