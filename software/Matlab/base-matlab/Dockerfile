FROM mathworks/matlab-deps:r2022b

# ================== #
# | Quick Settings | #
# ================== #

# Value of MATLAB_RELEASE must match the version of the container in the "FROM" line above
# Value of MATLAB_PRODUCT_LIST is a space-delimited list following the format of
#     https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/mpm-input-files/R2022b/mpm_input_r2022b.txt
# However, only features listed here are explicitly licensed for use on CHTC:
#     https://raw.githubusercontent.com/CHTC/recipes/main/software/Matlab/chtc_licensed_toolboxes.txt

ENV MATLAB_RELEASE=r2022b
ENV MATLAB_PRODUCT_LIST="MATLAB"

# ========================= #
# | Installation Commands | #
# ========================= #

# Adapted from https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/Dockerfile
#    (2023-12-04)

# Installing dependencies, QOL packages
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        curl \
        git \
        nano \
        tar \
        unzip \
        vim \
        wget && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Downloading and running MPM
ENV MATLAB_INSTALL_LOCATION="/opt/matlab/${MATLAB_RELEASE}"

RUN wget -q https://www.mathworks.com/mpm/glnxa64/mpm && \
    chmod +x mpm && \
    ./mpm install \
        --release=${MATLAB_RELEASE} \
        --destination=${MATLAB_INSTALL_LOCATION} \
        --products ${MATLAB_PRODUCT_LIST} \
        || (echo "MPM Installation Failure. See below for more information:" && cat /tmp/mathworks_root.log && false) && \
    rm -f mpm /tmp/mathworks_root.log && \
    ln -s ${MATLAB_INSTALL_LOCATION}/bin/matlab /usr/local/bin/matlab

# Linked Dockerfile above says to add "matlab" user and grant sudo permission, but neither
# of those things is compatible with the HTC system, so skipping.

# FOR USE ON CHTC ONLY >>>
RUN mkdir -p ${MATLAB_INSTALL_LOCATION}/licenses && \
    echo '# CHTC Network License file for using MATLAB' >> ${MATLAB_INSTALL_LOCATION}/licenses/network.lic && \
    echo 'SERVER matlab.chtc.wisc.edu 27000' >> ${MATLAB_INSTALL_LOCATION}/licenses/network.lic && \
    echo 'USE_SERVER' >> ${MATLAB_INSTALL_LOCATION}/licenses/network.lic
# <<< FOR USE ON CHTC ONLY
