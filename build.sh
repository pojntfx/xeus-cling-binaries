#!/bin/bash

# Install build dependencies
apt update
apt install -y build-essential cmake curl git

# Install miniforge
XEUS_PREFIX=/usr/local/xeus-cling
curl -L -o /tmp/miniforge.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-$(uname -m).sh
chmod +x /tmp/miniforge.sh
mkdir -p ${XEUS_PREFIX}
/tmp/miniforge.sh -bfp ${XEUS_PREFIX} -u
rm /tmp/miniforge.sh

# Add miniforge to the path temporarily
export PATH="$PATH:${XEUS_PREFIX}/bin"

# Install dependencies
conda install -c conda-forge -y cmake xeus=1.0.0 cling=0.8 clangdev=5.0 llvmdev=5 nlohmann_json cppzmq xtl pugixml cxxopts

# Install xeus-cling
rm -rf /tmp/xeus-cling
cd /tmp
git clone https://github.com/jupyter-xeus/xeus-cling.git
cd xeus-cling
mkdir -p build && cd build
cmake -D CMAKE_INSTALL_PREFIX=${XEUS_PREFIX} -D CMAKE_INSTALL_LIBDIR=${XEUS_PREFIX}/lib -D DOWNLOAD_GTEST=ON ..
make install -j$(nproc)
rm -rf /tmp/xeus-cling

# Remove build dependencies
conda clean -y -f

# Create tar archive
cd ${XEUS_PREFIX}
mkdir -p /out
tar -zcvf /out/xeus-cling.$(uname -m).tar.gz *
