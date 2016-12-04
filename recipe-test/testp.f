program testf
  use netcdf
  write(6,*) nf90_strerror(0)
  write(6,*) 'testing a Fortran program'
end program testf
