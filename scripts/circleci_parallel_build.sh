#!/bin/sh

if [ "$CICIRCLE_NODE_INDEX" == 0 ]; then
    sh scripts/run_docker_build.sh ambermini
fi
if [ "$CICIRCLE_NODE_INDEX" == 1 ]; then
    sh scripts/run_docker_build.sh ambertools
fi
