cmd_arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dtb := mkdir -p arch/arm64/boot/dts/rockchip/ ; ./scripts/gcc-wrapper.py ./../prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc -E -Wp,-MD,arch/arm64/boot/dts/rockchip/.rk3326-sylvania-b107k.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm64/boot/dts/rockchip/.rk3326-sylvania-b107k.dtb.dts.tmp arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dtb -b 0 -iarch/arm64/boot/dts/rockchip/ -i./scripts/dtc/include-prefixes -@ -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-graph_port -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg  -d arch/arm64/boot/dts/rockchip/.rk3326-sylvania-b107k.dtb.d.dtc.tmp arch/arm64/boot/dts/rockchip/.rk3326-sylvania-b107k.dtb.dts.tmp ; cat arch/arm64/boot/dts/rockchip/.rk3326-sylvania-b107k.dtb.d.pre.tmp arch/arm64/boot/dts/rockchip/.rk3326-sylvania-b107k.dtb.d.dtc.tmp > arch/arm64/boot/dts/rockchip/.rk3326-sylvania-b107k.dtb.d

source_arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dtb := arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dts

deps_arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dtb := \

arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dtb: $(deps_arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dtb)

$(deps_arch/arm64/boot/dts/rockchip/rk3326-sylvania-b107k.dtb):
