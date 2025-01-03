
# SDL3-Vulkan-DearImGUI-Template

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
