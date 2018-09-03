cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor-plugin-unsigned.bd -o image\IVT_flexspi_xip_plugin_unsigned.bin ..\..\..\example_images\plugin_boot_0x60002000.srec
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor-image-for-plugin-signed.bd -o image\Plugin_signed.bin ..\..\..\example_images\led_demo_evk_ram_20002000.srec

elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspinor_image_plugin_hyperflash.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_flexspi_xip_plugin_unsigned_nopadding.bin image\Plugin_signed.bin
pause