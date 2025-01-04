## Set SDL3 directory based on the git submodule location
#set(SDL3_DIR ${CMAKE_CURRENT_SOURCE_DIR}/SDL3)
#message(STATUS "SDL3_DIR: ${SDL3_DIR}")
#
## Add SDL3 as a subdirectory
#add_subdirectory(${SDL3_DIR})


add_library(SDL3 SHARED IMPORTED)

set(SDL3_DIR "${CMAKE_SOURCE_DIR}/External/SDL3")

#set(SDL3_INCLUDE "${CMAKE_SOURCE_DIR}/External/SDL3/include" CACHE STRING "Path to SDL3 include directory")
#set(SDL3_LIB "${CMAKE_BINARY_DIR}/External/SDL3/build/libSDL3.a" CACHE STRING "Path to SDL3 static library")

# Add SDL3 as a subdirectory
#set(SDL3_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Submodules/SDL3" CACHE)
#message(STATUS "SDL2_DIR: ${SDL2_DIR}")
#add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Submodules/SDL3)


set(SDL3_LIB "${CMAKE_BINARY_DIR}/External/SDL3/libSDL3.dylib" CACHE STRING "Path to SDL3 static library") # Adjust if the build path differs

set_target_properties(SDL3 PROPERTIES
        IMPORTED_LOCATION "${SDL3_LIB}"
        INTERFACE_INCLUDE_DIRECTORIES "${SDL3_INCLUDE}"
)

