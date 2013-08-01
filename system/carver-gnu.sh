ver=`gcc --version | head -n 1 | awk '{ print $3 }'`
if [ "x${ver}" != "x4.7.0" ]; then
    module unload pgi
    module load gcc/4.7.0
    module unload openmpi
    module load openmpi-gnu/1.4.5
    module load mkl/10.2
    module load git/1.7.8.3
fi
