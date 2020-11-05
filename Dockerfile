FROM rocker/r-ver:4.0.0

RUN apt-get update && apt-get install -yq \
    libfreetype6-dev \
    libglu1-mesa-dev \
    libnetcdf-dev \
    libpng-dev \
    zlib1g-dev \
    libxml2-dev \
    libglpk-dev \
    && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN Rscript \
    -e 'install.packages("devtools", dependencies=TRUE, ask=FALSE)' \
    -e 'library(devtools)' \
    -e 'install_github("cbroeckl/RAMClustR", build_vignettes = TRUE, dependencies = TRUE, ask=FALSE)'