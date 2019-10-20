version=`cat VERSION`
echo "version: $version"

git pull

git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push https://github.com/yys8646/pytorch.git
git push --tags https://github.com/yys8646/pytorch.git

if [ -r docker ]; then
  echo "bash docker/docker-release.sh"
  bash docker/docker-release.sh
fi
