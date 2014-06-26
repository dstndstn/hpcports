
HPCP_PREFIX = /planck/tools/hpcports

# OS environment version
#
# For carver, bump the major version when upgrading compilers and bump
# the minor version when upgrading MKL or MPI.  Document configuration
# here:
#
# 1.0 : gcc-4.8.2, MKL 10.0.3
# 1.1 : same as 1.0, but use new version hashes
#

HPCP_ENV = 1.1

# suffix, to avoid name collisions with nersc modules

HPCP_MOD_SUFFIX = -hpcp

# software download location

HPCP_POOL = /planck/tools/hpcports_pool

# toolchain (gnu, darwin, intel, ibm)

TOOLCHAIN = gnu

# UNIX tools

SHELL = /bin/bash
MAKE = make -s

# permissions on installed files

INST_GRP = planck
INST_PERM = g+rwX,o+rX

# serial compilers

CC = gcc
CXX = g++
F77 = gfortran
FC = gfortran

# MPI options

openmpi_EXTRA = \
	--with-udapl \
      	--with-tm \
      	--with-openib \
  	--disable-dlopen \
	--without-slurm \
	--without-loadleveler \
	--without-mx \
	--without-lsf

# compile flags

CFLAGS = -O3 -fPIC -DNDEBUG
CXXFLAGS = -O3 -fPIC -DNDEBUG -std=c++11
FFLAGS = -O3 -fPIC -DNDEBUG
FCFLAGS = -O3 -fPIC -DNDEBUG

# OpenMP flags

OMPFLAGS = -fopenmp

# Fortran mixing

FCLIBS = -lgfortran

# general linking

LIBS = -lpthread -lm

# vendor math libraries

VENDOR = intel
INTEL_INCLUDE = /opt/intel/mkl/10.0.3.020/include
INTEL_LIBDIR = /opt/intel/mkl/10.0.3.020/lib/em64t
INTEL_LIBS_CC = -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -liomp5
INTEL_LIBS_CXX = $(INTEL_LIBS_CC)
INTEL_LIBS_F77 = $(INTEL_LIBS_CC)
INTEL_LIBS_FC = $(INTEL_LIBS_CC)

# package overrides

tcl_OVERRIDE = TRUE
tcl_VERSION = 8.4.13

tk_OVERRIDE = TRUE
tk_VERSION = 8.4.13

blas_OVERRIDE = TRUE
blas_VERSION = 10.0.3
blas_LIBS_CC = $(INTEL_LIBS_CC)
blas_LIBS_CXX = $(INTEL_LIBS_CXX)
blas_LIBS_F77 = $(INTEL_LIBS_F77)
blas_LIBS_FC = $(INTEL_LIBS_FC)

lapack_OVERRIDE = TRUE
lapack_VERSION = 10.0.3
lapack_LIBS_CC = -lmkl_lapack
lapack_LIBS_CXX = -lmkl_lapack
lapack_LIBS_F77 = -lmkl_lapack
lapack_LIBS_FC = -lmkl_lapack

