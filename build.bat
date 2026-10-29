@echo off
REM Builds the site into the _site folder (the same way GitHub does), without
REM starting a server. Useful for checking for errors before you commit.
cd /d "%~dp0"

if not exist vendor\bundle (
  echo Gems are not installed yet - running setup first...
  call setup.bat
)

call bundle exec jekyll build %*
if errorlevel 1 (
  echo.
  echo BUILD FAILED - read the error above.
) else (
  echo.
  echo Build succeeded. Output is in the _site folder.
)
pause
