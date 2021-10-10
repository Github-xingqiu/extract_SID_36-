














rem Extract data based on effective bytes
for /f "skip=%2 tokens=1-14 delims= " %%a in ( %1 ) do (
::skip参数不支持变量延迟
if !effectiveByte! EQU 1 ( set /a effectiveByte-=1 && >>%~n1_refine.txt set /p=%%h<nul)
if !effectiveByte! EQU 2 ( set /a effectiveByte-=2 && >>%~n1_refine.txt set /p=%%h%%i<nul)
if !effectiveByte! EQU 3 ( set /a effectiveByte-=3 && >>%~n1_refine.txt set /p=%%h%%i%%j<nul)
if !effectiveByte! EQU 4 ( set /a effectiveByte-=4 && >>%~n1_refine.txt set /p=%%h%%i%%j%%k<nul)
if !effectiveByte! EQU 5 ( set /a effectiveByte-=5 && >>%~n1_refine.txt set /p=%%h%%i%%j%%k%%l<nul)
if !effectiveByte! EQU 6 ( set /a effectiveByte-=6 && >>%~n1_refine.txt set /p=%%h%%i%%j%%k%%l%%m<nul)
if !effectiveByte! GEQ 7 ( set /a effectiveByte-=7 && >>%~n1_refine.txt set /p=%%h%%i%%j%%k%%l%%m%%n<nul)
if !effectiveByte! EQU 0 ( goto end)
)

:end






