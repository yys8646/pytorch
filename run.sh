#!/bin/bash
# bash run.sh -n project_name

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
           ${NAME:-"--name=pytorch"} \
           -e DISPLAY \
           -v=$HOME/.Xauthority:/root/.Xauthority:rw \
           -v=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --mount type=bind,source=${SOURCE:-$HOME/yys},target=${TARGET:-/home/yys} \
           --mount type=bind,source=/mnt/sdb1/data,target=/home/data \
           --gpus all \
           yys8646/miniconda3:4.7.10-ubuntu16.04-cuda9.0-cudnn7-jupyter \
           /bin/bash \
           -c "/opt/conda/bin/conda create -n pytorch pytorch=0.4.1 cuda90 -c pytorch -y"
