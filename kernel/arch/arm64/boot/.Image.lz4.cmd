cmd_arch/arm64/boot/Image.lz4 := (cat arch/arm64/boot/Image | lz4c -c1 stdin stdout && printf \\010\\350\\303\\001) > arch/arm64/boot/Image.lz4 || (rm -f arch/arm64/boot/Image.lz4 ; false)
