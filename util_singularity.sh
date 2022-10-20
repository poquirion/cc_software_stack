#! /bin/bash

singularity run  -S /var/run/cvmfs -B ~/cvmfs_cache:/cvmfs-cache --fusemount "container:cvmfs2 cvmfs-config.computecanada.ca /cvmfs/cvmfs-config.computecanada.ca"    --fusemount "container:cvmfs2 ref.mugqic /cvmfs/soft.computecanada.ca" ${args}
