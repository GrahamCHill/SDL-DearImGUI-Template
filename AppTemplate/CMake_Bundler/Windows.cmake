
add_custom_command(
        TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        "${CMAKE_CURRENT_BINARY_DIR}/../external/SDL3/SDL3.dll"
        "${CMAKE_CURRENT_BINARY_DIR}/SDL3.dll"
)