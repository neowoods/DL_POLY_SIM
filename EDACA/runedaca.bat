#!/bin/sh
# Run EDACA
cd $PWD
./edamd HIS.xyz 0 0 10 Au  > output_edamd 
./edaca > output_edaca
./stdev > output_stdev
