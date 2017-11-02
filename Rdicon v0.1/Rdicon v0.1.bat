::Rdicon v0.1
::Author: Mario Alanzo Junior Mills 1 Nov 2017
::License: GNU GPL
setlocal EnableDelayedExpansion
dir icon /b /a-d> listforicons.txt
::
set INPUT_FILE="listforicons.txt"

:: # Count the number of lines in the text file and generate a random number
for /f "usebackq" %%a in (`find /V /C "" ^< %INPUT_FILE%`) do set lines=%%a
set /a randnum=%RANDOM% * lines / 32768 + 1, skiplines=randnum-1

:: # Extract the line from the file
set skip=
if %skiplines% gtr 0 set skip=skip=%skiplines%
for /f "usebackq %skip% delims=" %%a in (%INPUT_FILE%) do set "randline=%%a" & goto continue
:continue

set m1=[Autorun]
set m2=icon^=icon\!randline!

echo !m1!>Autorun.inf
echo !m2!>>Autorun.inf
del /Q /F listforicons.txt



