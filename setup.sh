#!/bin/sh

source scripts/download_AT16.sh
tar -xf AmberTools16.tar.bz2 && cp -rf recipe-prebuild amber16/
is_linux=`python -c "import sys; print('linux' in sys.platform)"`
if [ $is_linux = 'True' ]; then
    source run_docker_build.sh
else
    source run_oxs_build.sh
fi
