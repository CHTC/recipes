#!/bin/bash

# The following commands will be executed INSIDE of the running container
# Should have access to MPI and whatever other programs you installed.

# DO NOT USE mpirun/srun INSIDE OF THIS SCRIPT!


# If added commands to /etc/bashrc during container build, run this
# . /etc/bash

# Sleep to make sure all processes are alive; may not be necessary..
sleep 20s

# Optional debug statement
# cat << EOF
# ===${SLURM_NODEID}.${SLURM_PROCID}===
# $(type __program_name__)
# $PATH
# EOF 

# Execute parallel computing commands here >>>



