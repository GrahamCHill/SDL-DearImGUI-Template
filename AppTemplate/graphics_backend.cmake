if (GRAPHICS_BACKEND STREQUAL "VULKAN")
    message(STATUS "Graphics backend is set to VULKAN.")

    find_package(Vulkan REQUIRED)
    message(STATUS "Vulkan Library Location: ${Vulkan_LIBRARIES}" )
    set(GRAPHICS_INCLUDE_DIRECTORIES ${Vulkan_INCLUDE_DIRS})
    set(GRAPHICS_INCLUDE_LIBRARIES ${Vulkan_LIBRARIES})
elseif (GRAPHICS_BACKEND STREQUAL "OPENGL")
    message(STATUS "Graphics backend is set to OPENGL.")

    find_package(OpenGL)
    message(STATUS "OpenGL Library Location: ${OpenGL_LIBRARIES}" )
    set(GRAPHICS_INCLUDE_LIBRARIES OpenGL::GL)

elseif (GRAPHICS_BACKEND STREQUAL "METAL")
    message(STATUS "Graphics backend is set to Metal -- will use default for other platforms.")
    if (APPLE)
        # Metal Configuration for macOS
        message(WARNING "DearIMGUI Multi-window is not supported yet!!!")
        message( "Do not enable io.ConfigFlags |= ImGuiConfigFlags_ViewportsEnable; in your code")

        find_library(METAL_LIBRARY "Metal" REQUIRED)
        find_library(METALKIT_LIBRARY "MetalKit" REQUIRED)
        find_library(COCOA_LIBRARY "COCOA" REQUIRED)
        find_library(IOKIT_LIBRARY "IOKit" REQUIRED)
        find_library(COREVIDEO_LIBRARY "CoreVideo" REQUIRED)
        find_library(QUARTZ_LIBRARY "QuartzCore" REQUIRED)
        # -framework Metal -framework MetalKit -framework Cocoa
        #-framework IOKit -framework CoreVideo -framework QuartzCore

        # Link Metal and Foundation frameworks
        set(GRAPHICS_INCLUDE_LIBRARIES PRIVATE ${METAL_LIBRARY} ${METALKIT_LIBRARY} ${COCOA_LIBRARY}
                ${QUARTZ_LIBRARY} ${IOKIT_LIBRARY} ${COREVIDEO_LIBRARY}
        )

        message(STATUS "Configured for Metal on macOS")

    elseif (WIN32)
        # !!! UNTESTED !!!
        # DirectX Configuration for Windows
        # Link DirectX libraries
        set(GRAPHICS_INCLUDE_LIBRARIES  d3d11.lib dxgi.lib )
        # Add DirectX headers (optional, if custom paths are needed)
        set(GRAPHICS_INCLUDE_DIRECTORIES ${DirectX_INCLUDE_DIRS})

        message(STATUS "Configured for DirectX on Windows")

    else () # Linux will default to Vulkan
        find_package(Vulkan REQUIRED)
        message(STATUS "Vulkan Library Location: ${Vulkan_LIBRARIES}" )
        set(GRAPHICS_INCLUDE_DIRECTORIES ${Vulkan_INCLUDE_DIRS})
        set(GRAPHICS_INCLUDE_LIBRARIES ${Vulkan_LIBRARIES})
    endif ()
else ()
    message(STATUS "Graphics backend is not set -- will use SDL Renderer for all platforms.")
    message(STATUS "Graphics backend is set to use default SDL renderer.")
    message(WARNING "It is better to choose a specific renderer like \"VULKAN\" or \"METAL\" or \"OPENGL\"")

endif()
