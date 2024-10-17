#!/bin/bash

#PJM -L node=2
#PJM -L rscgrp=a-pj24003105
#PJM -L elapse=01:00:00
#PJM -m b,e
#PJM --mail-list "fukami.satoshi760@mail.kyutech.jp"

module load gcc
module load ompi

source ../venv/bin/activate
mpiexec -n 120 --map-by ppr:120:node:PE=1 --bind-to core ./x86_64/special -mpi -python ringtest.py -tstop 1000 -nring 128 -ncel 128 -branch 32 64
