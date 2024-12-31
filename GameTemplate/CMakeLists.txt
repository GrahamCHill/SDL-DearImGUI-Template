find_package(Vulkan REQUIRED)

set(IMGUI_REQ
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/imgui.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/imgui_draw.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/imgui_demo.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/imgui_tables.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/imgui_widgets.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/backends/imgui_impl_vulkan.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/backends/imgui_impl_sdl3.cpp
)

add_executable(GameTemplate
        main.cpp
        main.h
        ${IMGUI_REQ}
        )

# Add ImGui include directories
target_include_directories(GameTemplate PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui
        ${CMAKE_CURRENT_SOURCE_DIR}/../External/imgui/backends
)

if (CMAKE_VERSION VERSION_GREATER 3.12)
    set_property(TARGET GameTemplate PROPERTY CMAKE_CXX_STANDARD 20)
endif ()

# Include SDL3 headers
target_include_directories(GameTemplate PRIVATE ${SDL3_INCLUDE} ${Vulkan_INCLUDE_DIRS})

# Link against the SDL3-static target
target_link_libraries(GameTemplate PRIVATE SDL3::SDL3 ${Vulkan_LIBRARIES})
