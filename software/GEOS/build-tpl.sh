#!/bin/bash

#SBATCH --partition=shared
#SBATCH --time=1-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=8000
#SBATCH --error=build-tpl.err
#SBATCH --output=build-tpl.out

export install_dir=/home/$USER/geos

module load cmake gcc openmpi

cd $install_dir/thirdPartyLibs
python scripts/config-build.py -hc ../GEOS/host-configs/spark-login.cmake -bt Release
cd build-spark-login-release
make
