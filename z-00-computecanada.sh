mount -l  | grep soft.computecanada.ca 2>/dev/null 1>&2
retcode=$?
if [ ${retcode} -ne 0 ] ; then
   # should only run in docker container, not singularity
   mount -t cvmfs cvmfs-config.computecanada.ca /cvmfs/cvmfs-config.computecanada.ca/
   mount -t cvmfs soft.computecanada.ca /cvmfs/soft.computecanada.ca
fi

if [ -z "${RSNT_ARCH+x}" ]; then
    export RSNT_ARCH=avx2
fi 

export FORCE_CC_CVMFS=1
export RSNT_ENABLE_LMOD_CACHE=yes
. /cvmfs/soft.computecanada.ca/config/profile/bash.sh
