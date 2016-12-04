#!/bin/sh

if [ "$CICIRCLE_NODE_INDEX" == 0 ]; then
    bash scripts/run_docker_build.sh ambermini
fi
if [ "$CICIRCLE_NODE_INDEX" == 1 ]; then
    bash scripts/run_docker_build.sh ambertools
fi
