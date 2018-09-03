imgutil.exe  --sec_combine image_file=IVT.bin csf_file=csf.bin blob_file=blob.bin ofile=encrypted.bin

choice /t 1 /d y /n >nul 

bin2c.exe bin2c array_name=encrypted ifile=encrypted.bin ofile=encrypted.c

echo &pause
