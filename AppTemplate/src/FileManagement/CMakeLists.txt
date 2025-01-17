set(FILEMANAGEMENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR}/src/FileManagement)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/src/FileManagement
)

set(FILEMANAGEMENT_MAIN
        ${FILEMANAGEMENT_FOLDER}/fileDialog.h
        ${FILEMANAGEMENT_FOLDER}/fileDialog.cpp
        ${FILEMANAGEMENT_FOLDER}/imguiSettingsManager.h
        ${FILEMANAGEMENT_FOLDER}/imguiSettingsManager.cpp
)