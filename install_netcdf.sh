cd $AMBERHOME
mkdir lib
mkdir include
mkdir bin
cd $AMBERHOME/AmberTools/src/netcdf-4.3.0
sh configure --enable-static --disable-netcdf-4 --prefix=$AMBERHOME --disable-dap
make install
cd $AMBERHOME
