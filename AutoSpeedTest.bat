@ECHO OFF
title Automatic Speed Test App
set/p Rtime=  How many seconds should the speed test be done? (recommended time 600s = 10m):
:loop 
:Start
ECHO.==============================================================================
ECHO. Automatic SpeedTest App Running... [Runtime: %date% / %time%]
ECHO.==============================================================================
ECHO. Ping test in progress...
ECHO.=========================[Start: %date% / %time%]=========================== >> results.txt
ECHO. >> results.txt
Call:CloudFlare 1.1.1.1
ECHO. -CloudFlare DNS 1.1.1.1 ping: %ms% >> results.txt
Call:CloudFlare 1.1.1.1
ECHO. -CloudFlare DNS 1.1.1.1 ping: %ms%
Call:Google 8.8.8.8
ECHO. -Google DNS 8.8.8.8 ping: %ms% >> results.txt
Call:Google 8.8.8.8
ECHO. -Google DNS 8.8.8.8 ping: %ms%
Call:Quad9 9.9.9.9
ECHO. -Quad9 DNS 9.9.9.9 ping: %ms% >> results.txt
Call:Quad9 9.9.9.9
ECHO. -Quad9 DNS 9.9.9.9 ping: %ms%
ECHO.==============================================================================
ECHO. Speed test in progress...
speedtest.exe >> results.txt
ECHO. >> results.txt
ECHO.=========================[End: %date% / %time%]============================= >> results.txt
ECHO. >> results.txt
ECHO. Internet speed test results are in "results.txt" file.
timeout /t %Rtime% 
goto loop
:CloudFlare
:Google
:Quad9
SET ms=Error
FOR /F "tokens=4 delims==" %%i IN ('ping.exe -n 4 %1 ^| FIND "ms"') DO SET ms=%%i
GOTO:EOF