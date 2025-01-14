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
    if (APPLE)
        # Metal Configuration for macOS
        set(IMGUI_REQ
                ${IMGUI_MAIN}
                ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_metal.mm
        )
        set_source_files_properties(${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_metal.mm
                PROPERTIES COMPILE_FLAGS "-x objective-c++")

    elseif (WIN32)
        # !!! UNTESTED !!!
        # DirectX Configuration for Windows
        set(IMGUI_REQ
                ${IMGUI_MAIN}
                ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_dx12.cpp
        )

    else () # Linux will default to Vulkan
        set(IMGUI_REQ
                ${IMGUI_MAIN}
                ${SUBMODULE_CMAKE}/imgui/backends/imgui_impl_vulkan.cpp
        )
    endif ()
endif()
