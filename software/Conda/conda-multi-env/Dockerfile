FROM continuumio/miniconda3:latest

# create the first environment
RUN . activate \
    && conda create -y -n my-first-env python=3.10 \
    && conda activate my-first-env \
    && conda install -y numpy pandas \
    && conda deactivate

# create the second environment
RUN . activate \
    && conda create -y -n my-second-env python=3.6 \
    && conda activate my-second-env \
    && conda install -y numpy scipy \
    && conda deactivate