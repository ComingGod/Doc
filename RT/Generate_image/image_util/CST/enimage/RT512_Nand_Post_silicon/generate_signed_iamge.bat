@echo --------------------------- usage -------------------------------
@echo Generate_signed_iamge base_addr ivt_offset app_offset image_entry app_file csf_file
@echo -----------------------------------------------------------------
@echo base_addr    is   %1
@echo ivt_offset   is   %2
@echo app_offset   is   %3
@echo image_entry  is   %4
@echo app_file     is   %5
@echo csf_file     is   %6

@echo "generate image with IVT header"
imgutil.exe --combine base_addr=%1 ivt_offset=%2 app_offset=%3 image_entry=%4 app_file=%5 ofile=IVT.bin has_csf=1 
@choice /t 1 /d y /n >nul 
bin2c.exe bin2c array_name=IVT ifile=IVT.bin ofile=IVT.c

@echo "generate csf data..."
..\..\win64\cst -o csf.bin -i %6

@echo "generate signed image"
imgutil.exe  --sec_combine image_file=IVT.bin  csf_file=csf.bin ofile=signed.bin
@choice /t 1 /d y /n >nul 
bin2c.exe bin2c array_name=signed ifile=signed.bin ofile=signed.c
@echo &pause


