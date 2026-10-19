#!/bin/bash

#SBATCH --partition=shared
#SBATCH --time=1-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=8000
#SBATCH --error=build-hypredrive.err
#SBATCH --output=build-hypredrive.out

export install_dir=$HOME/geos

module load cmake gcc openmpi

# Build hypre with BIGINT, SuperLU_dist
cd $install_dir/hypre/build
cmake ../src \
  -DCMAKE_BUILD_TYPE=Release \
  -DHYPRE_ENABLE_SHARED=OFF \
  -DHYPRE_ENABLE_BIGINT=ON \
  -DHYPRE_ENABLE_DSUPERLU=ON \
  -DTPL_DSUPERLU_LIBRARIES="$install_dir/thirdPartyLibs/install-spark-login-release/superlu_dist/lib/libsuperlu_dist.a;$install_dir/thirdPartyLibs/install-spark-login-release/parmetis/lib/libparmetis.a;$install_dir/thirdPartyLibs/install-spark-login-release/metis/lib/libmetis.a;/lib64/libblas.so;/lib64/liblapack.so" \
  -DTPL_DSUPERLU_INCLUDE_DIRS="$install_dir/thirdPartyLibs/install-spark-login-release/superlu_dist/include" \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_C_FLAGS="-fPIC" \
  -DCMAKE_CXX_FLAGS="-fPIC" \
  -DCMAKE_INSTALL_PREFIX="$install_dir/thirdPartyLibs/install-spark-login-release/hypre"
make
make install

# Build hypredrive
cd $install_dir/hypredrive
rm -rf build
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="$install_dir/thirdPartyLibs/install-spark-login-release/hypredrive" \
      -DCMAKE_C_FLAGS="-fPIC" \
      -DCMAKE_CXX_FLAGS="-fPIC" \
      -DHYPRE_ROOT="$install_dir/thirdPartyLibs/install-spark-login-release/hypre" \
      -DHYPRE_DIR="$install_dir/thirdPartyLibs/install-spark-login-release/hypre/lib64/cmake/HYPRE" \
      -B build -S .
cmake --build build --parallel
cmake --install build

