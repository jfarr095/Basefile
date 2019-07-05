cd %~dp0

copy FE8_clean.gba FE8_hack.gba

cd "%~dp0Event Assembler"

ColorzCore A FE8 "-output:%~dp0FE8_hack.gba" "-input:%~dp0ROM Buildfile.event"

pause
