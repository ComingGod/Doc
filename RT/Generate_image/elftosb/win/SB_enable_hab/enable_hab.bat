cd ..

elftosb.exe -V -f kinetis -c ..\..\bd_file\imx10xx\enable_hab.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\enable_hab.sb"
elftosb.exe -V -f imx -c ..\..\bd_file\imx10xx\imx-dtcm-signed.bd -o "..\..\mfgtools-rel\Profiles\MXRT106X\OS Firmware\ivt_flashloader_signed.bin" ..\..\..\Flashloader\flashloader.srec

REM .\..\sdphost\win\sdphost.exe -u 0x1fc9,0x0135 -- write-file 0x20000000 IVT_flashloader_signed.bin
REM ..\..\sdphost\win\sdphost.exe -u 0x1fc9,0x0135 -- jump-address 0x20000400

REM choice /t 1 /d y /n >nul 
REM ..\..\blhost\win\blhost.exe -u -- get-property 1
REM ..\..\blhost\win\blhost.exe -u -- receive-sb-file SB_enable_hab\enable_hab.sb

REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x10
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x11
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x12
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x13
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x14
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x15
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x16
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x17
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x18
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x19
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x1a
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x1b
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x1c
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x1d
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x1e
REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x1f

REM ..\..\blhost\win\blhost.exe -u -- efuse-read-once 0x6


pause