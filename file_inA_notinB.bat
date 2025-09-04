@echo off
setlocal

rem Roots
set "A=M:\15-Contractor Payment"
set "B=D:\PNBMV CSO OLD SERVER DATA\KL118 TOWER\02 - Commercial\10-Contractor Management\15-Contractor Payment"
set "OUT=M:\15-files_in_B_not_in_A.txt"

rem List files that exist in B but not in A (EXTRA files in destination).
> "%OUT%" (
  for /f "tokens=3,*" %%P in ('
    robocopy "%A%" "%B%" /MIR /L /NJH /NJS /NDL /NP /R:0 /W:0 /FP ^| findstr /C:"EXTRA File"
  ') do (
    echo %%P %%Q
  )
)

echo Done. Missing-in-A files written to: "%OUT%"
exit /b
