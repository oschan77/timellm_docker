#!/bin/bash

# Allow X server to be accessed from the local machine
xhost +local:

# Container name
CONTAINER_NAME="timellm"

# Run the Docker container
docker run -itd \
  --name=$CONTAINER_NAME \
  --user root \
  --network host \
  --ipc=host \
  -v ./Time-LLM:/home/Time-LLM \
  --privileged \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/etc/localtime:/etc/localtime:ro" \
  -v /dev/bus/usb:/dev/bus/usb \
  --device=/dev/dri \
  --group-add video \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --env="DISPLAY=$DISPLAY" \
  --gpus all \
  oschan77/lscm_timellm:latest \
  /bin/bash
