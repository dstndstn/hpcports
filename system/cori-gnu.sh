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
    module unload gcc
    module unload cray-mpich
    module unload cray-shmem
    module unload craype
    module load craype/2.5.1
    module load cray-shmem/7.3.1
    module load cray-mpich/7.3.1
    module load gcc/5.2.0
    module load intel intel/16.0.0.109
    module load git/2.6.3
    module load zlib/1.2.8
    module load bzip2/1.0.6
    export CRAYPE_LINK_TYPE=dynamic
fi
