elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-dtcm-signed.bd -o IVT_flashloader_signed.bin ..\..\..\Flashloader\flashloader.srec
..\..\sdphost\win\sdphost.exe -u 0x1fc9,0x0135 -- write-file 0x20000000 IVT_flashloader_signed.bin
..\..\sdphost\win\sdphost.exe -u 0x1fc9,0x0135 -- jump-address 0x20000400
choice /t 1 /d y /n >nul 

..\..\blhost\win\blhost.exe -u -- get-property 1
pause