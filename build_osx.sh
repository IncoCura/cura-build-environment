#!/bin/bash

export CURA_TARGET_OSX_VERSION=10.13
export CURA_OSX_SDK_VERSION=10.13

# (Optional) Minimum OSX version for deployment
if [ -z "${CURA_TARGET_OSX_VERSION}" ]; then
    echo "Using ${CURA_TARGET_OSX_VERSION} as the minimum OSX version."
    export MACOSX_DEPLOYMENT_TARGET="${CURA_TARGET_OSX_VERSION}"
    export CMAKE_OSX_DEPLOYMENT_TARGET="${CURA_TARGET_OSX_VERSION}"
    export QMAKE_MACOSX_DEPLOYMENT_TARGET="${CURA_TARGET_OSX_VERSION}"

    echo "Set MACOSX_DEPLOYMENT_TARGET to ${MACOSX_DEPLOYMENT_TARGET}"
    echo "Set CMAKE_OSX_DEPLOYMENT_TARGET to ${CMAKE_OSX_DEPLOYMENT_TARGET}"
    echo "Set QMAKE_MACOSX_DEPLOYMENT_TARGET to ${QMAKE_MACOSX_DEPLOYMENT_TARGET}"
fi
# (Optional) OSX SDK version to use
if [ -n "${CURA_OSX_SDK_VERSION}" ]; then
    echo "Using ${CURA_OSX_SDK_VERSION} as the OSX SDK version."
    export CMAKE_OSX_SYSROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX${CURA_OSX_SDK_VERSION}.sdk"

    echo "Set CMAKE_OSX_SYSROOT to ${CMAKE_OSX_SYSROOT}"
fi

export CMAKE_CXX_FLAGS="-stdlib=libc++"
export CXXFLAGS="-stdlib=libc++"

export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

# Remove build dir
#rm -rf ./build
#rm -rf /Users/kangdroid/Desktop/Cura/curadep/*

# Create build dir
#mkdir ./build
cd build
#cmake .. -DCMAKE_INSTALL_PREFIX=/Users/kangdroid/Desktop/Cura/curadep/ -DCMAKE_BUILD_TYPE=Release

make -j12