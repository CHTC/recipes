#!/bin/bash

#SBATCH --partition=shared
#SBATCH --time=1-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=8000
#SBATCH --error=build-geos.err
#SBATCH --output=build-geos.out

export install_dir=$HOME/geos

module load cmake gcc openmpi
cd $install_dir/GEOS
python scripts/config-build.py \
  -hc host-configs/spark-login.cmake \
  -bt Release \
  -DGEOS_TPL_DIR="$install_dir/thirdPartyLibs/install-spark-login-release" \
  -DHYPRE_DIR="$install_dir/thirdPartyLibs/install-spark-login-release/hypre" \
  -DHYPREDRV_DIR="$install_dir/thirdPartyLibs/install-spark-login-release/hypredrive"
cd build-spark-login-release
make -j4
make install
