cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-semcnor-nonxip-itcm-unsigned.bd -o image\IVT_non_xip_itcm_unsigned.bin ..\..\..\example_images\led_demo_evk_ram_0x1400.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_semcnor_image.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_non_xip_itcm_unsigned_nopadding.bin
pause