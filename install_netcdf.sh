# c
cd $AMBERHOME/AmberTools/src/netcdf-4.3.0
sh configure --enable-static --disable-netcdf-4 --prefix=/usr/local --disable-dap --host x86_64-w64-mingw32
make install
make check

# fortran
cd $AMBERHOME/AmberTools/src/netcdf-fortran-4.2
# The NetCDF Fortran config script will need access to the C library.
export LD_LIBRARY_PATH="$AMBERHOME/lib:$LD_LIBRARY_PATH"
echo "\tConfiguring NetCDF Fortran interface (may be time-consuming)...\n"
export CPPFLAGS=-I/usr/local/include
export LDFLAGS=-L/usr/local/lib
echo $CPPFLAGS $LDFLAGS
sh configure --enable-static --disable-netcdf-4 --prefix=/usr/local --disable-dap --host x86_64-w64-mingw32
make install
make check

cd $AMBERHOME
