# Provide the name of your own copy of FEBio (be sure to download the Linux version)
# Assumes the installer file is in the same directory as this file.
ARG FEBIO_INSTALLER="FEBioStudio_2.6_FEBio_4.6_linux-x64_installer2.run"


# Container build - don't touch unless you know what you are doing.
FROM hub.opensciencegrid.org/opensciencegrid/osgvo-ubuntu-20.04
COPY ${FEBIO_INSTALLER} /opt/
RUN export DEBIAN_FRONTEND=noninteractive \
    && mkdir /usr/share/desktop-directories/ \
    && chmod +x /opt/${FEBIO_INSTALLER} \
    && /opt/${FEBIO_INSTALLER} --mode unattended \
    && rm /opt/${FEBIO_INSTALLER}

ENV PATH="/opt/FEBioStudio/bin:$PATH"
