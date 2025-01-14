# Add ImGui include directories
include_directories(
        ${SUBMODULE_CMAKE}/imgui
        ${SUBMODULE_CMAKE}/imgui/backends
)

set(IMGUI_MAIN
        ${SUBMODULE_CMAKE}/imgui/imgui.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_draw.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_demo.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_tables.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_widgets.cpp
        ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_sdl3.cpp
)

if (GRAPHICS_BACKEND STREQUAL "VULKAN")
    set(IMGUI_REQ
            ${IMGUI_MAIN}
            ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_vulkan.cpp
    )
elseif (GRAPHICS_BACKEND STREQUAL "OPENGL")
    set(IMGUI_REQ
            ${IMGUI_MAIN}
            ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_opengl3.cpp
    )
else ()
    set(IMGUI_REQ
            ${IMGUI_MAIN}
            ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_vulkan.cpp
    )
endif()
