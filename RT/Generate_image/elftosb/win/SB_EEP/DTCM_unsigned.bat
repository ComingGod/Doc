..\elftosb.exe -V -f imx -c ..\..\..\bd_file\imx10xx\imx-dtcm-unsigned.bd -o ..\image\IVT_dtcm_unsigned.bin ..\..\..\..\example_images\led_demo_evk_ram_20002000.srec
..\elftosb.exe -V -f kinetis -c ..\..\..\bd_file\imx10xx\program_spinor_eeprom_image.bd -o "..\..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" ..\image\IVT_dtcm_unsigned_nopadding.bin
pause