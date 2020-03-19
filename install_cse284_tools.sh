#!/bin/bash

set -e

# Install samtools (needed to index reference fasta files)
cd /sources
wget -O samtools-1.9.tar.bz2 https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
tar -xjf samtools-1.9.tar.bz2
cd samtools-1.9 
./configure && make && make install

# Install BWA mem
cd /sources
git clone https://github.com/lh3/bwa
cd bwa
make
cp bwa /usr/local/bin

# Install Plink
cd /sources
wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20190304.zip
unzip plink_linux_x86_64_20190304.zip
cp plink /usr/local/bin

# Install bedtools
cd /sources
wget https://github.com/arq5x/bedtools2/releases/download/v2.28.0/bedtools-2.28.0.tar.gz
tar -zxvf bedtools-2.28.0.tar.gz
cd bedtools2
make
make install

# Install htslib (with tabix)
cd /sources
wget -O htslib-1.8.tar.bz2 https://github.com/samtools/htslib/releases/download/1.8/htslib-1.8.tar.bz2
tar -xjvf htslib-1.8.tar.bz2
cd htslib-1.8/
./configure
make
make install

# Install bcftools
cd /sources
wget -O bcftools-1.9.tar.bz2 https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2
tar -xjvf bcftools-1.9.tar.bz2
cd bcftools-1.9
./configure
make
make install

# Install VCFTools
cd /sources
wget https://github.com/vcftools/vcftools/releases/download/v0.1.16/vcftools-0.1.16.tar.gz
tar -xzvf vcftools-0.1.16.tar.gz
cd vcftools-0.1.16
./autogen.sh && ./configure && make && make install

