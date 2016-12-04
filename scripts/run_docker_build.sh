#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  AMBER_BUILD_TASK_CIRCLE='ambermini'
else
  AMBER_BUILD_TASK_CIRCLE=$1
fi

FEEDSTOCK_ROOT=$(cd "$(dirname "$0")/.."; pwd;)
echo "FEEDSTOCK_ROOT" $FEEDSTOCK_ROOT
DOCKER_IMAGE=ambermd/amber-build-box
BZ2FILE=/root/miniconda3/conda-bld/linux-64/amber*.tar.bz2

docker info

cat << EOF | docker run -i \
                        --rm \
                        -v ${FEEDSTOCK_ROOT}:/feedstock_root \
                        -a stdin -a stdout -a stderr \
                        $DOCKER_IMAGE \
                        bash || exit $?

# Embarking on 1 case(s).
    export PATH=/root/miniconda3/bin:\$PATH
    conda update --all --yes
    export AMBER_BUILD_TASK=$AMBER_BUILD_TASK_CIRCLE
    if [ "\$AMBER_BUILD_TASK" == "ambertools" ]; then
        # only build full AmberTools with py2.7 for now
        conda build /feedstock_root/recipe --py 2.7 --quiet || exit 1
    else
        conda build /feedstock_root/recipe --py 2.7 --quiet || exit 1
        conda build /feedstock_root/recipe --py 3.4 --quiet || exit 1
        conda build /feedstock_root/recipe --py 3.5 --quiet || exit 1
    fi
    cp $BZ2FILE /feedstock_root/
EOF
