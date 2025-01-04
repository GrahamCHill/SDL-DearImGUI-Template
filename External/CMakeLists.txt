include(SDL3.cmake)

# Set include path for SDL3
set(SDL3_INCLUDE
        ${SDL3_DIR}/include
        CACHE STRING "Path to SDL3 include directory"
        )
#add_subdirectory(${SDL3_DIR})
message(STATUS "SDL3 Include Location: ${SDL3_INCLUDE}")
