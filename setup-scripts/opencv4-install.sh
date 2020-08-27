#!/bin/bash

# Based on https://www.pyimagesearch.com/2018/08/15/how-to-install-opencv-4-on-ubuntu/

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential cmake unzip pkg-config

sudo apt-get -y install libjpeg-dev libpng-dev libtiff-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get -y install libxvidcore-dev libx264-dev

sudo apt-get -y install libgtk-3-dev

sudo apt-get -y install libatlas-base-dev gfortran

sudo apt-get -y install python3-dev

cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0.zip

unzip opencv.zip
unzip opencv_contrib.zip

mv opencv-4.0.0 opencv
mv opencv_contrib-4.0.0 opencv_contrib


cd ~/opencv
mkdir build
cd build


cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
	-D BUILD_EXAMPLES=ON ..

make -j4

sudo make install
sudo ldconfig
