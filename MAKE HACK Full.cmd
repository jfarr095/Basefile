cd %~dp0

copy FE8_clean.gba BasefileTest.gba

cd "%~dp0_UserData/Text"

echo: | (text-process-classic text_buildfile.txt --parser-exe "%~dp0Event Assembler/Tools/ParseFile.exe")

cd "%~dp0_UserData/Maps"

echo: | (tmx2ea -s)

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0BasefileTest.gba" "-input:%~dp0ROM Buildfile.event"

if exist "%~dp0ups/ups.exe" (
    cd "%~dp0ups"
    ups diff -b "%~dp0FE8_clean.gba" -m "%~dp0BasefileTest.gba" -o "%~dp0BasefileTest.ups"
)

pause
