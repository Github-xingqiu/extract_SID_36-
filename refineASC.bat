
rem Enter the asc file you want to extract




rem Specify the compiler
set hexview_exe=D:\myTask\HexView\hexview.exe




rem Specify the file to be operated on
%hexview_exe% %1 /AR:0x0EE7934B-0x0FF936D8 /XN /s -o %~n1_628P697789_To_654P443782.bin
%hexview_exe% %1 /AR:0x1563E6E4-0x15C7DA33 /XN /s -o %~n1_822P132082_To_847P802339.bin


::--------------------------------------------------------------------------------------------------------------------------------------

rem Filter three IDs: 17FC0244x、17FD0200x、17FE0244x
rem Use spaces as the dividing condition, and use the effective byte length and the first byte as judgments to extract data
for /f "tokens=1-14 delims= " %%a in (%~n1_628P697789_To_654P443782.bin) do (
if %%c EQU 17FC0244x (>>ID_628To654_17FC0244x.txt echo %%a %%b    %%c    %%d %%e %%f        %%g %%h %%i %%j %%k %%l %%m %%n)
)


for /f "tokens=1-14 delims= " %%a in (%~n1_822P132082_To_847P802339.bin) do (
if %%c EQU 17FC0244x (>>ID_822To847_17FC0244x.txt echo %%a %%b    %%c    %%d %%e %%f        %%g %%h %%i %%j %%k %%l %%m %%n)
)




::-------------------------------------------------------------------------
rem Circular comparison of target text
::--------------------------------------------------

setlocal enabledelayedexpansion


set /a currentLine=0
for /f "tokens=1-14 delims= " %%a in ( ID_628To654_17FC0244x.txt ) do (

set /a currentLine+=1
set /a firstByte=0x%%g">>"4
::multieFrame 
if !firstByte! EQU 1 (
if %%i EQU 36 (

set /a effectiveByte=0x%%g%%h-0x1000
set /a effectiveByte-=6 && >>ID_628To654_17FC0244x_refine.txt set /p=%%k%%l%%m%%n<nul

CALL refineASC_multieFrame.bat ID_628To654_17FC0244x.txt !currentLine!
)
)

::sigleFrame
if 0x%%g LEQ 7 (
if %%h EQU 36 (

if 0x%%g EQU 2 ( >>ID_628To654_17FC0244x_refine.txt set /p=%%i<nul)
if 0x%%g EQU 3 ( >>ID_628To654_17FC0244x_refine.txt set /p=%%i%%j<nul)
if 0x%%g EQU 4 ( >>ID_628To654_17FC0244x_refine.txt set /p=%%i%%j%%k<nul)
if 0x%%g EQU 5 ( >>ID_628To654_17FC0244x_refine.txt set /p=%%i%%j%%k%%l<nul)
if 0x%%g EQU 6 ( >>ID_628To654_17FC0244x_refine.txt set /p=%%i%%j%%k%%l%%m<nul)
if 0x%%g EQU 7 ( >>ID_628To654_17FC0244x_refine.txt set /p=%%i%%j%%k%%l%%m%%n<nul)
)
)

)
%hexview_exe% /s /IA:ID_628To654_17FC0244x_refine.txt /XI /s -o ID_628To654_17FC0244x_refine.hex
::----------------------------------------------------------

set /a currentLine=0
for /f "tokens=1-14 delims= " %%a in ( ID_822To847_17FC0244x.txt ) do (

set /a currentLine+=1
set /a firstByte=0x%%g">>"4
 ::multieFrame
if !firstByte! EQU 1 (
if %%i EQU 36 (
set /a effectiveByte=0x%%g%%h-0x1000
set /a effectiveByte-=6 && >>ID_822To847_17FC0244x_refine.txt set /p=%%k%%l%%m%%n<nul

CALL refineASC_multieFrame.bat ID_822To847_17FC0244x.txt !currentLine!
)
)

::sigleFrame
if 0x%%g LEQ 7 (
if %%h EQU 36 (

if 0x%%g EQU 2 ( >>ID_822To847_17FC0244x_refine.txt set /p=%%i<nul)
if 0x%%g EQU 3 ( >>ID_822To847_17FC0244x_refine.txt set /p=%%i%%j<nul)
if 0x%%g EQU 4 ( >>ID_822To847_17FC0244x_refine.txt set /p=%%i%%j%%k<nul)
if 0x%%g EQU 5 ( >>ID_822To847_17FC0244x_refine.txt set /p=%%i%%j%%k%%l<nul)
if 0x%%g EQU 6 ( >>ID_822To847_17FC0244x_refine.txt set /p=%%i%%j%%k%%l%%m<nul)
if 0x%%g EQU 7 ( >>ID_822To847_17FC0244x_refine.txt set /p=%%i%%j%%k%%l%%m%%n<nul)
)
)

)
%hexview_exe% /s /IA:ID_822To847_17FC0244x_refine.txt /XI /s -o ID_822To847_17FC0244x_refine.hex
::----------------------------------------------------------

















