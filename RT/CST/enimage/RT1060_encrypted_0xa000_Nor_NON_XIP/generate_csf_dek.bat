@echo --------------------------- usage -------------------------------
@echo generate_csf_dek.bat csf_file
@echo -----------------------------------------------------------------
@echo csf_file     is   %1

::@echo "generate csf and dek , RAW image will be replaced with encrypted image"


cd ..\..\keys
..\win64\cst -o ..\enimage\RT1060_encrypted_0xa000_Nor_NON_XIP\csf.bin -i ..\enimage\RT1060_encrypted_0xa000_Nor_NON_XIP\%1

cd ..
cd enimage\RT1060_encrypted_0xa000_Nor_NON_XIP





