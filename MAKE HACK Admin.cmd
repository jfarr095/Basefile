cd %~dp0

copy FE8_clean.gba BasefileTest.gba

cd "%~dp0Tables"

echo: | (c2eanopfinder "%~dp0FE8_clean.gba")

cd "%~dp0Text"

echo: | (text-process-classic text_buildfile.txt --parser-exe "%~dp0Event Assembler/Tools/ParseFile.exe")

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0BasefileTest.gba" "-input:%~dp0ROM Buildfile.event"

pause
