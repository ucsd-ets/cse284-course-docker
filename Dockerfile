FROM ucsdets/datascience-notebook:2019.4-stable

MAINTAINER Melissa Gymrek <mgymrek@ucsd.edu>
USER root

# Install dependencies
RUN apt-get update && apt-get -qq install -y \
    cmake \
    datamash \
    default-jdk \
    git \
    less \
    libcurl4-openssl-dev libssl-dev \
    libbz2-dev \
    liblzma-dev \
    libncurses5 libncurses5-dev \
    r-base \
    vim \
    zlib1g-dev

# Make sources directory
RUN mkdir /sources

# Install extra python packages
RUN pip install pyvcf pysam brewer2mpl

# Install course-specific software
ADD install_cse284_tools.sh /sources/
RUN chmod +x /sources/install_cse284_tools.sh
RUN /sources/install_cse284_tools.sh

# Install PS2 software
ADD install_ps2_tools.sh /sources
RUN chmod +x /sources/install_ps2_tools.sh
RUN /sources/install_ps2_tools.sh

RUN rm /sources/*.tar.gz
RUN rm /sources/*.zip
RUN rm -rf /opt/julia
