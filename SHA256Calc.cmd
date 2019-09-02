@echo off
echo Working...
if exist .\SHA256Results.txt del .\SHA256Results.txt
echo This file was generated on: %date% %time%> SHA256Results.txt
echo ********************************************************>> SHA256Results.txt
powershell -command get-childitem -file * -exclude SHA256* ^| get-filehash ^|format-table hash,@{n='FileName';e={'  ........*' + (split-path $_.path -leaf )}} -wrap -autosize | out-file -Filepath .\SHA256Results.txt
echo Done. Check SHA256Results.txt for your output.
start notepad .\SHA256Results.txt
pause
