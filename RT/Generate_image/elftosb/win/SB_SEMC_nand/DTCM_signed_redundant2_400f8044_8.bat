cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-dtcm-signed.bd -o image\IVT_dtcm_signed.bin ..\..\..\example_images\led_demo_evk_ram_20002000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_semcnand_image_redundant2.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_dtcm_signed.bin
pause