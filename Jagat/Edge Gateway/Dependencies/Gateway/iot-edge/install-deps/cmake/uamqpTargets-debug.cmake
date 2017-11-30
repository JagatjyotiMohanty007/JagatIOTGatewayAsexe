#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "uamqp" for configuration "Debug"
set_property(TARGET uamqp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(uamqp PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/uamqp.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS uamqp )
list(APPEND _IMPORT_CHECK_FILES_FOR_uamqp "${_IMPORT_PREFIX}/lib/uamqp.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
