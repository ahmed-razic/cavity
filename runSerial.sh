#!/bin/bash

blockMesh | tee log.blockMesh
checkMesh | tee log.checkMesh
foamRun | tee log.runSerial
foamLog log.runSerial
foamPostProcess -func sampleDict -latestTime
gnuplot gnuplot/gnuplotScript
#paraview cavity.foam &