# Note this is still heavily WIP, when done it will allow easier switching between renderers
# It will make DearImGUI a requirement and no longer optional if you want the CMake to work
# properly

set(RENDERERS ${CMAKE_CURRENT_SOURCE_DIR}/src/BackendRenderer)

# Add ImGui include directories
include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/src/BackendRenderer
)

set(RENDERERS_MAIN
        # WIP
        ${RENDERERS}/DirectX11_Renderer.h
        ${RENDERERS}/DirectX11_Renderer.cpp

        # Metal Renderers Need Work
#        ${RENDERERS}/Metal_Renderer.h
#        ${RENDERERS}/Metal_Renderer.mm

        # OpenGL WIP
        ${RENDERERS}/OpenGL_Renderer.h
        ${RENDERERS}/OpenGL_Renderer.cpp

        # Vulkan Renderers Working
        ${RENDERERS}/Vulkan_Renderer.h

        # Need abstraction logic to be implemented
        ${RENDERERS}/Renderer.h
        ${RENDERERS}/Renderer.cpp
)