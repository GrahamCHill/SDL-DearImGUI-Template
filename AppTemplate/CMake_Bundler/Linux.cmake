
# Special packaging for rendering backends
# Default backend Vulkan/Metal for Linux
if (GRAPHICS_BACKEND STREQUAL "VULKAN" OR GRAPHICS_BACKEND STREQUAL "METAL")
    message(STATUS "Vulkan Packaging Logic Running")

    message(STATUS "Vulkan Packaging Logic Complete")
elseif (GRAPHICS_BACKEND STREQUAL "OPENGL")
    message(STATUS "OpenGL Packaging Logic Running")

    message(STATUS "OpenGL Packaging Logic Complete")
else () # SDL RENDERER
    message(STATUS "SDL RENDERER Packaging Logic Running")

    message(STATUS "SDL RENDERER Packaging Logic Complete")
endif()