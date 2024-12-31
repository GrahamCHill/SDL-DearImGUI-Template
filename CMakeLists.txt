cmake_minimum_required(VERSION 3.30)
if(APPLE)
    set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)
    set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64") #Universal Binary
endif ()
project(GameTemplate)


set(CMAKE_CXX_STANDARD 20)

add_subdirectory(External)

add_subdirectory(GameTemplate)
