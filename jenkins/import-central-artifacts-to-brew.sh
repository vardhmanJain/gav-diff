#!/bin/bash
input=$1
# this script needs to be run inside the below docker/podman container
# podman run -it --rm images.paas.redhat.com/dbruscin/rh-utility-scripts
# docker pull images.paas.redhat.com/dbruscin/rh-utility-scripts
# docker run --name mycontainer -d images.paas.redhat.com/dbruscin/rh-utility-scripts
while IFS= read -r line; do
    	./utility-scripts/mead/mead-download-and-import -v -t quarkus-3.8-maven-imports ${line} || true
        sleep 5
done < "$input"