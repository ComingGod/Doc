cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-ocram-unsigned.bd -o image\IVT_ocram_unsigned.bin ..\..\..\example_images\led_demo_evk_ram_2020a000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_semcnand_image.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_ocram_unsigned.bin
pause