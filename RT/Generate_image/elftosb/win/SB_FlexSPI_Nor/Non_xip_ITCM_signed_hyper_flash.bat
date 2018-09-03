cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor-nonxip-itcm-signed.bd -o image\IVT_flexspi_non_xip_ITCM_signed.bin ..\..\..\example_images\led_demo_evk_ram_0x1400.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspinor_image_hyperflash.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_flexspi_non_xip_ITCM_signed_nopadding.bin
pause