@echo off
REM Builds the site and runs a local preview at http://localhost:4000/
REM Pages rebuild automatically when you save a file. Press Ctrl+C to stop.
REM (Changes to _config.yml need a restart.)
cd /d "%~dp0"

if not exist vendor\bundle (
  echo Gems are not installed yet - running setup first...
  call setup.bat
)

call bundle exec jekyll serve --livereload --open-url %*
pause
