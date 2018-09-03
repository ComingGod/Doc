@echo --------------------------- usage -------------------------------
@echo Generate_signed_iamge base_addr ivt_offset app_offset image_entry app_file 
@echo -----------------------------------------------------------------
@echo base_addr    is   %1
@echo ivt_offset   is   %2
@echo app_offset   is   %3
@echo image_entry  is   %4
@echo app_file     is   %5

@echo "generate image with IVT header"
imgutil.exe --combine base_addr=%1 ivt_offset=%2 app_offset=%3 image_entry=%4 app_file=%5 ofile=IVT.bin has_csf=1 has_blob=1
@choice /t 1 /d y /n >nul 
bin2c.exe bin2c array_name=IVT ifile=IVT.bin ofile=IVT.c



