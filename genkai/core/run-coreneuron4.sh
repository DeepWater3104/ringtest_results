#!/bin/bash

#PJM -L node=1
#PJM -L rscgrp=a-pj24003105
#PJM -L elapse=03:00:00

module load gcc
module load ompi

source ../venv/bin/activate
mpiexec -n 4 --map-by ppr:4:node:PE=1 --bind-to core ./x86_64/special -mpi -python ringtest.py -tstop 10000 -nring 128 -ncel 128 -branch 32 64 --coreneuron
