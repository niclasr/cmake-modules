#
# By Niclas Rosenvik <youremailsarecrap@gmail.com>
# This file is in the public domain
#
# Find the lzlib library, https://www.nongnu.org/lzip/lzlib.html
# Creates the imported target lzlib::lzlib if the library is found
#

find_path(LZLIB_INCLUDEDIR NAMES lzlib.h)
find_library(LZLIB_LIBRARY NAMES lz)

if(LZLIB_INCLUDEDIR)
  file(READ ${LZLIB_INCLUDEDIR}/lzlib.h LZLIB_H_CONTENTS)
  string(REGEX MATCH LZ_version_string[^\;]+\;
         LZLIB_VERSION_LINE "${LZLIB_H_CONTENTS}")
  string(REGEX MATCH \"[^\"]+\" LZLIB_VERSION_QUOTED "${LZLIB_VERSION_LINE}")
  string(REPLACE "\"" "" LZLIB_VERSION "${LZLIB_VERSION_QUOTED}")
endif()

set(LZLIB_MSG_OUT "I:${LZLIB_INCLUDEDIR} L:${LZLIB_LIBRARY}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(lzlib REQUIRED_VARS
                                  LZLIB_MSG_OUT
                                  LZLIB_INCLUDEDIR
                                  LZLIB_LIBRARY
                                  VERSION_VAR LZLIB_VERSION)

if(LZLIB_FOUND)
  add_library(lzlib::lzlib UNKNOWN IMPORTED)
  set_target_properties(lzlib::lzlib PROPERTIES
                        IMPORTED_LOCATION ${LZLIB_LIBRARY}
                        INTERFACE_INCLUDE_DIRECTORIES ${LZLIB_INCLUDEDIR})
endif()
