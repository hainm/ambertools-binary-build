#!/bin/sh

git clone https://github.com/amber-md/pytraj
cd pytraj
git clone https://github.com/amber-md/cpptraj
cd tests
docker run -t my_image nosetests -vs .