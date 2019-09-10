#! /bin/bash
# This bash script has been tested under Windows with Git Bash 

# Make sure that QtIFW is on the path before running this script 
if ! [ -x "$(command -v repogen.exe)" ]; then
  echo 'Error: QtIFW is not in the PATH. Plese install it and add it to the path.' >&2
  exit 1
fi

# Add default CMake location to PATH, if you install CMake in a non-standard location change this line 
export PATH=$PATH:/c/Program\ Files/CMake/bin/

# Create a build directory and an artefacts directory 
rm -rf build 
mkdir build

# Copy the appropriate version of vcpkg-cpack
cd build
git clone https://github.com/robotology-playground/vcpkg-cpack -b use-internal-vcpkg
cd ..

# Create x86-windows installers 
cd build
rm -rf x86-windows
mkdir x86-windows
cd x86-windows 
cmake -A Win32 -C ../../config/x86-windows.cmake ../vcpkg-cpack
cmake --build . --config Release --target PACKAGE 
cd ../..

# Create x64-windows installers 
cd build
rm -rf x64-windows
mkdir x64-windows
cd x64-windows 
cmake -A x64 -C ../../config/x64-windows.cmake ../vcpkg-cpack
cmake --build . --config Release --target PACKAGE 
cd ../..

# Copy installer in artifacts
echo "Copying installers in artifacts directory"
rm -rf artifacts
mkdir artifacts
RAD_VERSION="0.3.0"
cp ./build/x86-windows/robotology-additional-dependencies-${RAD_VERSION}-x86.exe ./artifacts/robotology-additional-dependencies-${RAD_VERSION}-v141-x86.exe
cp ./build/x86-windows/robotology-additional-dependencies-${RAD_VERSION}-x86.zip ./artifacts/robotology-additional-dependencies-${RAD_VERSION}-v141-x86.zip
cp ./build/x64-windows/robotology-additional-dependencies-${RAD_VERSION}-x86_amd64.exe ./artifacts/robotology-additional-dependencies-${RAD_VERSION}-v141-x86_amd64.exe
cp ./build/x64-windows/robotology-additional-dependencies-${RAD_VERSION}-x86_amd64.zip ./artifacts/robotology-additional-dependencies-${RAD_VERSION}-v141-x86_amd64.zip
 
echo "robotology-additional-installers correctly generated and copies in artefacts"
exit 0

