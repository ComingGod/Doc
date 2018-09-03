cd ..
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-dtcm-encrypted.bd -o image\IVT_dtcm_encrypted.bin ..\..\..\example_images\led_demo_evk_ram_20002000.srec
elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\program_spinor_eeprom_image_encrypt_image_keyblob_DTCM.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\boot_image.sb" image\IVT_dtcm_encrypted_nopadding.bin  dek.bin
pause