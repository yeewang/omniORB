#!/bin/bash

../configure --disable-longdouble CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++ --host=arm-linux-gnueabihf --build=x86_64-linux-gnu --prefix=$PWD/out

find src/tool -name GNUmakefile -exec sed  -i '/TOP=/ s@\.\.$@\.\./\.\./build@' {} \;
mkdir -p bin && cp ../build/out/bin/{omniidl,omkdependi,omnicpp} bin

