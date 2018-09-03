cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor-normal-unsigned.bd -o image\IVT_flexspi_xip_unsigned.bin ..\..\..\example_images\led_demo_evk_flexspi_nor_0x60002000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspinor_image_hyperflash.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_flexspi_xip_unsigned_nopadding.bin
pause