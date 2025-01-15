if (WIN32)
    # Set SDL2 directory based on the git submodule location
    set(SDL2_DIR ${CMAKE_CURRENT_SOURCE_DIR}/SDL2)
    message(STATUS "SDL2_DIR: ${SDL2_DIR}")

    # Add SDL3 as a subdirectory
    add_subdirectory(${SDL2_DIR})
endif ()

if (APPLE)

#    add_library(SDL2 SHARED IMPORTED)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/SDL2)
    set(SDL2_DIR "${CMAKE_SOURCE_DIR}/SDL2")
    if (CMAKE_BUILD_TYPE STREQUAL "Debug" AND APPLE)
        set(SDL2_LIB
                 "${CMAKE_CURRENT_BINARY_DIR}/External/SDL2/libSDL2-2.0d.0.dylib"
                CACHE STRING "Path to SDL2 static library"
        )
    elseif (CMAKE_BUILD_TYPE STREQUAL "Release" AND APPLE)
        set(SDL2_LIB
                 "${CMAKE_CURRENT_BINARY_DIR}/External/SDL2/libSDL2-2.0.0.dylib"
                 CACHE STRING "Path to SDL2 static library"
        )
    endif ()

    set_target_properties(SDL2 PROPERTIES
            IMPORTED_LOCATION "${SDL2_LIB}"
            INTERFACE_INCLUDE_DIRECTORIES "${SDL2_INCLUDE}"
    )
endif ()

