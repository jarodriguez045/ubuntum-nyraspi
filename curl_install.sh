!#/bin/bash

#Execute in sudo!
# Install any build dependencies needed for curl
apt-get build-dep curl

# Get latest (as of April 11, 2020) libcurl
mkdir ~/curl
cd ~/curl
wget http://curl.haxx.se/download/curl-7.69.1.tar.bz2
tar -xvjf curl-7.69.1.tar.bz2
cd curl-7.69.1

# The usual steps for building an app from source
# ./configure
# ./make
# sudo make install
./configure
make
make install

# Resolve any issues of C-level lib
# location caches ("shared library cache")
sudo ldconfig