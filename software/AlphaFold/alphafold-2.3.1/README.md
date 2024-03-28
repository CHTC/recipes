# [Building Alphafold](/software/AlphaFold/build)

Instructions for building an Alphafold apptainer container 
using the [NMRBox 
repository](https://github.com/NMRbox/alphafold_singularity). 

### Build Notes

Prerequisites: CHTC account and `/staging` directory. 

1. **Start interactive job** Start an interactive build job. No input 
files are needed. You should request at least 64GB of local disk space 
and 32GB of RAM. 

1. **Get installation files** Once the interactive job starts, clone
the NMRBox repository and `cd` into the downloaded repository: 
```
$ git clone https://github.fcom/NMRbox/alphafold_singularity
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
