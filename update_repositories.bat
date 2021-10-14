@echo off
set "BORDER=========================================================================="
FOR /F %%G in ('dir /b/ad') DO (call :subroutine "%%G")
GOTO :eof

:subroutine
echo %BORDER%
set "wdir=%~1"
echo Current Repository - %wdir%
cd %wdir%
git status &&(
    git add . && git commit -am --no-edit
    git push --all origin
) || (
    echo Not a git directory
)
cd ..
GOTO :eof