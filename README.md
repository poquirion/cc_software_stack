# Compute Canada Software stack
The container loads the AVX2 achitecture version of the stack by default. To load another architecture, for example avx512, set it in the envirionement of the container at startup with the `--env RSNT_ARCH=avx512`  
option. The option is valid for all the container system flavors.
## Podman
```
podman run  --security-opt label=disable    --rm   --device /dev/fuse --cap-add SYS_ADMIN  -it  -v /tmp:/tmp  --mount type=volume,source=cache1,destination=/cvmfs-cache  poquirion/cc_software_stack
```

## Singularity
```
singularity run  -S /var/run/cvmfs -B ~/cvmfs_cache:/cvmfs-cache --fusemount "container:cvmfs2 cvmfs-config.computecanada.ca /cvmfs/cvmfs-config.computecanada.ca"    --fusemount "container:cvmfs2 soft.computecanada.ca /cvmfs/soft.computecanada.ca" docker://poquirion/cc_software_stack
```

## Docker 
```
docker run --rm   --device /dev/fuse --cap-add SYS_ADMIN  -v /tmp:/tmp -it -w $PWD -v $HOME:$HOME  -v $HOME/cvmfs_caches/:/cvmfs-cache/ poquirion/cc_software_stack
```

