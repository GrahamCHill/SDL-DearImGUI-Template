# Add Tiny File Dialog include directories
include_directories(
        ${SUBMODULE_CMAKE}/tinyfd
        ${SUBMODULE_CMAKE}/tinyfd/more_dialogs
)

set(TINYFD_REQ
        ${SUBMODULE_CMAKE}/tinyfd/tinyfiledialogs.c
        ${SUBMODULE_CMAKE}/tinyfd/tinyfiledialogs.h
#        ${SUBMODULE_CMAKE}/tinyfd/tinyfd_moredialogs.c
#        ${SUBMODULE_CMAKE}/tinyfd/tinyfd_moredialogs.h
)