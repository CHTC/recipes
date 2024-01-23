FROM ubuntu:22.04

RUN apt-get update -y
RUN apt-get install -y \
        git \
        cmake \
        python3 \
        g++ \
        libxerces-c-dev \
        libfox-1.6-dev \
        libgdal-dev \
        libproj-dev \
        libgl2ps-dev \
        python3-dev \
        swig \
        default-jdk \
        maven \
        libeigen3-dev

RUN git clone --recursive https://github.com/eclipse/sumo
RUN export SUMO_HOME=/sumo
RUN cd $SUMO_HOME \
    && cmake -B build . \
    && cmake --build build -j$(nproc)

ENV SUMO_HOME=/sumo
ENV PATH=/sumo/bin/:$PATH
