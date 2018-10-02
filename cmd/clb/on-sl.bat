@echo off
call vars-wnotes.bat
openvpn.exe --config %WNOTES_ROOT%\clb\ovpn\clb.ovpn
