# Extra flags defined on each build type (this file is all optional to include)
#
#

# -------------------------- 
#        Debug BUILD 
# -------------------------- 

# -- Compiler flags -------------------------------------------------
set(RELION_FLAGS_DEBUG "-O0" CACHE STRING "")
set(RELION_NVCC_FLAGS_DEBUG "-lineinfo -G -arch=sm_35 --disable-warnings" CACHE STRING "")
# -- Linker flags ---------------------------------------------------
set(RELION_LINKER_FLAGS_DEBUG  " ")

# -- Append compiler and linker flags -------------------------------
set(CMAKE_CXX_FLAGS_DEBUG        "${CMAKE_CXX_FLAGS_DEBUG} ${RELION_FLAGS_DEBUG}")
set(CMAKE_C_FLAGS_DEBUG          "${CMAKE_C_FLAGS_DEBUG} ${RELION_FLAGS_DEBUG}")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} ${RELION_LINKER_FLAGS_DEBUG}")
set(CUDA_NVCC_FLAGS_DEBUG        "${RELION_NVCC_FLAGS_DEBUG}")

# -- Add preprocessor defintions --------q----------------------------
# This should work, but doesn't for some reason
#set(RELION_DEFINITIONS_DEBUG "CUDA_DOUBLE_PRECISION; DEBUG_CUDA; DRELION_TESTING" CACHE STRING "")
#set(COMPILE_DEFINITIONS_DEBUG "${RELION_DEFINITIONS_DEBUG} " CACHE STRING "")

set(RELION_DEFINITIONS_DEBUG "-DDEBUG_CUDA -DCUDA_BENCHMARK -DUSE_THRUST" CACHE STRING "")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${RELION_DEFINITIONS_DEBUG}")

#message(STATUS "Set the extra flags for Debug build type")
message(STATUS "RELION_FLAGS_DEBUG : ${RELION_FLAGS_DEBUG}")
message(STATUS "CMAKE_CXX_FLAGS_DEBUG : ${CMAKE_CXX_FLAGS_DEBUG}")
#--------------------------------------------------------------------


# -------------------------- 
#       Release BUILD 
# -------------------------- 

# -- Compiler flags -------------------------------------------------
#
#   -pg		gprof profiling output (needs linker flag)
#
set(RELION_FLAGS_RELEASE "" CACHE STRING "")
set(RELION_NVCC_FLAGS_RELEASE "-arch=sm_35 --default-stream per-thread --disable-warnings" CACHE STRING "")
# -- Linker flags ---------------------------------------------------
set(RELION_LINKER_FLAGS_RELEASE  "")

# -- Append compiler and linker flags -------------------------------
message(STATUS "CCF_RELEASE :       ${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_RELEASE        "${CMAKE_CXX_FLAGS_RELEASE} ${RELION_FLAGS_RELEASE}"        CACHE STRING "")
set(CMAKE_C_FLAGS_RELEASE          "${CMAKE_C_FLAGS_RELEASE} ${RELION_FLAGS_RELEASE}"          CACHE STRING "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${RELION_LINKER_FLAGS_RELEASE}" CACHE STRING "")
set(CUDA_NVCC_FLAGS_RELEASE        "${RELION_NVCC_FLAGS_RELEASE}"                                     CACHE STRING "")

# -- Add preprocessor defintions ------------------------------------
set(RELION_DEFINITIONS_RELEASE "-DUSE_THRUST" CACHE STRING "")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${RELION_DEFINITIONS_RELEASE}")

message(STATUS "RELION_FLAGS_PROFILING : ${RELION_FLAGS_PROFILING}")
message(STATUS "CMAKE_CXX_FLAGS_PROFILING : ${CMAKE_CXX_FLAGS_PROFILING}")
#--------------------------------------------------------------------





# ---------------------------------- 
#       Profiling BUILD 
#  (Release with profiling output) 
# ----------------------------------
# ** NOTE: this will not have overall Release perf. **

# -- Compiler flags -------------------------------------------------
#
#   -pg		gprof profiling output (needs linker flag)
#
set(RELION_FLAGS_PROFILING "" CACHE STRING "")
set(RELION_NVCC_FLAGS_PROFILING "-lineinfo -arch=sm_52 --disable-warnings" CACHE STRING "")
# -- Linker flags ---------------------------------------------------
set(RELION_LINKER_FLAGS_PROFILING  "")

# -- Append compiler and linker flags -------------------------------
message(STATUS "CCF_RELEASE :         ${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_PROFILING        "${CMAKE_CXX_FLAGS_RELEASE} ${RELION_FLAGS_PROFILING}"        CACHE STRING "")
set(CMAKE_C_FLAGS_PROFILING          "${CMAKE_C_FLAGS_RELEASE} ${RELION_FLAGS_PROFILING}"        CACHE STRING "")
set(CMAKE_EXE_LINKER_FLAGS_PROFILING "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${RELION_LINKER_FLAGS_PROFILING}" CACHE STRING "")
set(CUDA_NVCC_FLAGS_PROFILING        "${RELION_NVCC_FLAGS_PROFILING}"                                     CACHE STRING "")

# -- Add preprocessor defintions ------------------------------------
set(RELION_DEFINITIONS_PROFILING "-DCUDA_BENCHMARK -DUSE_THRUST" CACHE STRING "")
set(CMAKE_CXX_FLAGS_PROFILING "${CMAKE_CXX_FLAGS_PROFILING} ${RELION_DEFINITIONS_PROFILING}")

message(STATUS "RELION_FLAGS_PROFILING : ${RELION_FLAGS_PROFILING}")
message(STATUS "CMAKE_CXX_FLAGS_PROFILING : ${CMAKE_CXX_FLAGS_PROFILING}")
#--------------------------------------------------------------------