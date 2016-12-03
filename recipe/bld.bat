where gcc.exe
where make
where mingw32-make
where python
set AMBERHOME=%cd%
copy %RECIPE_DIR%\configure2 %AMBERHOME%\AmberTools\src\
python update_amber --show-applied-patches
python update_amber --update
python update_amber --show-applied-patches
echo n | bash .\configure -noX11 --with-python C:\Miniconda3\python.exe -windows gnu
mingw32-make
mingw32-make install
xcopy /E %PREFIX%\bin %PREFIX%\Scripts\
if errorlevel 1 exit 1
