find_package(Vulkan REQUIRED)

# Use the option below to Auto Bundle your app on macOS
option(USE_BUNDLER OFF) # If using IDE change option->set and OFF->True
message(STATUS "Vulkan Library Location: ${Vulkan_LIBRARIES}" )
include(Submodules/CMakeLists.txt)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        message(STATUS "Building Debug Build")
else()
        message(STATUS "Building Non-Debug/Release Build")
endif()

add_executable(AppTemplate
        src/main.cpp
        src/main.h
        ${TINYFD_REQ}
        ${IMGUI_REQ}
        src/fileDialog.cpp
        src/fileDialog.h
)


if(APPLE)
        # Include SDL3 headers and Vulkan/MoltenVK
        target_include_directories(AppTemplate
                PRIVATE
                ${SDL3_INCLUDE}
                ${Vulkan_INCLUDE_DIRS}
        )
        # Link against the SDL3-static target
        target_link_libraries(AppTemplate PRIVATE SDL3 ${Vulkan_LIBRARIES})
endif ()
if (WIN32)
        # Include SDL3 headers
        target_include_directories(AppTemplate PRIVATE ${SDL3_INCLUDE} ${Vulkan_INCLUDE_DIRS})
        # Link SDL3 library
        target_link_libraries(AppTemplate PRIVATE SDL3::SDL3 ${Vulkan_LIBRARIES})

endif ()

include(CMake_Bundler/CMakeLists.txt)