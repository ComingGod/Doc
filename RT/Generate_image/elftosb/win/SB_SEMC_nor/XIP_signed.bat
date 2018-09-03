cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-semcnor-xip-signed.bd -o image\IVT_SEMC_xip_signed.bin ..\..\..\example_images\led_demo_evk_semc_nor_0x90002000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_semcnor_image.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_SEMC_xip_signed_nopadding.bin
pause