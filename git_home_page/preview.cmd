@echo off
setlocal

where ruby >nul 2>nul
if errorlevel 1 set "PATH=C:\Ruby33-x64\bin;%PATH%"

for /f "delims=" %%I in ('bundle show jekyll') do set "JEKYLL_HOME=%%I"
if not defined JEKYLL_HOME (
  echo Jekyll was not found. Run: bundle install
  pause
  exit /b 1
)

ruby -rbundler/setup -r./_plugins/ruby_compat.rb "%JEKYLL_HOME%\exe\jekyll" serve --baseurl "" --host 127.0.0.1 --port 4000
