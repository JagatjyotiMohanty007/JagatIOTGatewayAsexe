#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "iothub_service_client" for configuration "Debug"
set_property(TARGET iothub_service_client APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_service_client PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/iothub_service_client.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil;uamqp"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/../bin/iothub_service_client.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_service_client )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_service_client "${_IMPORT_PREFIX}/lib/iothub_service_client.lib" "${_IMPORT_PREFIX}/lib/../bin/iothub_service_client.dll" )

# Import target "iothub_test" for configuration "Debug"
set_property(TARGET iothub_test APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_test PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "uamqp;iothub_service_client"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/iothub_test.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_test )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_test "${_IMPORT_PREFIX}/lib/iothub_test.lib" )

# Import target "iothub_client" for configuration "Debug"
set_property(TARGET iothub_client APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_client PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/iothub_client.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "iothub_client_http_transport;iothub_client_amqp_transport;iothub_client_amqp_ws_transport;iothub_client_mqtt_transport;iothub_client_mqtt_ws_transport;aziotsharedutil"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/../bin/iothub_client.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_client )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_client "${_IMPORT_PREFIX}/lib/iothub_client.lib" "${_IMPORT_PREFIX}/lib/../bin/iothub_client.dll" )

# Import target "iothub_client_http_transport" for configuration "Debug"
set_property(TARGET iothub_client_http_transport APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_client_http_transport PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/iothub_client_http_transport.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_client_http_transport )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_client_http_transport "${_IMPORT_PREFIX}/lib/iothub_client_http_transport.lib" )

# Import target "iothub_client_amqp_transport" for configuration "Debug"
set_property(TARGET iothub_client_amqp_transport APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_client_amqp_transport PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/iothub_client_amqp_transport.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_client_amqp_transport )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_client_amqp_transport "${_IMPORT_PREFIX}/lib/iothub_client_amqp_transport.lib" )

# Import target "iothub_client_amqp_ws_transport" for configuration "Debug"
set_property(TARGET iothub_client_amqp_ws_transport APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_client_amqp_ws_transport PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/iothub_client_amqp_ws_transport.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_client_amqp_ws_transport )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_client_amqp_ws_transport "${_IMPORT_PREFIX}/lib/iothub_client_amqp_ws_transport.lib" )

# Import target "iothub_client_mqtt_transport" for configuration "Debug"
set_property(TARGET iothub_client_mqtt_transport APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_client_mqtt_transport PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil;umqtt"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/iothub_client_mqtt_transport.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_client_mqtt_transport )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_client_mqtt_transport "${_IMPORT_PREFIX}/lib/iothub_client_mqtt_transport.lib" )

# Import target "iothub_client_mqtt_ws_transport" for configuration "Debug"
set_property(TARGET iothub_client_mqtt_ws_transport APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(iothub_client_mqtt_ws_transport PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil;umqtt"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/iothub_client_mqtt_ws_transport.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS iothub_client_mqtt_ws_transport )
list(APPEND _IMPORT_CHECK_FILES_FOR_iothub_client_mqtt_ws_transport "${_IMPORT_PREFIX}/lib/iothub_client_mqtt_ws_transport.lib" )

# Import target "serializer" for configuration "Debug"
set_property(TARGET serializer APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(serializer PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/serializer.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "aziotsharedutil"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/../bin/serializer.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS serializer )
list(APPEND _IMPORT_CHECK_FILES_FOR_serializer "${_IMPORT_PREFIX}/lib/serializer.lib" "${_IMPORT_PREFIX}/lib/../bin/serializer.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
