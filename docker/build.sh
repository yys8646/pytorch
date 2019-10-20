set -ex

# docker hub username
USERNAME=yys8646
# image name
IMAGE=pytorch

docker build -t $USERNAME/$IMAGE:0.4_cuda9_cudnn7 docker
