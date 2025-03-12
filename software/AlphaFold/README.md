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

# [Building Alphafold](/software/AlphaFold)

Instructions for building an Alphafold apptainer container 
using the [NMRBox 
repository](https://github.com/NMRbox/alphafold_singularity). 

## Disclaimer

Most of these instructions and examples were not produced by CHTC staff. We 
share them here as a starting point, but likely some work and iteration will 
need to be done before successfully running AlphaFold workloads. Please contact 
the facilitation team and come to office hours if you are struggling! 

## Build Notes

Prerequisites: CHTC account and `/staging` directory. 

1. **Start interactive job** Start an interactive build job. No input 
files are needed. **You should request at least 64GB of local disk space 
and 32GB of RAM.**

1. **Get installation files** Once the interactive job starts, clone
	the NMRBox repository and `cd` into the downloaded repository: 
	```
	$ git clone https://github.com/NMRbox/alphafold_singularity
	$ cd alphafold_singularity
	```

1. **Pick an Alphafold version** Run the `git branch` command to see 
	what versions of alphafold are available to build: 
	```
	$ git branch -a
	```
	Check out a version to use for the build by using `git checkout`, 
	for example: 
	```
	$ git checkout origin/v2.3.1
	```

1. **Set environment** Before building, set the following environment 
	variables: 
	```
	$ export TMPDIR=$PWD
	$ export APPTAINER_CACHEDIR=$PWD
	```

1. **Build container** The Alphafold container is built in two stages. 
	Run the following two commands
	```
	$ apptainer build base.sif base.def
	$ apptainer build alphafold.sif alphafold.def
	```

1. **Move container to staging** Once the build has complete, move the 
	final container to your personal or group staging folder: 
	```
	$ mkdir /staging/$USER/alphafold
	$ mv alphafold.sif /staging/$USER/alphafold
	```

1. **Exit interactive job** 

## Using the Container to Run AlphaFold Jobs

As described in our 
[apptainer guide](https://chtc.cs.wisc.edu/uw-research-computing/apptainer-htc), move 
the built container to your `/staging` folder and modify the `container_image` path 
in the [sample submit file](alphafold-example/alphafold.submit)
