#!/bin/bash

blockMesh | tee log.blockMesh
checkMesh | tee log.checkMesh

decomposePar
mpirun -np 4 foamRun -parallel | tee log.runParallel
reconstructPar -latestTime

foamPostProcess -func sampleDict -latestTime
gnuplot gnuplot/gnuplotScript
paraview cavity.foam &