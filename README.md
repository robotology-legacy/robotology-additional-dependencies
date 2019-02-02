# robotology-additional-dependencies

Windows binary installer for some dependencies of robotology projects.

This installer provides Windows dependencies of robotology projects that are not contained in the YARP and ICUB binary installers ( http://wiki.icub.org/wiki/Downloads ). 

The libraries are built using `vcpkg` and the installers are generated using the https://github.com/robotology-playground/vcpkg-cpack project .

## Releases 

| Version |  Date  | Link | 
|:-------:|:------:|:----:| 
| 0.2.0   | 2019/02/02 | https://github.com/robotology-playground/robotology-additional-dependencies/releases/tag/v0.2.0 |
| 0.1.0   | 2018/08/02 | https://github.com/robotology-playground/robotology-additional-dependencies/releases/tag/v0.1.0 |


## Generate the installers 

To generate the installers, make sure that you have installed: 
* [Git for Windows (including the Git Bash)](https://gitforwindows.org/) 
* [Qt Installer Framework](http://download.qt.io/official_releases/qt-installer-framework/3.0.6/) 
* [CMake](https://cmake.org/download/) 

Furthermore, make sure that the Qt Installer Framework executable directory (tipically `C:\Qt\QtIFW-3.0.6` or something similar) is in the `Path`.
Then, launch the `Git Bash`, clone this repository and launch the `generate-installers.sh` script:
~~~
git clone https://github.com/robotology-playground/robotology-additional-dependencies
cd robotology-additional-dependencies
./generate-installers.sh
~~~
this will start the generation process for the installers. If everything went fine, after approximatly half an hour (depending on the speed of your PC), you should see the message "robotology-additional-installers correctly generated and copies in artifacts" and you should find the generated artifacts in the `robotology-additional-dependencies/artifacts` directory. 

To add more vcpkg ports to the installer, you can modify the `VCPKG_CPACK_TARGET_PORTS` variable in the [`config/common.cmake`](config/common.cmake) file. To understand more of the generation process, inspect the `generate-installers.sh` script and  check [`vcpkg-cpack`'s documentation](https://github.com/robotology-playground/vcpkg-cpack). 
