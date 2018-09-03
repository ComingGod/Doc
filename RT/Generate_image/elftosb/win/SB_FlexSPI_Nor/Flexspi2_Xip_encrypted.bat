cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor2-signed.bd -o image\IVT_flexspi2_xip_signed.bin ..\..\..\example_images\led_demo_evk_flexspi_nor_0x70002000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspi2nor_image_qspinor_encrypt.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_flexspi2_xip_signed_nopadding.bin
pause