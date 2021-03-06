
HPCP_PREFIX = /proj/planck/software/hpcports_gnu

# OS environment version
#
# For sisu, bump the major version when upgrading compilers and bump
# the minor version when upgrading MPI or vendor libs.  Document configuration
# here:
#
# 1.0 :  gnu 4.7.3, cray-mpich2 5.6.5, mkl-13.5.192
# 2.0 :  gnu 4.8.1, cray-mpich2 6.0.2, craype 1.06, mkl 13.5.192
# 3.0 :  gnu 4.8.2, cray-mpich 6.2.1, craype 2.04, libsci 12.1.3
# 4.0 :  gnu 4.8.2, cray-mpich 6.3.0, craype 2.1.0, libsci 12.2.0, fftw/3.3.0.4
# 5.0 :  gnu 4.9.0, cray-mpich 7.0.0, craype 2.1.2, libsci 13.0.0, mkl-13
# 5.1 :  gnu 4.9.0, cray-mpich 7.0.1, craype 2.1.3, libsci 13.0.0, mkl-13
# 6.0 :  gnu 5.3.0, cray-mpich 7.3.3, craype 2.5.4, libsci 16.03.1, mkl-13
#

HPCP_ENV = 6.0

HPCP_CROSS_HOST =
BUILD_CC = gcc
BUILD_CXX = g++
BUILD_FC = gfortran
BUILD_F77 = gfortran

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /proj/planck/software/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu
BUILD_DYNAMIC = TRUE

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = project_2000334
INST_PERM = g+rwX,o+rX

# serial compilers

CC = cc
CXX = CC
F77 = ftn
FC = ftn

# MPI compilers

openmpi_OVERRIDE = TRUE
openmpi_VERSION = cray.mpich
MPICC = cc
MPICXX = CC
MPIF77 = ftn
MPIFC = ftn
MPILIBS = -lmpich
MPICXXLIBS = -lmpichcxx

# compile flags

CFLAGS = -O3 -m64 -fPIC -DNDEBUG -fgnu89-inline
CXXFLAGS = -O3 -m64 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -m64 -fPIC -DNDEBUG
FCFLAGS = -O3 -m64 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing
FLIBS = -lgfortran
FCLIBS = -lgfortran
MPIFCLIBS =

# Linking

LIBS = -lpthread -lm
LDFLAGS =

# vendor math libraries

VENDOR = intel
INTEL_PREFIX = /opt/intel/composer_xe_2016.2.181
INTEL_INCLUDE = $(INTEL_PREFIX)/mkl/include
INTEL_LIBDIR = $(INTEL_PREFIX)/mkl/lib/intel64
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -fopenmp -lpthread -lm
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

git_OVERRIDE = TRUE
git_VERSION = 2.1.0

openssl_OVERRIDE = TRUE
openssl_VERSION = 0.9.8j

curl_OVERRIDE = TRUE
curl_VERSION = 7.19.7

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.5.5

tk_OVERRIDE = TRUE
tk_VERSION = 8.5.5

termcap_OVERRIDE = TRUE
termcap_VERSION = 2.0.8

readline_OVERRIDE = TRUE
readline_VERSION = 5.2

gzip_OVERRIDE = TRUE
gzip_VERSION = 1.3.12

gettext_OVERRIDE = TRUE
gettext_VERSION = 0.17.0

#python_OVERRIDE = TRUE
#python_SITE = python2.7
#python_VERSION = 2.7.9

cmake_OVERRIDE = TRUE
cmake_VERSION = 3.2.3

#nose_OVERRIDE = TRUE
#nose_VERSION = NA

#numpy_OVERRIDE = TRUE
#numpy_VERSION = 1.9.1

#scipy_OVERRIDE = TRUE
#scipy_VERSION = 0.14.0

pyfits_OVERRIDE = TRUE
pyfits_VERSION = NA

#ipython_OVERRIDE = TRUE
#ipython_VERSION = NA

#matplotlib_OVERRIDE = TRUE
#matplotlib_VERSION = 1.4.2

#mpi4py_OVERRIDE = TRUE
#mpi4py_VERSION = 1.3

#pyslalib_OVERRIDE = TRUE
#pyslalib_VERSION = NA

scientific_OVERRIDE = TRUE
scientific_VERSION = NA

#healpy_OVERRIDE = TRUE
#healpy_VERSION = NA

numexpr_OVERRIDE = TRUE
numexpr_VERSION = NA

#setuptools_OVERRIDE = TRUE
#setuptools_VERSION = NA

# pkg-config already works

pkgconfig_OVERRIDE = TRUE
pkgconfig_VERSION = sys

# we get BLAS, Lapack, and ScaLapack from Cray libsci

blas_OVERRIDE = TRUE
blas_VERSION = 16.03.1
blas_LIBS_CC =
blas_LIBS_CXX = $(blas_LIBS_CC)
blas_LIBS_FC = $(blas_LIBS_CC)
blas_LIBS_F77 = $(blas_LIBS_CC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 16.03.1

scalapack_OVERRIDE = TRUE
scalapack_VERSION = 16.03.1

