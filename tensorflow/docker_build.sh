#!/bin/bash
set -x

VER=3.6.0
DOCKERFILE=Dockerfile.rhel

# Start with the image which has the cuda drivers in it
echo 'FROM quay.io/danclark/cuda-10.1:168-1' > ${DOCKERFILE}

# Add the base R packages without the FROM or CMD options
# Also remove the epel lines and any yum updates which will break the build or update cuda libraries
# that we don't want to update right now
cat ../r-ver/Dockerfile.rhel | grep -v FROM | grep -v CMD | grep -v 'epel-release-latest' | grep -v 'yum -y update' >> ${DOCKERFILE}

# Add the rstudio config without the FROM option
cat ../rstudio/Dockerfile.rhel | grep -v FROM >> ${DOCKERFILE}

sudo podman build -t quay.io/rocker/tensorflow-gpu:rhel7-${VER} -f ./Dockerfile.rhel .

