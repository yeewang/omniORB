#!/bin/bash

../configure --disable-longdouble CC=arm-linux-gnueabi-gcc CXX=arm-linux-gnueabi-g++ --host=arm-linux-gnueabi --build=x86_64-linux-gnu --prefix=$PWD/out

find src/tool -name GNUmakefile -exec sed  -i '/TOP=/ s@\.\.$@\.\./\.\./build@' {} \;
mkdir -p bin && cp ../build/bin/{omniidl,omkdepend} bin

