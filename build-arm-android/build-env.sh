#!/bin/bash

export TOOLCHAIN=$PWD/toolchains/arm-android-19-toolchain

#IMPORT_CPPFLAGS += -D__linux__
OMNITHREAD_POSIX_CPPFLAGS="-D__linux__ -DNoNanoSleep -DPthreadDraftVersion=10 -march=armv7-a -lstdc++  -fPIE"
OMNITHREAD_CPPFLAGS="-D_REENTRANT"
OMNITHREAD_LIB+="-lpthread"

../configure --disable-longdouble CC=$TOOLCHAIN/bin/arm-linux-androideabi-gcc CXX=$TOOLCHAIN/bin/arm-linux-androideabi-g++ CPPFLAGS="$OMNITHREAD_POSIX_CPPFLAGS" LDFLAGS='-march=armv7-a' --host=arm-linux-eabi --build=x86_64-linux-gnu --prefix=$PWD/out

find src/tool -name GNUmakefile -exec sed  -i '/TOP=/ s@\.\.$@\.\./\.\./build@' {} \;
mkdir -p bin && cp ../build/out/bin/{omniidl,omkdepend,omnicpp/} bin


