FROM rocker/r-ver:4.4.2

# Make sure the version above matches the version of R you used to generate the renv.lock file!

# DO NOT EDIT THE FOLLOWING (unless you know what you are doing..)

# Making sure the necessary directories exist
RUN mkdir -p /opt/renv

# Copying over necessary files into the correct locations
# Contains your package names and versions
COPY renv.lock /opt/renv.lock
# These files are needed by renv
COPY activate.R /opt/renv/activate.R
COPY settings.json /opt/renv/settings.json

# Adjusting settings for renv to work correctly in the container
ENV RENV_PATHS_LIBRARY=/opt/renv/library
ENV RENV_PROJECT=/opt
# (This disables an unhelpful warning message)
ENV RENV_CONFIG_SYNCHRONIZED_CHECK=false

# Setup renv and install your required packages
#   1. Make sure that renv is loaded whenever you use R/Rscript
#   2. Move to the directory with the renv.lock file
#   3. Install packages listed in the lock file using the restore command
RUN echo "source('/opt/renv/activate.R')" >> /usr/local/lib/R/etc/Rprofile.site \
    && cd /opt \
    && R -e "renv::restore()"