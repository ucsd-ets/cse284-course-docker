#!/bin/bash

set -e

# Install RFMix
cd /sources
wget https://www.dropbox.com/s/cmq4saduh9gozi9/RFMix_v1.5.4.zip
unzip RFMix_v1.5.4.zip
cd RFMix_v1.5.4/PopPhased/
g++ -Wall -O3 -ftree-vectorize -fopenmp main.cpp getdata.cpp randomforest.cpp crfviterbi.cpp windowtosnp.cpp -o RFMix_PopPhased
cd ../TrioPhased
g++ -Wall -O3 -ftree-vectorize -fopenmp main.cpp getdata.cpp randomforest.cpp crfviterbi.cpp windowtosnp.cpp -o RFMix_TrioPhased

# Install IMPUTE2
cd /sources
wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
tar -xzvf impute_v2.3.2_x86_64_static.tgz
cp impute_v2.3.2_x86_64_static/impute2 /usr/local/bin
