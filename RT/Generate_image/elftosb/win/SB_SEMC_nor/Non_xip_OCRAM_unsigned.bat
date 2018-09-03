cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-semcnor-nonxip-ocram-unsigned.bd -o image\IVT_non_xip_ocram_unsigned.bin ..\..\..\example_images\led_demo_evk_ram_2020a000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_semcnor_image.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_non_xip_ocram_unsigned_nopadding.bin
pause