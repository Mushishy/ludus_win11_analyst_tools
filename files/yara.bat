@ECHO OFF

REM TAKEN FROM https://gist.github.com/p4yl0ad/d8885fbe54950fa26136d4b91a2e72d6 (modified)

SETLOCAL ENABLEDELAYEDEXPANSION

ECHO[            
ECHO  d8b                                  d8b                                                  
ECHO  ?88                     d8P          ?88                                                  
ECHO   88b                 d888888P         88b                                                 
ECHO   888888b    d888b8b    ?88'   d8888b  888888b     ?88   d8P  d888b8b     88bd88b d888b8b  
ECHO   88P `?8b  d8P' ?88    88P   d8P' `P  88P `?8b    d88   88  d8P' ?88     88P'  `d8P' ?88  
ECHO  d88,  d88  88b  ,88b   88b   88b     d88   88P    ?8(  d88  88b  ,88b   d88     88b  ,88b 
ECHO d88'`?88P'  `?88P'`88b  `?8b  `?888P'd88'   88b    `?88P'?8b `?88P'`88b d88'     `?88P'`88b
ECHO                                                           )88                              
ECHO                                                          ,d8P                              
ECHO                                                       `?888P'                              
ECHO v0.9 ^| p4 ^| 2023-12-23
ECHO[      

SET list="https://github.com/SigmaHQ/sigma.git"
SET list=%list%;"https://github.com/elastic/protections-artifacts.git"
SET list=%list%;"https://github.com/InQuest/yara-rules-vt.git"
SET list=%list%;"https://github.com/Neo23x0/signature-base.git"
SET list=%list%;"https://github.com/bartblaze/Yara-rules.git"
SET list=%list%;"https://github.com/embee-research/Yara-detection-rules.git"
SET list=%list%;"https://github.com/Yara-Rules/rules.git"
SET list=%list%;"https://github.com/VirusTotal/yara.git"
SET list=%list%;"https://github.com/reversinglabs/reversinglabs-yara-rules.git"
SET list=%list%;"https://github.com/Te-k/cobaltstrike.git"
SET list=%list%;"https://github.com/chronicle/GCTI.git"
SET list=%list%;"https://github.com/avast/ioc.git"
SET list=%list%;"https://github.com/JPCERTCC/MalConfScan.git"
SET list=%list%;"https://github.com/CodeXTF2/cobaltstrike-sleepmask-yara.git"
SET list=%list%;"https://github.com/airbnb/binaryalert.git"
SET list=%list%;"https://github.com/telekom-security/malware_analysis.git"
SET list=%list%;"https://github.com/eset/malware-ioc.git"
SET list=%list%;"https://github.com/mandiant/red_team_tool_countermeasures.git"
SET list=%list%;"https://github.com/securitymagic/yara.git"
SET list=%list%;"https://github.com/mikesxrs/Open-Source-YARA-rules.git"
SET list=%list%;"https://github.com/malpedia/signator-rules.git"
SET list=%list%;"https://github.com/advanced-threat-research/Yara-Rules.git"
SET list=%list%;"https://github.com/paranoidninja/Cobaltstrike-Detection.git"
SET list=%list%;"https://github.com/ctxis/CAPE.git"
SET list=%list%;"https://github.com/netskopeoss/NetskopeThreatLabsIOCs.git"
REM SET LIST=%list%;"https://github.com/magicsword-io/LOLDrivers.git"
SET LIST=%list%;"https://github.com/SupportIntelligence/Icewater.git"
SET LIST=%list%;"https://github.com/kevthehermit/YaraRules.git"
SET LIST=%list%;"https://github.com/fboldewin/YARA-rules.git"
SET LIST=%list%;"https://github.com/tenable/yara-rules.git"
SET LIST=%list%;"https://github.com/MalGamy/YARA_Rules.git"
SET LIST=%list%;"https://github.com/0pc0deFR/YaraRules.git"
SET LIST=%list%;"https://github.com/citizenlab/malware-signatures.git"
SET LIST=%list%;"https://github.com/malware-kitten/public_yara_rules.git"
SET LIST=%list%;"https://github.com/100DaysofYARA/2023.git"
SET LIST=%list%;"https://github.com/hvs-consulting/ioc_signatures.git"
SET LIST=%list%;"https://github.com/StrangerealIntel/Orion.git"
SET LIST=%list%;"https://github.com/ag-michael/Inboxscanner.git"
SET LIST=%list%;"https://github.com/VirusTotal/vt-public-crowdsourced-yara.git"
SET LIST=%list%;"https://github.com/abhinavbom/Yara-Rules.git"
SET LIST=%list%;"https://github.com/jipegit/yara-rules-public.git"
SET LIST=%list%;"https://github.com/AhmetPayaslioglu/YaraRules.git"
SET LIST=%list%;"https://github.com/lprat/static_file_analysis.git"
SET LIST=%list%;"https://github.com/telekom-security/malware_analysis.git"
SET LIST=%list%;"https://github.com/ProIntegritate/Yara-rules.git"
SET LIST=%list%;"https://github.com/dr4k0nia/yara-rules.git"
SET LIST=%list%;"https://github.com/sisoma2/malware_analysis.git"
SET LIST=%list%;"https://github.com/SadFud/YARA.Rules.git"
SET LIST=%list%;"https://github.com/h3x2b/yara-rules.git"
SET LIST=%list%;"https://github.com/stratosphereips/yara-rules.git"
SET LIST=%list%;"https://github.com/paralax/HorribleCanoe.git"
SET LIST=%list%;"https://github.com/VectraThreatLab/reyara.git"
SET LIST=%list%;"https://github.com/0day1day/yarasigs.git"
SET LIST=%list%;"https://github.com/imp0rtp3/yara-rules.git"

SET targetfile=%1
SET "TAB=	"
SET ruledir=RULE_REPOS
SET yarainstall=https://github.com/VirusTotal/yara/releases/download/v4.5.2/yara-v4.5.2-2326-win64.zip
SET yarazip=yara-4.5.2-2326-win64.zip
SET yaradir=yara-4.5.2-2326-win64
SET yarapath=%yaradir%\yara64.exe

IF ["%~1"]==[""] (
    GOTO :USAGE
) ELSE (
    GOTO :START
)

:USAGE
ECHO First time run: %0 . install
ECHO Normal   Usage: %0 path
ECHO Normal   Usage: %0 PID
ECHO[
ECHO For example with a path or a PID: 
ECHO Example: yara.bat Z:\PAYLOADS\SHELLCODE\calc.bin
ECHO Example: yara.bat 6969
ECHO[
EXIT /B 3

:START
if ["%~2"]==["install"] (
    GOTO :REINSTALL
) else (
    ECHO %TAB% [*] Using existing yara directory
    GOTO :HUNT
)

:REINSTALL
ECHO [i] Checking if the directory %ruledir% exists
IF EXIST %ruledir% (
	ECHO %TAB% [*] Deleting %CD%\%ruledir%
	RMDIR /S /Q %ruledir%
	MKDIR %ruledir%
) ELSE (
	ECHO %TAB% [+] Creating %CD%\%ruledir% directory
	MKDIR %ruledir%
)

ECHO [i] Checking if the directory %yaradir% exists
IF EXIST %yaradir% (
	ECHO %TAB% [*] Deleting existing %yaradir% directory
	RMDIR /S /Q %yaradir%
) ELSE (
	ECHO %TAB% [i] %yaradir% directory doesn't exist
)

ECHO [i] Checking if the ZIP file %yarazip% exists
IF EXIST %yarazip% (
	ECHO %TAB% [*] Deleting and installing %yarazip%
	DEL /Q %yarazip%
	curl.exe --silent -L %yarainstall% -o %yarazip%
) ELSE (
	ECHO %TAB% [i] Downloading yara.zip
	curl.exe --silent -L %yarainstall% -o %yarazip%
)

ECHO [i] Checking if the ZIP file %yarazip% exists
IF EXIST %yarazip% (
	ECHO %TAB% [*] Unzipping %yarazip%
	powershell -c "Expand-Archive -Force %yarazip%"
) ELSE (
	ECHO %TAB% [x] Something went wrong downloading %yarazip%
	EXIT /B 3
)

ECHO [i] Checking if %yarapath% exists
IF EXIST %yarapath% (
	ECHO %TAB% [*] %yarapath% exists, good!
	ECHO %TAB% [*] Cleaning up archive %yarazip%!
	DEL /Q %yarazip%
	
	ECHO %TAB% [*] Proceeding to install!
	GOTO :INSTALL
) ELSE (
	ECHO %TAB% [x] Something went wrong downloading %yarazip%, %yarapath% doesn't exist
	EXIT /B 3
)

:INSTALL
FOR %%x IN (%list%) DO ( 
	FOR /F "tokens=1,2,3,4 delims=/" %%e IN ("%%x") DO (
		SET first=%%e
		SET second=%%f
		SET third=%%g
		SET fourth=%%h
		
		ECHO %TAB% [i] git clone %%x %ruledir%\!third!!fourth!
		"C:\Program Files\Git\cmd\git.exe" clone %%x %ruledir%\!third!!fourth!
	)
)

GOTO :eof

:HUNT
@REM
@REM You can add / remove path match clauses below here:
@REM	Just make sure you end the line with ^ and apply your brain if a powershell command gets interpreted as a cmd command
@REM		That likely means you need to escape the previous token 
@REM

powershell -c ^
"foreach ($yarafilepath in (Get-ChildItem -Path . -Recurse -Include '*.yar*' ^| Where-Object {$_.name -match ^
'windows'^
-or $_.name -match 'win'^
-or $_.name -match 'cobalt' ^
-or $_.name -match 'beacon' ^
-or $_.name -match 'strike' ^
-or $_.name -match 'cobaltstrike' ^
-or $_.name -match 'hacktool' ^
-or $_.name -match 'microsoft' ^
-or $_.name -match 'win32' ^
-or $_.name -match 'encrypted' ^
} ^| select fullname)) { echo $yarafilepath.Fullname; %yarapath% --no-warnings --define=filename=%targetfile% --print-namespace --print-strings $yarafilepath.Fullname %targetfile% }"

GOTO :eof
ENDLOCAL ENABLEDELAYEDEXPANSION
@ECHO ON