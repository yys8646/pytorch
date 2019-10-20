#!/bin/bash
# bash run.sh -n project_name -s /home/mlg/yys -t /home/yys -c /bin/bash

while getopts rn: option
do
case ${option}
in
r) REMOVE='--rm' ;;
n) NAME='--name='${OPTARG} ;;
esac
done

docker run ${REMOVE} \
           -it \
           --net host \
           ${NAME:-"--name=pytorch0.4"} \
           -e DISPLAY \
           -v=$HOME/.Xauthority:/root/.Xauthority:rw \
           -v=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --mount type=bind,source=${SOURCE:-$HOME/yys},target=${TARGET:-/yys} \
           --mount type=bind,source=/mnt/sdb1/data,target=/data \
           --gpus all \
           pytorch/pytorch:0.4_cuda9_cudnn7 \
           /bin/bash
