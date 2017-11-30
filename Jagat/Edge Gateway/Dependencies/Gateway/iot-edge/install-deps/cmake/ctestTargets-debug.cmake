#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ctest" for configuration "Debug"
set_property(TARGET ctest APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(ctest PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/ctest.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ctest )
list(APPEND _IMPORT_CHECK_FILES_FOR_ctest "${_IMPORT_PREFIX}/lib/ctest.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
