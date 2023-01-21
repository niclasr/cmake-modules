#
# By Niclas Rosenvik <youremailsarecrap@gmail.com>
# This file is in the public domain
#
# Find Apples lzfse library, https://github.com/lzfse/lzfse
# Creates the imported target lzfse::lzfse if the library is found
#

find_path(LZFSE_INCLUDEDIR NAMES lzfse.h)
find_library(LZFSE_LIBRARY NAMES lzfse)

set(LZFSE_MSG_OUT "I:${LZFSE_INCLUDEDIR} L:${LZFSE_LIBRARY}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(lzfse REQUIRED_VARS
                                  LZFSE_MSG_OUT
                                  LZFSE_INCLUDEDIR
                                  LZFSE_LIBRARY)

if(LZFSE_FOUND)
  add_library(lzfse::lzfse UNKNOWN IMPORTED)
  set_target_properties(lzfse::lzfse PROPERTIES
                        IMPORTED_LOCATION ${LZFSE_LIBRARY}
                        INTERFACE_INCLUDE_DIRECTORIES ${LZFSE_INCLUDEDIR})
endif()
