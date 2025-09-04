@echo off
setlocal enabledelayedexpansion

set "root=D:\PNBMV CSO OLD SERVER DATA\KL118 TOWER\02 - Commercial\10-Contractor Management\01-Contractor Advertisement and Prequalification"
set "tempfile=%temp%\paths.txt"

rem Collect all files with their lengths
> "%tempfile%" (
    for /r "%root%" %%F in (*) do (
        set "filepath=%%F"
        call :strlen "%%F" len
        echo !len! ^| %%F
    )
)

rem Sort by length (numeric, descending) and take top 5
(for /f "usebackq tokens=1* delims=|" %%A in (`sort /r /+1 "%tempfile%"`) do (
    echo Length: %%A
    echo Path:   %%B
    echo.
)) | more +0 > "D:\top5_longest_paths.txt"

del "%tempfile%"

echo Done! Results saved in D:\top5_longest_paths.txt
exit /b

:strlen
setlocal enabledelayedexpansion
set "s=%~1"
set /a len=0
for %%I in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
    if "!s:~%%I,1!" NEQ "" (
        set /a len+=%%I
        set "s=!s:~%%I!"
    )
)
endlocal & set "%~2=%len%"
goto :eof
