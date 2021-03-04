#!/bin/bash 

make
strip bin/0d1n
make install

cd 0d1n_viewer
make
make install


