cmake_minimum_required(VERSION 3.30)
if(APPLE)
    set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)
    set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64") #Universal Binary
endif ()
project(AppTemplate)


message(STATUS "Generating CMake Build Files For Application")

set(CMAKE_CXX_STANDARD 20)

add_subdirectory(External)
add_library(SDL3 SHARED IMPORTED)
set_target_properties(SDL3 PROPERTIES
        IMPORTED_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/External/SDL3/libSDL3.dylib"
)

message(STATUS "Successfully Generated External Project Build Files")
add_subdirectory(AppTemplate)
message(STATUS "Successfully Generated Main Project Build Files")
