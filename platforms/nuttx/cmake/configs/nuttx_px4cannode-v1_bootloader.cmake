include(nuttx/px4_impl_nuttx)

px4_nuttx_configure(HWCLASS m3 CONFIG bootloader)

set(px4_src_base ${CMAKE_SOURCE_DIR}/src/)
set(px4_bootloader_base ${CMAKE_SOURCE_DIR}/platforms/nuttx/src/drivers/bootloaders/)
set(px4_module_base ${px4_src_base}modules/)

#
# UAVCAN boot loadable Module ID

#
# Bring in common uavcan hardware identity definitions
#

include(configs/uavcan_board_ident/px4cannode-v1)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/platforms/nuttx/cmake/toolchains/Toolchain-arm-none-eabi.cmake)

set(config_module_list

	drivers/boards/px4cannode-v1/bootloader

)

#
# Bootloaders use a compact vector table not
# from the lib, but exported in startup
#
set(nuttx_startup_files stm32_vectors.o)
