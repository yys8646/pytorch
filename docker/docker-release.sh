set -ex

# docker hub username
USERNAME=yys8646
# image name
IMAGE=pytorch

# bump version
# docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"

# run build
bash docker/build.sh

# docker
# tag it
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
