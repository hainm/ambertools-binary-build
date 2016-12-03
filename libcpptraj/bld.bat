
bash configure --with-zlib=%PYTHON% --with-bzlib=%PYTHON% --with-netcdf=%PYTHON% -nomathlib -nobzlib -nonetcdf gnu
mingw32-make install
