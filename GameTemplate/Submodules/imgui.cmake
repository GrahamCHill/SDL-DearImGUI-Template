# Add ImGui include directories
include_directories(
        ${SUBMODULE_CMAKE}/imgui
        ${SUBMODULE_CMAKE}/imgui/backends
)

set(IMGUI_REQ
        ${SUBMODULE_CMAKE}/imgui/imgui.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_draw.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_demo.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_tables.cpp
        ${SUBMODULE_CMAKE}/imgui/imgui_widgets.cpp
        ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_vulkan.cpp
        ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_sdl3.cpp
)