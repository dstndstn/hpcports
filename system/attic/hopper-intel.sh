loaded=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
if [ "x${loaded}" = x ]; then
    module swap PrgEnv-pgi PrgEnv-intel
    module unload pgi
    module unload cray-shmem
    module swap intel intel/13.0.1.117
    module swap xt-asyncpe xt-asyncpe/5.16
    module swap cray-libsci cray-libsci/12.0.00
    module swap cray-mpich2 cray-mpich2/5.6.0
    module load mkl/12.1.2.273
    module load fftw/3.3.0.1
    module load python/2.7.3
fi
