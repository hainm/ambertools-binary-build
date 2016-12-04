gcc -fPIC  -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE  -o testp testp.c
g++ -fPIC  -o testp testp.cpp
gfortran -fPIC  -O0 -o testp testp.f
gcc -fPIC  -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE  -c -o testp.c.o testp.c
gfortran -fPIC  -O0 -c -o testp.f.o testp.f
gcc -fPIC  -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -o testp testp.c.o testp.f.o -lgfortran -w
gcc -fPIC  -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE  -o test_pointer_size test_pointer_size.c
