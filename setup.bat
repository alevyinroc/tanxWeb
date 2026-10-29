@echo off
REM One-time setup on Windows: installs the Ruby gems this site needs.
REM Gems go into this folder (vendor\bundle), so no admin rights are needed.
REM Run again any time the Gemfile changes.
cd /d "%~dp0"

where ruby >nul 2>nul
if errorlevel 1 (
  echo.
  echo Ruby was not found. Install it first - see "Windows setup" in README.md
  echo.
  pause
  exit /b 1
)

ruby -v
call bundle config set --local path vendor/bundle
call bundle install
if errorlevel 1 (
  echo.
  echo Gem install failed. If the error mentions "make" or "MSYS2", run:  ridk install
  echo and choose option 3, then run setup.bat again.
  pause
  exit /b 1
)
echo.
echo Setup complete. Double-click serve.bat to preview the site.
pause
