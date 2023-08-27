setlocal

rem Check if makerom.exe exists
where makerom.exe > nul 2>&1
if %errorlevel% neq 0 (
    echo makerom.exe not found.
    exit /b 1
)

rem Go through every .cia in current directory, convert to CCI with makerom, rename to use .3ds extension for Tower
for %%F in (*.cia) do (
    if exist "%%F" (
        echo Running makerom.exe -ciatocci %%F...
        makerom.exe -ciatocci "%%F"
		echo Renaming...
		ren "%%~dpnF.cci" "%%~nF.3ds"
    )
)

endlocal
