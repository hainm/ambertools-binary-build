cd $AMBERHOME/AmberTools/src/netcdf-4.3.0
sh configure --enable-static --disable-netcdf-4 --prefix=$AMBERHOME --disable-dap --host x86_64-w64-mingw32
make install
cd $AMBERHOME
