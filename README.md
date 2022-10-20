# Compute Canada Software stack
To run 

## Podman
```
podman run  --security-opt label=disable    --rm   --device /dev/fuse --cap-add SYS_ADMIN  -it  -v /tmp:/tmp  --mount type=volume,source=cache1,destination=/cvmfs-cache  poquirion/cc_software_stack
```

## docker 
```
docker run --rm   --device /dev/fuse --cap-add SYS_ADMIN  -v /tmp:/tmp -it -w $PWD -v $HOME:$HOME  -v $HOME/cvmfs_caches/:/cvmfs-cache/ poquirion/cc_software_stack
```
##singularity
```
singularity run  -S /var/run/cvmfs -B ~/cvmfs_cache:/cvmfs-cache --fusemount "container:cvmfs2 cvmfs-config.computecanada.ca /cvmfs/cvmfs-config.computecanada.ca"    --fusemount "container:cvmfs2 ref.mugqic /cvmfs/soft.computecanada.ca" docker://poquirion/cc_software_stack
```
