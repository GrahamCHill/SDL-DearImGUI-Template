cmake_minimum_required(VERSION 3.30)
if(APPLE)
    set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)
    set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64") #Universal Binary
endif ()
project(AppTemplate)


message(STATUS "Generating CMake Build Files For Application")

set(CMAKE_CXX_STANDARD 20)

add_subdirectory(External)
if (CMAKE_BUILD_TYPE STREQUAL "Debug" AND APPLE)
    set_target_properties(SDL2 PROPERTIES
            IMPORTED_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/External/SDL2/libSDL2-2.0d.0.dylib"
    )
    message("SDL2 ${SDL2}")
elseif (CMAKE_BUILD_TYPE STREQUAL "Release" AND APPLE)
    set_target_properties(SDL2 PROPERTIES
            IMPORTED_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/External/SDL2/libSDL2-2.0.0.dylib"
    )
    message(STATUS "SDL2 -- ${SDL2}")
endif ()


message(STATUS "Successfully Generated External Project Build Files")
add_subdirectory(AppTemplate)
message(STATUS "Successfully Generated Main Project Build Files")
