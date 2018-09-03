@echo off
cd ..
.\elftosb.exe -f imx -V -c  ..\..\bd_file\imx10xx\imx-ocram-unsigned.bd  -o  .\image\ivt_ocram_unsigned_sd.bin  ..\..\..\example_images\led_demo_evk_ram_2020a000.srec
.\elftosb.exe -f kinetis -V -c  ..\..\bd_file\imx10xx\program_sdcard_image.bd  -o  boot_image.sb  .\image\ivt_ocram_unsigned_sd_nopadding.bin

copy /Y boot_image.sb    ..\..\..\mfgtools-rel\Profiles\MXRT106X\"OS Firmware"\

REM 1.生成加ivt的 image.bin 
REM 2.将SD配置信息与image.bin 合并生成对应的sb文件

@echo &pause

