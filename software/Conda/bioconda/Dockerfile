FROM condaforge/miniforge3:latest

RUN conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    conda config --set channel_priority strict && \
    conda install bwa samtools python=3.10 numpy=1.26 scipy seaborn
