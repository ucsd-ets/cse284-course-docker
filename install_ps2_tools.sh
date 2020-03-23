#!/bin/bash

set -e

# Install IMPUTE2
cd /sources
wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
tar -xzvf impute_v2.3.2_x86_64_static.tgz
cp impute_v2.3.2_x86_64_static/impute2 /usr/local/bin
