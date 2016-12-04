set CC=gcc.exe
set CXX=g++.exe 
set FC=gfortran.exe

set AMBERHOME=%cd%
copy %RECIPE_DIR%\configure .
python update_amber --show-applied-patches
python update_amber --update
python update_amber --show-applied-patches
python configure --prefix=%AMBERHOME%
mingw32-make
mingw32-make install
xcopy /E %PREFIX%\bin %PREFIX%\Scripts\
if errorlevel 1 exit 1
