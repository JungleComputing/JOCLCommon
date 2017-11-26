# Overriding the CMake flags to use static runtime libraries
# See http://www.cmake.org/Wiki/CMake_FAQ#
#     How_can_I_build_my_MSVC_application_with_a_static_runtime.3F
if(MSVC)
    set(CMAKE_C_FLAGS_DEBUG_INIT "/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1")
    set(CMAKE_C_FLAGS_MINSIZEREL_INIT     "/MT /O1 /Ob1 /D NDEBUG")
    set(CMAKE_C_FLAGS_RELEASE_INIT        "/MT /O2 /Ob2 /D NDEBUG")
    set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "/MT /Zi /O2 /Ob1 /D NDEBUG")
elseif(ANDROID)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fpermissive")
elseif(CMAKE_HOST_UNIX)
    set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
endif()