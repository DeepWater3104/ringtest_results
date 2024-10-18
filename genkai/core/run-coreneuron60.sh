#!/bin/bash

#PJM -L node=1
#PJM -L rscgrp=a-pj24003105
#PJM -L elapse=1:00:00

module load gcc
module load ompi

source ../venv/bin/activate
mpiexec -n 60 --map-by ppr:60:node:PE=1 --bind-to core ./x86_64/special -mpi -python ringtest.py -tstop 10000 -nring 128 -ncel 128 -branch 32 64 --coreneuron
