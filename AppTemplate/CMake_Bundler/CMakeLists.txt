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

    if (CMAKE_BUILD_TYPE STREQUAL "Debug" AND APPLE AND NOT USE_BUNDLER)
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                COMMAND install_name_tool -change
                "@rpath/libSDL2-2.0d.0.dylib"
                "@executable_path/../External/SDL2/libSDL2-2.0d.0.dylib"
                "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}"
        )
    elseif (CMAKE_BUILD_TYPE STREQUAL "Release" AND APPLE AND NOT USE_BUNDLER)
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                COMMAND install_name_tool -change
                "@rpath/libSDL2-2.0.0.dylib"
                "@executable_path/../External/SDL2/libSDL2-2.0.0.dylib"
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