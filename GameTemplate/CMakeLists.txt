find_package(Vulkan REQUIRED)
message(STATUS "Vulkan Library Location: ${Vulkan_LIBRARIES}" )
include(Submodules/CMakeLists.txt)

add_executable(GameTemplate
        main.cpp
        main.h
        ${IMGUI_REQ}
        )

# Include SDL3 headers and Vulkan/MoltenVK
target_include_directories(GameTemplate PRIVATE ${SDL3_INCLUDE} ${Vulkan_INCLUDE_DIRS})

# Link against the SDL3-static target
target_link_libraries(GameTemplate PRIVATE SDL3::SDL3 ${Vulkan_LIBRARIES})
