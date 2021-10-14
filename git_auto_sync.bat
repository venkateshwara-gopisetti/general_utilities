@echo off

set SCRIPT_START=%DATE%__%TIME%
:: Set Variables
set LOG_FOLDER=github_sync_logs\%DATE%
set LOG_FILE=%LOG_FOLDER%\sync.log

:: Creating TOP border for log file
for %%a in (
-------------------------------------------------------------------------
GITHUB_SYNC_RUN__%DATE%__%TIME%
-------------------------------------------------------------------------
) DO (call :printroutine %%a)

:: Check if folder exists, create is does not exist
IF exist %LOG_FOLDER% (echo LOG FOLDER exists) ELSE (mkdir %LOG_FOLDER%)

:: Call sync routine
call :sync_routine

:: Creating Bot border for log file
for %%a in (
-------------------------------------------------------------------------
GITHUB_SYNC_RUN__%SCRIPT_START%
-------------------------------------------------------------------------
..
#########################################################################
..
) DO (call :printroutine %%a)

GOTO :eof

:: printroutine to print list of strings
:printroutine
set "msg=%~1"
echo %msg%
echo %msg% >> %LOG_FILE%
GOTO :eof

:: syncroutine to run the batch file
:sync_routine
@echo off
for /f "delims=" %%k in ('general_utilities\update_repositories.bat') do (
  echo %%k
  echo %%k >> %LOG_FILE%
)
GOTO :eof