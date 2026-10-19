set( CONFIG_NAME "spark-login" )

# Set compilers path
set(CMAKE_C_COMPILER "/software/chtc/el9/spack_v22/software/linux-centos9-zen3/gcc-11.4.1/gcc-13.2.0-kpl6n57i2qm3j2jdpxuifjl54nnrodfo/bin/gcc" CACHE PATH "")   # This is typically something like /usr/bin/gcc ... or clang
set(CMAKE_CXX_COMPILER "/software/chtc/el9/spack_v22/software/linux-centos9-zen3/gcc-11.4.1/gcc-13.2.0-kpl6n57i2qm3j2jdpxuifjl54nnrodfo/bin/g++" CACHE PATH "") # This is typically something like /usr/bin/g++ ... or clang++
set(ENABLE_FORTRAN OFF CACHE BOOL "" FORCE)

# Set paths to mpi
set(ENABLE_MPI ON CACHE PATH "")
set(MPI_C_COMPILER "/software/chtc/el9/spack_v22/software/linux-centos9-zen3/gcc-13.2.0/openmpi-5.0.3-afcqsnihyo5jvnhepiwqianpo5nwwdci/bin/mpicc" CACHE PATH "")    # This is typically something like /usr/bin/mpicc
set(MPI_CXX_COMPILER "/software/chtc/el9/spack_v22/software/linux-centos9-zen3/gcc-13.2.0/openmpi-5.0.3-afcqsnihyo5jvnhepiwqianpo5nwwdci/bin/mpicxx" CACHE PATH "") # This is typically something like /usr/bin/mpicxx
set(MPIEXEC "/software/chtc/el9/spack_v22/software/linux-centos9-zen3/gcc-13.2.0/openmpi-5.0.3-afcqsnihyo5jvnhepiwqianpo5nwwdci/bin/mpirun" CACHE PATH "")          # This is typically something like /usr/bin/mpirun

# Set paths to blas and lapack
set( BLAS_LIBRARIES "/lib64/libblas.so" CACHE PATH "" FORCE )     # This is typically something like /usr/lib64/libblas.so
set( LAPACK_LIBRARIES "/lib64/liblapack.so" CACHE PATH "" FORCE ) # This is typically something like /usr/lib64/liblapack.so

# Cuda and openMP
set( ENABLE_CUDA OFF CACHE PATH "" FORCE )
set( ENABLE_OPENMP OFF CACHE PATH "" FORCE )

# TPLs
set( CMAKE_POSITION_INDEPENDENT_CODE ON CACHE BOOL "" FORCE )
set( ENABLE_TRILINOS OFF CACHE PATH "" FORCE )
set( ENABLE_HYPRE OFF CACHE BOOL "" FORCE )
set( ENABLE_HYPREDRV OFF CACHE BOOL "" )
set( ENABLE_CALIPER OFF CACHE PATH "" FORCE )
set( ENABLE_DOXYGEN OFF CACHE BOOL "" FORCE)
set( ENABLE_MATHPRESSO OFF CACHE BOOL "" FORCE )

set(HYPRE_CMAKE_ARGS
    "-DCMAKE_BUILD_TYPE=Release"
    "-DHYPRE_ENABLE_SHARED=OFF"
    "-DCMAKE_POSITION_INDEPENDENT_CODE=ON"
    "-DCMAKE_C_FLAGS=-fPIC"
    "-DCMAKE_CXX_FLAGS=-fPIC"
)

if(NOT ( EXISTS "${GEOS_TPL_DIR}" AND IS_DIRECTORY "${GEOS_TPL_DIR}" ) )
   set(GEOS_TPL_DIR "${CMAKE_SOURCE_DIR}/../../thirdPartyLibs/install-${CONFIG_NAME}-release" CACHE PATH "" FORCE )
endif()

include(${CMAKE_CURRENT_LIST_DIR}/tpls.cmake)
