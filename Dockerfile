FROM jupyter/datascience-notebook:a95cb64dfe10

MAINTAINER Melissa Gymrek <mgymrek@ucsd.edu>
USER root

# Install dependencies
RUN apt-get update && apt-get -qq install -y \
    cmake \
    datamash \
    default-jdk \
    git \
    less \
    libbz2-dev \
    liblzma-dev \
    libncurses5 libncurses5-dev \
    r-base \
    vim \
    zlib1g-dev

# Make sources directory
RUN mkdir /sources

# Install extra python packages
RUN pip install pyvcf

# Install nbgrader
RUN conda install nbgrader
RUN jupyter nbextension install --symlink --sys-prefix --py nbgrader
RUN jupyter nbextension enable --sys-prefix --py nbgrader
RUN jupyter serverextension enable --sys-prefix --py nbgrader

# disable formgrader, create-assignments for all. grader and assignment maker will run below with 'enable --user' instead of 'disable --sys-prefix'
RUN jupyter nbextension disable --sys-prefix formgrader/main --section=tree
RUN jupyter serverextension disable --sys-prefix nbgrader.server_extensions.formgrader
RUN jupyter nbextension disable --sys-prefix create_assignment/main

RUN rm /sources/*.tar.gz
RUN rm /sources/*.zip
RUN rm -rf /opt/julia
