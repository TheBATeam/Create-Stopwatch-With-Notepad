Rem This Awesome small application in Batch is created by Catur Surya... and modified and fixed by kvc

@echo off
setlocal enabledelayedexpansion
color f0
title Stopwatch C.
mode 40,10

:: minute
set menit=0

:: hours
set jam=0

::preceeding zero
set pre=0
set pre_count=1

:start
cls
echo.
echo.
echo.
echo.
echo             PRESS H TO START
choice /c h /n
if errorlevel 1 goto stopwatch
goto start

:stopwatch
cls
for /L %%a in (0 1 59) do (
echo            PRESS S TO STOP
echo            PRESS P TO Pause
echo.
echo.
echo.
echo.
for %%A in (!jam! !menit! %%a) do (
	IF %%A lss 10 (
		set pre_!pre_count!=0
			) else (
			set pre_!pre_count!=
		)
	set /a pre_count+=1
	)
echo                 !pre_1!!jam!:!pre_2!!menit!:!pre_3!%%a
choice /c ÷sp /d ÷ /t 1 /n >nul
if /i "!errorlevel!" == "2" (
	echo. Stopped...
	Call :stop
	set menit=0
	set jam=0
	goto :start
	)
if /i "!errorlevel!" == "3" (
	Echo. Paused...
	Call :stop
	)
cls
set pre_count=1
)
set /a menit+=1
if !menit! geq 60 (
set /a jam+=1
set menit=0
goto stopwatch
)
goto stopwatch

:stop
echo.
echo Press any key to restart...
echo.
pause>nul
exit /b