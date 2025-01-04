if(USE_BUNDLER)
    message(STATUS "Using Bundler")
    set(BUNDLER_CMAKE ${CMAKE_CURRENT_SOURCE_DIR}/CMake_Bundler)
    include(${BUNDLER_CMAKE}/Option.cmake)
    if (APPLE)
        include(${BUNDLER_CMAKE}/Apple.cmake)
    elseif (WIN32)
        include(${BUNDLER_CMAKE}/Windows.cmake)
    else ()
        include(${BUNDLER_CMAKE}/Linux.cmake)
    endif ()
    message(STATUS "Bundling Complete!")
else()
    message(STATUS "Not Using Bundler")
    if (APPLE)
            message(NOTICE "Remember to update where your Vulkan Install is, for a Release build")
            add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                    COMMAND install_name_tool -change
                    "@rpath/libSDL3.0.dylib"
                    "@executable_path/../External/SDL3/libSDL3.0.dylib"
                    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}"
            )
    endif ()

    if (WIN32)
        add_custom_command(
                TARGET ${PROJECT_NAME} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy
                "${CMAKE_CURRENT_BINARY_DIR}/../external/SDL3/SDL3.dll"
                "${CMAKE_CURRENT_BINARY_DIR}/SDL3.dll"
        )
    endif ()
endif()