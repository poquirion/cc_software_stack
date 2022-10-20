FROM centos:7.9.2009
MAINTAINER P-O Quirion po.quirion@mcgill.ca

WORKDIR /tmp

# All yum cmd

ENV CVMFS_VERSION latest
ENV CC_STACK latest
RUN yum install -y https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-${CVMFS_VERSION}.noarch.rpm \
             https://package.computecanada.ca/yum/cc-cvmfs-public/prod/RPM/computecanada-release-${CC_STACK}.noarch.rpm
RUN yum update -y \
  && yum install -y ImageMagick pigz which wget unzip.x86_64 make.x86_64 gcc expectk file \
  dejagnu less tcl-devel.x86_64 cvmfs-config-computecanada \
  cvmfs-fuse3 cvmfs-config-default \
  && yum clean all

RUN mkdir /cvmfs-cache  && chmod 777 /cvmfs-cache  /cvmfs
RUN mkdir /cvmfs/soft.computecanada.ca/ /cvmfs/cvmfs-config.computecanada.ca

# CVMFS
ADD default.local /etc/cvmfs/default.local

ADD z-00-computecanada.sh    /etc/profile.d/z-00-computecanada.sh

#docker build --tag cc_stack -f Dockerfile . && singularity build -F ../cc_stack.sif docker-daemon://ccstack
