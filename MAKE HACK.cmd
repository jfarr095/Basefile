cd %~dp0

copy FE8_clean.gba BasefileTest.gba

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0BasefileTest.gba" "-input:%~dp0ROM Buildfile.event"

pause
