:: This is a small BATCH file which ease to use cmd on multiple folders.
:: version 1.0
@echo OFF

:: Note: the ~ character is for removing the quotes in arguments
set command=%~1
set specified_folders=%~2

if "%command%"=="" if "%specified_folders%"=="" (
	echo Usage: bulk-cmd.bat ["batch-command"] ["directory-patterns-separated-by-spaces"]
	goto:eof
)



if "%specified_folders%"=="" (
	:: If no projects specified, apply command to all 1st level sub-directory
	set projects=*
) 

if not "%specified_folders%"=="" (
	set projects=%specified_folders%
)

set final_cmd=%command%
for /D %%G in (%projects%) do %final_cmd%