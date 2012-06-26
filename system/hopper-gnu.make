
# use this prefix (set from the command line) to update the 
# live hpcports install used by many people
#
# export HPCP_PREFIX=/project/projectdirs/cmb/modules/hopper/hpcports_gnu

# software download location

POOL = /project/projectdirs/cmb/modules/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = FALSE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = cmb
INST_PERM = g+rwX,o+rX

# serial compilers

CC = cc
CXX = CC
F77 = ftn
FC = ftn

# MPI compilers

MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn

# compile flags

CFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
CXXFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
FFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG
FCFLAGS = -O3 -march=native -m64 -static -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FLIBS = /opt/gcc/4.6.3/snos/lib64/libgfortran.a
FCLIBS = /opt/gcc/4.6.3/snos/lib64/libgfortran.a
MPIFCLIBS =

# Linking

LIBS = -L/opt/acml/4.4.0/gfortran64_mp/lib -lacml_mp /opt/gcc/4.6.3/snos/lib64/libgomp.a /usr/lib64/librt.a
LDFLAGS = /opt/gcc/4.6.3/snos/lib64/libgomp.a /usr/lib64/librt.a

# vendor math libraries

VENDOR = amd
AMD_CPPFLAGS = -I$(ACML_DIR)/gfortran64_mp/include
AMD_LDFLAGS = -L$(ACML_DIR)/gfortran64_mp/lib
AMD_LIBS_CC = -lacml_mp -lacml_mv /opt/gcc/4.6.3/snos/lib64/libgfortran.a /opt/gcc/4.6.3/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_CXX = -lacml_mp -lacml_mv /opt/gcc/4.6.3/snos/lib64/libgfortran.a /opt/gcc/4.6.3/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_F77 = -lacml_mp -lacml_mv /opt/gcc/4.6.3/snos/lib64/libgfortran.a /opt/gcc/4.6.3/snos/lib64/libgomp.a /usr/lib64/librt.a
AMD_LIBS_FC = -lacml_mp -lacml_mv /opt/gcc/4.6.3/snos/lib64/libgfortran.a /opt/gcc/4.6.3/snos/lib64/libgomp.a /usr/lib64/librt.a

# package overrides

fftw_OVERRIDE = TRUE
fftw_PREFIX = /opt/fftw/$(FFTW_VERSION)
fftw_VERSION = 3.2.2.1

