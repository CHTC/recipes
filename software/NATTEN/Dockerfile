FROM nvcr.io/nvidia/pytorch:26.03-py3

# Using NVIDIA for CUDA/hardware interoperability.
# But NVIDIA is using a custom build of PyTorch.
# Therefore, need to build `libnatten` from scratch.
# To do that, need cmake.
# But there are broken pointers..

# Remove broken pointers
# and make sure cmake, build things are installed
RUN python3 -m pip uninstall -y cmake ninja && \
    rm -f /usr/local/bin/cmake /usr/local/bin/ninja /usr/local/bin/cmake-gui && \
    apt-get update && \
    apt-get install -y cmake ninja-build build-essential && \
    python3 -m pip install cmake ninja setuptools packaging 

    # Install NATTEN (triggers automatic compile of `libnatten`)
    # and specify compute capability for A100, L40, and H200 generation cards
RUN export NATTEN_CUDA_ARCH="8.0;8.9;9.0" && \
    python3 -m pip install natten==0.21.6 --no-build-isolation --no-cache-dir --verbose

