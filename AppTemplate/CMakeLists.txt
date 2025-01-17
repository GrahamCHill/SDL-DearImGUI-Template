# Use the option below to Auto Bundle your app on macOS
# If using IDE change option->set and OFF->True
option(USE_BUNDLER OFF) # WILL NOT WORK IF NOT VULKAN RIGHT NOW
# Options are "OPENGL", "VULKAN", "METAL" or to delete it and let the system decide
# Note Metal means using default platform metal on mac, dx11 on windows, and vulkan on linux
set(GRAPHICS_BACKEND "VULKAN")

include(graphics_backend.cmake)
include(src/BackendRenderer/CMakeLists.txt)
include(src/FileManagement/CMakeLists.txt)
include(Submodules/CMakeLists.txt)
# Lazy fix for sdl2
include_directories(
        ${CMAKE_SOURCE_DIR}/External/SDL2/include
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        message(STATUS "Building Debug Build")
else()
        message(STATUS "Building Non-Debug/Release Build")
endif()


add_executable(AppTemplate
        src/main.h
        src/main.cpp
        ${TINYFD_REQ}
        ${IMGUI_REQ}
        ${RENDERERS_MAIN}
        ${FILEMANAGEMENT_MAIN}
        # Currently issues with high DPI monitors, eg Parallels VM running Windows on m1 mac
        # Will look into easy fixes when the logic is written
#        main.cpp  # This is the DX11 and hopefully eventually working DX12 SDL2 code
)
message(STATUS "SDL2 Directory: ${SDL2_DIR}")

if(APPLE)
        # Include SDL3 headers and Vulkan/MoltenVK
        target_include_directories(AppTemplate
                PRIVATE
                ${SDL2_INCLUDE}
                ${GRAPHICS_INCLUDE_DIRECTORIES}
        )
        # Link against the SDL3-static target
        target_link_libraries(AppTemplate PRIVATE SDL2 ${GRAPHICS_INCLUDE_LIBRARIES})


endif ()
if (WIN32)
        # Include SDL3 headers
        target_include_directories(AppTemplate PRIVATE ${SDL2_INCLUDE} ${GRAPHICS_INCLUDE_DIRECTORIES})
        # Link SDL3 library
        target_link_libraries(AppTemplate PRIVATE SDL2main SDL2 ${GRAPHICS_INCLUDE_LIBRARIES})

endif ()

include(CMake_Bundler/CMakeLists.txt)
