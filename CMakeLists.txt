cmake_minimum_required(VERSION 3.20)
project(synth_xfer LANGUAGES CXX)

if(NOT CMAKE_CXX_COMPILER_ID)
  message(FATAL_ERROR "CMAKE_CXX_COMPILER_ID is not set; cannot detect C++ compiler.")
endif()

if(NOT (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang"))
  message(FATAL_ERROR
    "synth_xfer must be built with Clang or AppleClang, "
    "but CMAKE_CXX_COMPILER_ID='${CMAKE_CXX_COMPILER_ID}'.")
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(SYNTH_XFER_NINJA_COMPILE_POOL_SIZE "4" CACHE STRING
    "Ninja compile job-pool size (<=0 disables pool limit)")

find_package(pybind11 CONFIG REQUIRED)

set(SYNTH_XFER_SOURCES
  cpp/core/apint.hpp
  cpp/core/apint_inst.cpp
  cpp/core/domain.hpp
  cpp/core/enum.hpp
  cpp/core/eval.hpp
  cpp/core/rand.hpp

  cpp/domains/knownbits.hpp
  cpp/domains/mod.hpp
  cpp/domains/uconst_range.hpp
  cpp/domains/sconst_range.hpp

  cpp/bindings/bindings.cpp
  cpp/bindings/bindings_common.hpp
  cpp/bindings/bindings_helpers.cpp

  cpp/bindings/domains/bindings_knownbits.cpp
  cpp/bindings/domains/bindings_knownbits_bw_1_8.cpp
  cpp/bindings/domains/bindings_knownbits_bw_9_16.cpp
  cpp/bindings/domains/bindings_knownbits_bw_17_24.cpp
  cpp/bindings/domains/bindings_knownbits_bw_25_32.cpp

  cpp/bindings/domains/bindings_uconst_range.cpp
  cpp/bindings/domains/bindings_uconst_range_bw_1_8.cpp
  cpp/bindings/domains/bindings_uconst_range_bw_9_16.cpp
  cpp/bindings/domains/bindings_uconst_range_bw_17_24.cpp
  cpp/bindings/domains/bindings_uconst_range_bw_25_32.cpp

  cpp/bindings/domains/bindings_sconst_range.cpp
  cpp/bindings/domains/bindings_sconst_range_bw_1_8.cpp
  cpp/bindings/domains/bindings_sconst_range_bw_9_16.cpp
  cpp/bindings/domains/bindings_sconst_range_bw_17_24.cpp
  cpp/bindings/domains/bindings_sconst_range_bw_25_32.cpp

  cpp/bindings/domains/bindings_mod3.cpp
  cpp/bindings/domains/bindings_mod3_bw_1_8.cpp
  cpp/bindings/domains/bindings_mod3_bw_9_16.cpp
  cpp/bindings/domains/bindings_mod3_bw_17_24.cpp
  cpp/bindings/domains/bindings_mod3_bw_25_32.cpp

  cpp/bindings/domains/bindings_mod5.cpp
  cpp/bindings/domains/bindings_mod5_bw_1_8.cpp
  cpp/bindings/domains/bindings_mod5_bw_9_16.cpp
  cpp/bindings/domains/bindings_mod5_bw_17_24.cpp
  cpp/bindings/domains/bindings_mod5_bw_25_32.cpp

  cpp/bindings/domains/bindings_mod7.cpp
  cpp/bindings/domains/bindings_mod7_bw_1_8.cpp
  cpp/bindings/domains/bindings_mod7_bw_9_16.cpp
  cpp/bindings/domains/bindings_mod7_bw_17_24.cpp
  cpp/bindings/domains/bindings_mod7_bw_25_32.cpp

  cpp/bindings/domains/bindings_mod11.cpp
  cpp/bindings/domains/bindings_mod11_bw_1_8.cpp
  cpp/bindings/domains/bindings_mod11_bw_9_16.cpp
  cpp/bindings/domains/bindings_mod11_bw_17_24.cpp
  cpp/bindings/domains/bindings_mod11_bw_25_32.cpp

  cpp/bindings/domains/bindings_mod13.cpp
  cpp/bindings/domains/bindings_mod13_bw_1_8.cpp
  cpp/bindings/domains/bindings_mod13_bw_9_16.cpp
  cpp/bindings/domains/bindings_mod13_bw_17_24.cpp
  cpp/bindings/domains/bindings_mod13_bw_25_32.cpp
)

pybind11_add_module(_eval_engine ${SYNTH_XFER_SOURCES})
target_include_directories(_eval_engine PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/cpp/core
  ${CMAKE_CURRENT_SOURCE_DIR}/cpp/domains
  ${CMAKE_CURRENT_SOURCE_DIR}/cpp/bindings
)
target_link_libraries(_eval_engine PRIVATE pybind11::headers)
target_compile_features(_eval_engine PRIVATE cxx_std_20)
set_target_properties(_eval_engine PROPERTIES CXX_EXTENSIONS OFF)

if(CMAKE_GENERATOR MATCHES "Ninja")
  if(SYNTH_XFER_NINJA_COMPILE_POOL_SIZE GREATER 0)
    # Keep memory usage bounded by limiting parallel compile jobs.
    set_property(GLOBAL PROPERTY JOB_POOLS
      compile_pool=${SYNTH_XFER_NINJA_COMPILE_POOL_SIZE}
      link_pool=1)
    set_property(TARGET _eval_engine PROPERTY JOB_POOL_COMPILE compile_pool)
    set_property(TARGET _eval_engine PROPERTY JOB_POOL_LINK link_pool)
  endif()
endif()

target_compile_options(_eval_engine PRIVATE
  -Wall
  -Wextra
  -Wpedantic
  -Werror
  -Wshadow
  -Wconversion
  -Wsign-conversion
  -Wold-style-cast
  -Wcast-qual
  -Wformat=2
  -Wno-unused-command-line-argument
  -O3
  -DNDEBUG
  -fstrict-enums
)

# Add BMI2 when available on x86_64
include(CheckCXXCompilerFlag)
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
  check_cxx_compiler_flag(-mbmi2 HAS_MBMI2)
  if(HAS_MBMI2)
    target_compile_options(_eval_engine PRIVATE -mbmi2)
  endif()
endif()

if(APPLE AND CMAKE_OSX_ARCHITECTURES MATCHES ".+;.+")
  message(STATUS "Skipping -march=native for universal (multi-arch) build.")
else()
  target_compile_options(_eval_engine PRIVATE -march=native)
endif()

install(TARGETS _eval_engine DESTINATION synth_xfer)
