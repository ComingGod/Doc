@echo off

cd ..
.\elftosb.exe -f imx -V -c  ..\..\bd_file\imx10xx\imx-dtcm-unsigned.bd  -o  .\image\ivt_dtcm_unsigned_emmc_normal.bin  ..\..\..\example_images\led_demo_evk_ram_20002000.srec
.\elftosb.exe -f kinetis -V -c  ..\..\bd_file\imx10xx\program_mmccard_image_normal.bd  -o  boot_image.sb  .\image\ivt_dtcm_unsigned_emmc_normal_nopadding.bin 


copy /Y boot_image.sb    ..\..\mfgtools-rel\Profiles\MXRT106X\"OS Firmware"\

REM 1.生成加ivt的 image.bin 
REM 2.将SD配置信息与image.bin 合并生成对应的sb文件
pause