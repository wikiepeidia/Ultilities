@echo off
setlocal

set VSWHERE="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"

if not exist %VSWHERE% (
    echo ❌ vswhere not found.
    exit /b 1
)

for /f "usebackq delims=" %%I in (
    `%VSWHERE% -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`
) do (
    call "%%I\Common7\Tools\VsDevCmd.bat"
    goto :FOUND
)

echo ❌ MSVC tools not found.
exit /b 1

:FOUND
code
exit
