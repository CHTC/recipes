#!/bin/bash

# The following must always be first!
export HOME=$(pwd)
export NXF_APPTAINER_CACHEDIR=$HOME/.apptainer_cachedir
mkdir -p $NXF_APPTAINER_CACHEDIR

# Your Nextflow commands go here:
nextflow run main.nf -with-apptainer docker://ubuntu:22.04

# You may need to adjust your configuration to use Apptainer for your containers,
# as described here: https://www.nextflow.io/docs/latest/container.html#apptainer

# FINALLY, Remember to either
# a) move your results to the $HOME directory
# mv results/<path_to_desired_file(s)> $HOME/

# b) declare the results in "transfer_output_files" in the HTCondor submit file
# transfer_output_files = results/<path_to_desired_file(s)>

# c) compress the results dir
# tar -czf results.tar.gz results
