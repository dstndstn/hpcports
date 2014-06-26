loadedgnu=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-gnu`
loadedintel=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-intel`
loadedcray=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep PrgEnv-cray`
loadeddarshan=`${MODULESHOME}/bin/modulecmd sh -t list 2>&1 | grep darshan`
if [ "x${loadedgnu}" = x ]; then
    if [ "x${loadedcray}" != x ]; then
      module swap PrgEnv-cray PrgEnv-gnu
    fi
    if [ "x${loadedintel}" != x ]; then
      module swap PrgEnv-intel PrgEnv-gnu
    fi
    module swap craype craype/2.1.2
    module unload cray-shmem
    module unload cray-mpich
    module unload atp
    module unload cray-libsci
    module swap gcc gcc/4.9.0
    module load mkl/13.0.3
    module load git/1.8.1.1
    if [ "x${loadeddarshan}" != x ]; then
        module unload darshan
    fi
    module load ccm
fi

export CRAYPE_LINK_TYPE=dynamic
