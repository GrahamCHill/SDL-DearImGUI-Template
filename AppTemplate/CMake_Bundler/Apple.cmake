set_target_properties(${PROJECT_NAME}
        PROPERTIES
        MACOSX_BUNDLE_BUNDLE_NAME ${PROJECT_NAME}
        MACOSX_BUNDLE_COPYRIGHT "${MAC_COPYRIGHT}, ${PROJECT_NAME}, All Rights Reserved."
        MACOSX_BUNDLE_GUI_IDENTIFIER "${PROJECT_NAME}.${MAC_GUI_IDENTIFIER}"
        MACOSX_BUNDLE_ICON_FILE "${MAC_APP_IMAGE}"
        MACOSX_BUNDLE_BUNDLE_VERSION ${MAC_BUNDLE_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${MAC_BUNDLE_SHORT_VERSION}
        MACOSX_BUNDLE TRUE
        XCODE_ATTRIBUTE_ENABLE_HARDENED_RUNTIME ${MAC_HARDENED_RUNTIME}
        XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "${MAC_XCODE_IDENTIFIER}.${PROJECT_NAME}"
        BUILD_WITH_INSTALL_RPATH ${MAC_WITH_INSTAlL_RPATH}
        INSTALL_RPATH "${MAC_INSTAlL_RPATH_PATH}"
)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/"
        COMMAND ${CMAKE_COMMAND} -E make_directory
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources/"
)

# Special packaging for rendering backends
if (GRAPHICS_BACKEND STREQUAL "VULKAN")
    message(STATUS "Vulkan Packaging Logic Running")
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
            # Copying Vulkan Files, The library will link to these and if it fails
            COMMAND ${CMAKE_COMMAND} -E make_directory
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources/vulkan/icd.d/"
            COMMAND ${CMAKE_COMMAND} -E copy
            "$ENV{HOME}/VulkanSDK/${VULKAN_VERSION}/macOS/lib/${VULKAN_LIB}"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/libvulkan.1.dylib"
            COMMAND ${CMAKE_COMMAND} -E copy
            "$ENV{HOME}/VulkanSDK/${VULKAN_VERSION}/macOS/lib/${VULKAN_LIB}"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/${VULKAN_LIB}"
            COMMAND ${CMAKE_COMMAND} -E copy
            "$ENV{HOME}/VulkanSDK/${VULKAN_VERSION}/macOS/lib/libMoltenVK.dylib"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/libMoltenVK.dylib"
            COMMAND ${CMAKE_COMMAND} -E copy
            "${CMAKE_CURRENT_SOURCE_DIR}/MoltenVK_icd.json"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources/vulkan/icd.d/MoltenVK_icd.json"

            # Changing install-path for executable
            COMMAND install_name_tool -change
            "@rpath/libvulkan.1.dylib"
            "${MAC_INSTAlL_RPATH_PATH}/libvulkan.1.dylib" # @executable_path/../libvulkan.1.dylib
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/MacOS/${PROJECT_NAME}"
    )
    message(STATUS "Vulkan Packaging Logic Complete")

elseif (GRAPHICS_BACKEND STREQUAL "OPENGL")
    message(STATUS "OpenGL Packaging Logic Running")

    message(STATUS "OpenGL Packaging Logic Complete")

elseif (GRAPHICS_BACKEND STREQUAL "METAL")
    message(STATUS "Metal Packaging Logic Running")

    message(STATUS "Metal Packaging Logic Complete")

else () # SDL RENDERER
    message(STATUS "SDL RENDERER Packaging Logic Running")

    message(STATUS "SDL RENDERER Packaging Logic Complete")
endif()



# Copies, relinks SDL3, adds folders in App bundle
#
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        # This is what copies the SDL3 Frameworks over to the output binary
        COMMAND ${CMAKE_COMMAND} -E copy
        "${CMAKE_CURRENT_BINARY_DIR}/../External/SDL3/libSDL2-2.0.0.dylib"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/libSDL2-2.0.0.dylib"
        COMMAND install_name_tool -change
        "@rpath/libSDL2-2.0.0.dylib"
        "${MAC_INSTAlL_RPATH_PATH}/libSDL2-2.0.0.dylib"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/MacOS/${PROJECT_NAME}"
)

# Use file(GLOB ...) to get the list of files matching the wildcard pattern
file(GLOB SOURCE_FILES "${SOURCE_DIR}/${SOURCE_PATTERN}")
message(STATUS "${SOURCE_FILES}")

# Iterate over the list of source files and add a custom command for each one
foreach(SOURCE_FILE ${SOURCE_FILES})
    # Get the file name from the full path
    get_filename_component(FILE_NAME ${SOURCE_FILE} NAME)
    # Define the destination file path
    set(DESTINATION_FILE "${DESTINATION_DIR}/${FILE_NAME}")
    message(STATUS "${DESTINATION_FILE}")
    message(STATUS "${SOURCE_FILE}")
    # Add a custom command to copy the file after building the target
    add_custom_command(
            TARGET ${PROJECT_NAME}
            POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy
            "${SOURCE_FILE}"
            "${DESTINATION_FILE}"
    )
endforeach()


# Make sure this is last thing in the build to prevent possible errors
if(CODE_SIGN)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND /usr/bin/codesign --deep --force --verify --verbose --sign
        ${SIGN_ID}
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app"
        COMMENT "Signing the app bundle"
)
endif ()