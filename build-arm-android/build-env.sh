#!/bin/bash

export TOOLCHAIN=$PWD/toolchains/arm-android-21-toolchain

#IMPORT_CPPFLAGS += -D__linux__
OMNITHREAD_POSIX_CPPFLAGS="-D__linux__ -DNoNanoSleep -DPthreadDraftVersion=10 -lstdc++"
OMNITHREAD_CPPFLAGS="-D_REENTRANT"
OMNITHREAD_LIB+="-lpthread"

../configure --disable-longdouble CC=$TOOLCHAIN/bin/arm-linux-androideabi-gcc CXX=$TOOLCHAIN/bin/arm-linux-androideabi-g++ CPPFLAGS="$OMNITHREAD_POSIX_CPPFLAGS" --host=arm-linux-eabi --build=x86_64-linux-gnu --prefix=$PWD/out

find src/tool -name GNUmakefile -exec sed  -i '/TOP=/ s@\.\.$@\.\./\.\./build@' {} \;
mkdir -p bin && cp ../build/bin/{omniidl,omkdepend} bin


