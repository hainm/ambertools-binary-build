#!/bin/sh

osname=`python -c 'import sys; print(sys.platform)'`
export AMBERHOME=`pwd`
if [ $osname = 'linux']; then
    yes | ./configure -noX11 -nofftw3 gnu
else
    yes | ./configure -noX11 -macAccelerate clang
fi
source amber.sh
make install -j4
cp $AMBERHOME/bin/* $PREFIX/bin/
cp -rf $AMBERHOME/lib/* $PREFIX/lib/
mkdir $PREFIX/dat/ && cp -rf $AMBERHOME/dat/* $PREFIX/dat/
