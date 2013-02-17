@ECHO OFF
xcopy %~dp0\config.git %~dp0\config /E /Y
move %APPDATA%\.minecraft\saves %~dp0
move %APPDATA%\.minecraft\stats %~dp0
move %APPDATA%\.minecraft\lastlogin %~dp0
move %APPDATA%\.minecraft\options.txt %~dp0
rmdir /s /q %APPDATA%\.minecraft
mklink /D %APPDATA%\.minecraft %~dp0
pause