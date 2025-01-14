
add_custom_command(
        TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        "${CMAKE_CURRENT_BINARY_DIR}/../external/SDL3/SDL3.dll"
        "${CMAKE_CURRENT_BINARY_DIR}/SDL3.dll"
)


# Special packaging for rendering backends
if (GRAPHICS_BACKEND STREQUAL "VULKAN")
    message(STATUS "Vulkan Packaging Logic Running")

    message(STATUS "Vulkan Packaging Logic Complete")
elseif (GRAPHICS_BACKEND STREQUAL "OPENGL")
    message(STATUS "OpenGL Packaging Logic Running")

    message(STATUS "OpenGL Packaging Logic Complete")
    # Default backend DX11/Metal for Windows
elseif (GRAPHICS_BACKEND STREQUAL "METAL")
    message(STATUS "DirectX11 Packaging Logic Running")

    message(STATUS "DirectX11 Packaging Logic Complete")
else () # SDL RENDERER
    message(STATUS "SDL RENDERER Packaging Logic Running")

    message(STATUS "SDL RENDERER Packaging Logic Complete")
endif()