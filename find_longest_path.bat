@echo off
setlocal enabledelayedexpansion

set "root=M:\10-Contractor Contracts"
set "maxlen=0"
set "longest="

for /r "%root%" %%F in (*) do (
    set "filepath=%%F"
    set "len=0"
    call :strlen "%%F" len
    if !len! gtr !maxlen! (
        set /a maxlen=!len!
        set "longest=%%F"
    )
)

(
echo Longest Path: %longest%
echo Length: %maxlen% characters
) > "M:\longest_path.txt"

echo Done! Result saved in M:\10-Contractor_Contractslongest_path.txt
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
