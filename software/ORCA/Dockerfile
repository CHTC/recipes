FROM ubuntu:24.04

# *Use the version named in your ORCA tarball file!*
# E.g., orca_6_1_1_linux_x86-64_shared_openmpi418.tar.xz -> OpenMPI 4.1.8
ARG OPENMPI_VERSION=4.1.8

# Prevents apt from stopping to ask interactive questions during the build
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for OpenMPI and ORCA
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        curl \
        tar \
        bzip2 \
        xz-utils \
        build-essential \
        gcc \
        g++ \
        gfortran \
        libgomp1 \
        libgfortran5 \
        zlib1g-dev \
        libstdc++6 \
        libgcc-s1 \
    && rm -rf /var/lib/apt/lists/*

# Build OpenMPI from source

# Working directory just for the OpenMPI build — gets deleted afterward
WORKDIR /tmp/openmpi

RUN set -eux; \
    # OpenMPI's download URLs are organized by major.minor series (e.g. v4.1),
    # so we derive that from the full version number (4.1.8 -> 4.1)
    OPENMPI_SERIES=$(echo ${OPENMPI_VERSION} | cut -d. -f1,2); \
    # download the exact OpenMPI source tarball
    wget -q https://download.open-mpi.org/release/open-mpi/v${OPENMPI_SERIES}/openmpi-${OPENMPI_VERSION}.tar.gz; \
    tar -xzf openmpi-${OPENMPI_VERSION}.tar.gz; \
    cd openmpi-${OPENMPI_VERSION}; \
    # install into /opt/openmpi (kept separate from system paths);
    # Fortran MPI bindings disabled since ORCA doesn't need them
    ./configure --prefix=/opt/openmpi --disable-mpi-fortran; \
    # -j"$(nproc)" uses all available CPU cores to speed up the compile
    make -j"$(nproc)"; \
    make install; \
    cd /; \
    # remove the build directory now that OpenMPI is installed, to keep image size down
    rm -rf /tmp/openmpi

# NOTE: ORCA itself is intentionally NOT installed here.
