set "BORDER=========================================================================="
FOR /F %%G in ('dir /b/ad') DO (call :subroutine "%%G")
GOTO :eof

:subroutine
echo %BORDER%
set "wdir=%~1"
echo Current Repository - %wdir%
cd %wdir%
git add . && git commit -am --no-edit
git push --all origin
cd ..
GOTO :eof