cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-ocram-signed.bd -o image\IVT_ocram_signed.bin ..\..\..\example_images\led_demo_evk_ram_2020a000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_flexspinand_image_redundant1.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_ocram_signed.bin
pause