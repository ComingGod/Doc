cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor-normal-signed.bd -o image\IVT_flexspi_xip_signed.bin ..\..\..\example_images\led_demo_evk_flexspi_nor_0x60002000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspinor_image_mt35_encrypted.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_flexspi_xip_signed_nopadding.bin
pause