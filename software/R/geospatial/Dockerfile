FROM rocker/geospatial:4.3.1

RUN cat <<EOF > /opt/install.R
pkgs <- c('cowsay','fortunes')
install.packages(pkgs, dependencies=TRUE, repos='http://cran.rstudio.com/')
EOF

RUN Rscript /opt/install.R