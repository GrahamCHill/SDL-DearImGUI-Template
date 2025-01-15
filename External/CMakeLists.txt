include(SDL2.cmake)

# Set include path for SDL2
set(SDL2_INCLUDE
        ${SDL2_DIR}/include
        CACHE STRING "Path to SDL2 include directory"
        )
message(STATUS "SDL2 Include Location: ${SDL2_INCLUDE}")
