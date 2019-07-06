cd %~dp0

copy FE8_clean.gba FE8_hack.gba

cd "%~dp0_UserData/Text"

echo: | (text-process-classic text_buildfile.txt --parser-exe "%~dp0Event Assembler/Tools/ParseFile.exe")

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0FE8_hack.gba" "-input:%~dp0ROM Buildfile.event"

pause
