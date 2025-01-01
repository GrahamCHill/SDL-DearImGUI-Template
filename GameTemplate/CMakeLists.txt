find_package(Vulkan REQUIRED)
message(STATUS "Vulkan Library Location: ${Vulkan_LIBRARIES}" )
include(Submodules/CMakeLists.txt)

add_executable(GameTemplate
        main.cpp
        main.h
        ${IMGUI_REQ}
        )

# Add ImGui include directories
target_include_directories(GameTemplate PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui
        ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/imgui/backends
)


# Include SDL3 headers
target_include_directories(GameTemplate PRIVATE ${SDL3_INCLUDE} ${Vulkan_INCLUDE_DIRS})

# Link against the SDL3-static target
target_link_libraries(GameTemplate PRIVATE SDL3::SDL3 ${Vulkan_LIBRARIES})
