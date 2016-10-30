#!/bin/sh

source scripts/download_AT16.sh
tar -xf AmberTools16.tar.bz2 && cp -rf recipe-prebuild amber16/
osname=`python -c "import sys; print(sys.platform)"`
if [ $osname = 'linux' ]; then
    source run_docker_build.sh
else
    source run_oxs_build.sh
fi
