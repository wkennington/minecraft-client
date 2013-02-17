move %APPDATA%\.minecraft\saves %~dp0
rmdir /s /q %APPDATA%\.minecraft
mklink /D %APPDATA%\.minecraft %~dp0
