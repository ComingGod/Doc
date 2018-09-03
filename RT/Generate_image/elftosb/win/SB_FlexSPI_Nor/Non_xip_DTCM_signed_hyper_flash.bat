cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-flexspinor-nonxip-dtcm-signed.bd -o image\IVT_flexspi_non_xip_DTCM_signed.bin ..\..\..\example_images\led_demo_evk_ram_20002000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspinor_image_hyperflash.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_flexspi_non_xip_DTCM_signed_nopadding.bin
pause