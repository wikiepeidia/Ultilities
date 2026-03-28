@echo off
setlocal ENABLEEXTENSIONS

REM --- List of possible VS Dev Cmd locations ---
set VSDEV1=C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat
set VSDEV2=C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\VsDevCmd.bat
set VSDEV3=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\VsDevCmd.bat
set VSDEV4=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat

REM --- Find the first one that exists ---
for %%F in ("%VSDEV1%" "%VSDEV2%" "%VSDEV3%" "%VSDEV4%") do (
    if exist %%F (
        call %%F
        goto :FOUND
    )
)

echo ❌ Visual Studio 2022 Developer Command Prompt not found.
echo Install VS 2022 or Build Tools.
pause
exit /b 1

:FOUND
echo  MSVC environment loaded.
code
exit

