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

# Update these paths to your desired locations
container_path="/home/$USER/containers/multi-node.sif"
executable_path="${PWD}/multi-node.sh"
# Make sure that "executable_path" is located in one of the
# "--bind" directories listed below!

# Set up for container execution:

# If single node, use
# export TMPDIR=/local/$USER/apptainer_tmp/${SLURM_JOB_ID}

# If multi-node, use
export TMPDIR=/scratch/$USER/apptainer_tmp/${SLURM_JOB_ID}

# You shouldn't need to edit any of the following >>>

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
    $container_path $executable_path

# Clean up the temp directory
rm -rf $TMPDIR

