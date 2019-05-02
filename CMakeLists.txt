cmake_minimum_required(VERSION 3.0)
project (service)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake OPTIONAL RESULT_VARIABLE HAS_CONAN)
if (NOT HAS_CONAN)
  message(FATAL_ERROR "missing conanbuildinfo.cmake did you forget to run conan install ?")
endif()
conan_basic_setup()

include(os)

# Source files to be linked with OS library parts to form bootable image
set(SOURCES
  service.cpp
  )
os_add_executable(service "TCP test" ${SOURCES})

os_add_drivers(service
  virtionet
  boot_logger
)
os_add_stdout(service default_stdout)
