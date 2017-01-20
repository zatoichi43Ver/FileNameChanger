@ECHO OFF
setlocal enabledelayedexpansion
set a=1
for %%f in (*.*) do (
  set /p val=<%%f
  set fileName=%%~nf%%~xf
  set modifiedDate=%%~tf__!a!%%~xf

  SET _result=!modifiedDate:/=_!
  SET _result=!_result: =_!
  SET _result=!_result::=-!

  IF NOT %%f == batchfile.bat (
    ren "!fileName!" "!_result!"
    set /a a=a+1
  )

)

pause