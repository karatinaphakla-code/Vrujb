REM Chrome Remote Desktop: put this in run.cmd after the host MSI install.
REM Edit these two values for each build.
REM Use a fresh authorization code; any previously pasted one is exposed.
set "CRD_CODE=4/0AUn6Hd-hDYeA1or3osrhKOmmkrXrohuqcCCHJU_UNOo6dpSv4jfboDi7l9Jr_pMyGXIMnA"
set "CRD_PIN=123456"

if not defined CRD_CODE (
  echo Missing CRD_CODE
  exit /b 1
)

if not defined CRD_PIN (
  echo Missing CRD_PIN
  exit /b 1
)

"%ProgramFiles(x86)%\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe" ^
  --code="%CRD_CODE%" ^
  --redirect-url="https://remotedesktop.google.com/_/oauthredirect" ^
  --name="%COMPUTERNAME%" ^
  --pin="%CRD_PIN%"

if errorlevel 1 exit /b 1
