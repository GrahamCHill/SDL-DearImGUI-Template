# The pattern for copying files to the resources directory
# Defualt is a Fuzzy copy, that copies everything
set(SOURCE_PATTERN "*.*")

set(ICONS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/AppIcon")

# Apple Specific Settings
if(APPLE)
    set(CODE_SIGN FALSE)
    # Run the following command to find your Signing ID
    # security find-identity -p codesigning -v
    # Just replace the placeholder in the code below if CODE_SIGN is true
    set(SIGN_ID "Apple Development: your-email@email.com \\(j3rgt32tfs\\)")
    # Found in $ENV{HOME}/VulkanSDK/${VULKAN_VERSION}/macOS/lib/
    # ie /Users/graham/VulkanSDK/1.3.283.0/macOS/lib/
    set(VULKAN_LIB "libvulkan.1.3.283.dylib")
    set(VULKAN_VERSION 1.3.283.0)
    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources")
    # Set Bundle Info
    set(MAC_COPYRIGHT "Copyright © 1995-2009")
    set(MAC_GUI_IDENTIFIER "grahamhill.dev")
    set(MAC_XCODE_IDENTIFIER "dev.grahamhill")
    set(MAC_APP_IMAGE "myAppImage.icns")
    set(MAC_BUNDLE_VERSION 1.0)
    set(MAC_BUNDLE_SHORT_VERSION 1.0)
    set(MAC_HARDENED_RUNTIME YES)
    set(MAC_WITH_INSTAlL_RPATH TRUE)
    set(MAC_INSTAlL_RPATH_PATH "@executable_path/../Frameworks")
endif()
# Linux Specific Settings
if (NOT APPLE AND UNIX)
    # Make sure patchelf is installed before changing the below to TRUE
    # pip install patchelf
    # https://github.com/NixOS/patchelf
    set(EASY_PORTABLE FALSE)
endif()
# Windows Specific Settings
if (NOT APPLE AND NOT UNIX)
    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/../Resources")
endif()
