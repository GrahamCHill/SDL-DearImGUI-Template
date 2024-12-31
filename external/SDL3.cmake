# Set SDL3 directory based on the git submodule location
set(SDL3_DIR ${CMAKE_CURRENT_SOURCE_DIR}/SDL3)
message(STATUS "SDL3_DIR: ${SDL3_DIR}")

# Add SDL3 as a subdirectory
add_subdirectory(${SDL3_DIR})
