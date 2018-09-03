cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor-nonxip-ocram-signed.bd -o image\IVT_flexspi_non_xip_ocram_signed.bin ..\..\..\example_images\led_demo_evk_ram_2020a000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspinor_image_hyperflash.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_flexspi_non_xip_ocram_signed_nopadding.bin
pause