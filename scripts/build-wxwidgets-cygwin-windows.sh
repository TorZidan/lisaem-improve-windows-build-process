#!/bin/bash -x

# https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.2/wxWidgets-3.1.2.tar.bz2

# These are the expected paths for the mingw Cygwin package binaries.

[[ -z "$AR"      ]] && export AR=/bin/x86_64-w64-mingw32-ar.exe
[[ -z "$AS"      ]] && export AS=/bin/x86_64-w64-mingw32-as.exe
[[ -z "$CPP"     ]] && export CPP=/bin/x86_64-w64-mingw32-cpp.exe
[[ -z "$DLLTOOL" ]] && export DLLTOOL=/bin/x86_64-w64-mingw32-dlltool.exe
[[ -z "$DLLWRAP" ]] && export DLLWRAP=/bin/x86_64-w64-mingw32-dllwrap.exe
[[ -z "$CXX"     ]] && export CXX=/bin/x86_64-w64-mingw32-g++.exe
[[ -z "$CC"      ]] && export CC=/bin/x86_64-w64-mingw32-gcc.exe
[[ -z "$RANLIB"  ]] && export RANLIB=/bin/x86_64-w64-mingw32-ranlib.exe
[[ -z "$GCOV"    ]] && export GCOV=/bin/x86_64-w64-mingw32-gcov.exe
[[ -z "$GPROF"   ]] && export GPROF=/bin/x86_64-w64-mingw32-gprof.exe
[[ -z "$LD"      ]] && export LD=/bin/x86_64-w64-mingw32-ld.exe
[[ -z "$NM"      ]] && export NM=/bin/x86_64-w64-mingw32-nm.exe
[[ -z "$OBJCOPY" ]] && export OBJCOPY=/bin/x86_64-w64-mingw32-objcopy.exe
[[ -z "$OBJDUMP" ]] && export OBJDUMP=/bin/x86_64-w64-mingw32-objdump.exe
[[ -z "$STRIP"   ]] && export STRIP=/bin/x86_64-w64-mingw32-strip.exe
[[ -z "$WINDMC"  ]] && export WINDMC=/bin/x86_64-w64-mingw32-windmc.exe
[[ -z "$WINDRES" ]] && export WINDRES=/bin/x86_64-w64-mingw32-windres.exe

export AROPTS="crD"

VER=3.1.2
export TYPE=msw
cd wxWidgets-${VER} || exit 1

mkdir build-${TYPE}
cd    build-${TYPE}

export CFLAGS="-fPIC" CXXFLAGS="-fPIC"
../configure --with-msw -enable-unicode --disable-debug --disable-shared --without-expat  --disable-richtext \
             --with-libpng=builtin --with-libjpeg=builtin --with-libtiff=builtin --with-libxpm=builtin \
             --prefix=/usr/local/wx${VER}-${TYPE} \
	     && make && make install || exit 2
export PATH=/usr/local/wx${VER}-${TYPE}/bin/:$PATH
wx-config --list
