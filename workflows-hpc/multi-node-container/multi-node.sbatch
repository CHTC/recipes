#!/bin/bash

# walltime:
#SBATCH --time=0-02:00:00

# resources:
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=32
#SBATCH --ntasks=64
#SBATCH --mem-per-cpu=4000

# partition (shared is for general use):
#SBATCH --partition=shared

# job name:
#SBATCH -J multi-node-container

# stdout, stderr: 
#SBATCH -o multi-node-container.out
#SBATCH -e multi-node-container.err

# Set up for container execution:

# If single node, use
# export TMPDIR=/local/$USER/apptainer_tmp/${SLURM_JOB_ID}

# If multi-node, use
export TMPDIR=/scratch/$USER/apptainer_tmp/${SLURM_JOB_ID}

# Make corresponding temp directory
mkdir -p $TMPDIR

# Execute main script inside of container across node(s):

# The --export=NONE option ensures that ONLY SLURM/MPI/PMIX environment
# variables are passed inside of the container (prevents collisions with system variables)
srun --mpi=pmix --export=NONE \
    /usr/bin/apptainer exec \
    --bind /home/$USER \
    --bind /scratch/$USER \
    --bind $TMPDIR \
    --bind $PWD \
    -W $PWD \
    multi-node.sif $PWD/multi-node.sh

# Clean up the temp directory
rm -rf $TMPDIR

