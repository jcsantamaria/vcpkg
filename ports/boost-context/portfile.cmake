# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/context
    REF boost-1.68.0
    SHA512 6010cac31d408a9e4a47640b521da810240c697b529e85f97650f022397a55f1b509baf72076fa6e9ebec556c7a38d3da5045e9584c4dbde3d85fa61a5f91043
    HEAD_REF master
)

file(READ "${SOURCE_PATH}/build/Jamfile.v2" _contents)
string(REPLACE "import ../../config/checks/config" "import config/checks/config" _contents "${_contents}")
file(WRITE "${SOURCE_PATH}/build/Jamfile.v2" "${_contents}")
file(COPY "${CURRENT_INSTALLED_DIR}/share/boost-config/checks" DESTINATION "${SOURCE_PATH}/build/config")

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})

# boost-context removed all.hpp, which is used by FindBoost to determine that context is installed
if(NOT EXISTS ${CURRENT_PACKAGES_DIR}/include/boost/context/all.hpp)
    file(WRITE ${CURRENT_PACKAGES_DIR}/include/boost/context/all.hpp
        "#error \"#include <boost/context/all.hpp> is no longer supported by boost_context.\"")
endif()
