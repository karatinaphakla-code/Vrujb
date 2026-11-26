:: AppVeyor RDP with NGROK
:: Copyright (C) 2026 Vichingo455
::
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU Affero General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU Affero General Public License for more details.
::
:: You should have received a copy of the GNU Affero General Public License
:: along with this program.  If not, see <https://www.gnu.org/licenses/>.
::
:: Ngrok and AppVeyor are trademarks owned by their respective company.
@echo off
set AUTHTOKEN=place_authtoken_here
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
net user appveyor P@ssw0rd!
choco install ngrok -y
ngrok config add-authtoken %AUTHTOKEN%
ngrok tcp 3389
