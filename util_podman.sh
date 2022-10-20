#! /bin/bash

podman run  --security-opt label=disable    --rm   --device /dev/fuse --cap-add SYS_ADMIN  -it  -v /tmp:/tmp  --mount type=volume,source=cache1,destination=/cvmfs-cache  $@
