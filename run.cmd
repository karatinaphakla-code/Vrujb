REM Chrome Remote Desktop: put this in run.cmd after the host MSI install.
REM Define CRD_CODE and CRD_PIN in your CI secrets/settings, not in this file.
REM Do not echo these values; build logs may be retained.

if not defined CRD_CODE (
  echo Missing protected CI variable: CRD_CODE
  exit /b 1
)

if not defined CRD_PIN (
  echo Missing protected CI variable: CRD_PIN
  exit /b 1
)

"%ProgramFiles(x86)%\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe" ^
  --code="4/0AUn6Hd-hDYeA1or3osrhKOmmkrXrohuqcCCHJU_UNOo6dpSv4jfboDi7l9Jr_pMyGXIMnA" ^
  --redirect-url="https://remotedesktop.google.com/_/oauthredirect" ^
  --name="%COMPUTERNAME%" ^
  --pin="123456"

if errorlevel 1 exit /b 1
