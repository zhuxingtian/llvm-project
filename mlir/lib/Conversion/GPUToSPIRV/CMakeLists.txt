set(LLVM_TARGET_DEFINITIONS GPUToSPIRV.td)
mlir_tablegen(GPUToSPIRV.cpp.inc -gen-rewriters)
add_public_tablegen_target(MLIRGPUToSPIRVIncGen)

add_mlir_conversion_library(MLIRGPUtoSPIRVTransforms
  ConvertGPUToSPIRV.cpp
  ConvertGPUToSPIRVPass.cpp

  DEPENDS
  MLIRGPUToSPIRVIncGen
  )

target_link_libraries(MLIRGPUtoSPIRVTransforms
  PUBLIC
  MLIRGPU
  MLIRIR
  MLIRPass
  MLIRSPIRV
  MLIRStandardOps
  MLIRStandardToSPIRVTransforms
  MLIRSupport
  MLIRTransforms
  )
