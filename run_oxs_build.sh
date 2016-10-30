#!/usr/bin/env bash

brew tap homebrew/science;
brew update;
brew install netcdf fftw;
BZ2FILE=$HOME/miniconda/conda-bld/*/ambertools-16-1.tar.bz2
wget http://repo.continuum.io/miniconda/Miniconda-3.7.0-MacOSX-x86_64.sh -O miniconda.sh
bash miniconda.sh -b
export PATH=$HOME/miniconda/bin:\$PATH
conda update --yes --all
conda install --yes conda-build
conda info
conda build amber16/recipe-prebuild --quiet || exit 1
cp $BZ2FILE .
