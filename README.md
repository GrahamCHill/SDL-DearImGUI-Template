
# SDL3+Vulkan+DearImGU Project Template

This template is built with git submodules, and CMake!

This a template designed around the CMake build system, it includes 
[Dear ImGui](https://github.com/ocornut/imgui), [Vulkan](https://vulkan.lunarg.com/),
[SDL3](https://github.com/libsdl-org/SDL), and [Tiny File Dialog](https://sourceforge.net/projects/tinyfiledialogs/).

### Building
#### Requirements
This project requires you to have the Vulkan SDK installed on your system, as well as an appropriate compiler and CMake 
for the actual build process. Below are links you may require:
1. [Vulkan SDK](https://vulkan.lunarg.com/sdk/home)
2. [CMake](https://cmake.org/download/)

On Windows the [MinGW](https://www.mingw-w64.org/), 
[Visual Studio Compiler](https://visualstudio.microsoft.com/vs/features/cplusplus/), or other appropriate compiler is 
required for building.  
On Linux based systems [GCC](https://gcc.gnu.org/) or another appropriate compiler can be used.  
On macOS when you install Xcode, you should have all you need to build it.  

#### Commands
If you open the Folder `SDL3-Vulkan-DearImGUI-Template` (the top level of this git repository), in your chosen platforms console/terminal 
you can run the following commands to build the project

```shell

mkdir "build"
cd build

cmake ..
make

```
### Removing Unwanted Libraries
This template has made a few simple choices in order to show you how you can structure your project or add other git repositories to your 
project, but if you don't want any of them you just have to remove them, remove the reference to it in .gitsubmodules and alter the 
relevant CMake files from your project for example with Tiny File Dialog files you can remove it by deleting the following files in the 
project:

- `/AppTemplate/Submodules/tinyfd.cmake`
- `/AppTemplate/Submodules/tinyfd/*`  

The line in the CMakeLists.txt file present in `AppTemplate/Submodules/` which says `include(${SUBMODULE_CMAKE}/tinyfd.cmake)`.

The files I wrote using them located at 

- `/AppTemplate/src/fileDialog.h`
- `/AppTemplate/src/fileDialog.cpp`

Any reference to them in the `main.h` and `main.cpp` files.

Finally remove the following from `/AppTemplate/CMakeLists.txt` located in the `set_executable` command

- `src/fileDialog.cpp`
- `src/fileDialog.h`
- `${TINYFD_REQ}`

You can also disable Vulkan and use only SDL3's renderer, if you choose by modifying your CMakeLists files, as this template is
built for you to make use of so you can skip to learning SDL3, Dear ImGui, Vulkan, and/or whatever you want to add/remove into 
this template.


### License
#### This Project
This Project is licensed under the MIT license, as such you are free to do anything allowed by the MIT license with this 
project.

#### Third-Party Libraries

- This project uses the Dear ImGui GUI Framework. The MIT license is included in the folder 
`src/Submodules/imgui`.

- This project uses Vulkan. The license for which is available from them 
[Vulkan Site](https://vulkan.lunarg.com/license/).

- This project uses SDL3. The Zlib license is included in the folder `external/SDL3`.

- This project uses the Tiny File Dialog Project. The zlib license is included in the source code files of 
`src/Submodules/tinyfd`.
