@echo off


.\elftosb.exe -f imx -V -c  ..\..\bd_file\imx10xx\imx-itcm-encrypted.bd  -o  .\image\ivt_itcm_encryption_emmc_normal.bin  ..\..\..\example_images\led_demo_evk_ram_0x1400.srec
.\elftosb.exe -f kinetis -V -c  ..\..\bd_file\imx10xx\test\program_emmc_encrypt_image_keyblob.bd  -o  boot_image.sb  .\image\ivt_itcm_encryption_emmc_normal_nopadding.bin  dek.bin  

copy /Y boot_image.sb    ..\..\mfgtools-rel\Profiles\MXRT106X\"OS Firmware"\

REM 1.生成加ivt的 image.bin 
REM 2.将SD配置信息与image.bin 合并生成对应的sb文件
REM 为测试emmc encryption，program_emmc_encrypt_image_keyblob.bd为自己添加的文件，测试包中可能不存在!
pause